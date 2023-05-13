SET(MARIADB_CLIENT_VERSION_MAJOR "10")
SET(MARIADB_CLIENT_VERSION_MINOR "8")
SET(MARIADB_CLIENT_VERSION_PATCH "7")
SET(MARIADB_CLIENT_VERSION_EXTRA "")

SET(MARIADB_CLIENT_VERSION   "${MARIADB_CLIENT_VERSION_MAJOR}.${MARIADB_CLIENT_VERSION_MINOR}.${MARIADB_CLIENT_VERSION_PATCH}${MARIADB_CLIENT_VERSION_EXTRA}")
SET(MARIADB_BASE_VERSION     "mariadb-${MARIADB_CLIENT_VERSION_MAJOR}.${MARIADB_CLIENT_VERSION_MINOR}")
MATH(EXPR MARIADB_VERSION_ID "${MARIADB_CLIENT_VERSION_MAJOR} * 10000 +
                              ${MARIADB_CLIENT_VERSION_MINOR} * 100   +
                              ${MARIADB_CLIENT_VERSION_PATCH}")

SET(CPACK_PACKAGE_VERSION_MAJOR 3)
SET(CPACK_PACKAGE_VERSION_MINOR 3)
SET(CPACK_PACKAGE_VERSION_PATCH 4)

SET(CPACK_PACKAGE_VERSION "${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}")
MATH(EXPR MARIADB_PACKAGE_VERSION_ID "${CPACK_PACKAGE_VERSION_MAJOR} * 10000 +
                            ${CPACK_PACKAGE_VERSION_MINOR} * 100   +
                            ${CPACK_PACKAGE_VERSION_PATCH}")

IF (NOT MARIADB_PORT)
  SET(MARIADB_PORT 3306)
ENDIF ()
IF(NOT MARIADB_UNIX_ADDR)
  SET(MARIADB_UNIX_ADDR "/tmp/mysql.sock")
ENDIF()

SET (PROTOCOL_VERSION 10) # we adapted new password option from PHP's mysqlnd !

IF (NOT DEFAULT_CHARSET)
  SET (DEFAULT_CHARSET "utf8mb4")
ENDIF ()


CONFIGURE_FILE(${CMAKE_CURRENT_LIST_DIR}/ma_config.h.in ${CMAKE_CURRENT_LIST_DIR}/ma_config.h)
CONFIGURE_FILE(${CMAKE_CURRENT_LIST_DIR}/ma_config.h.in ${CMAKE_CURRENT_LIST_DIR}/config.h)
CONFIGURE_FILE(${CMAKE_CURRENT_LIST_DIR}/mariadb_version.h.in ${CMAKE_CURRENT_LIST_DIR}/mariadb_version.h)