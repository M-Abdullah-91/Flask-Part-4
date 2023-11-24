import pymysql

def mysqlconnect():
    db_conn = pymysql.connect(
                              host = "localhost",
                              user = "root",
                              password = "root",
                              database = "library",
                              cursorclass = pymysql.cursors.DictCursor
                              )

    return db_conn


def disconnect(conn):
    conn.close()


conn = mysqlconnect()

