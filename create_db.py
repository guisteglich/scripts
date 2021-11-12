import psycopg2
from psycopg2 import sql
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
import os

dbUser = os.getenv('DATABASE_USER', 'postgres')
dbPassword = os.getenv('DATABASE_PASSWORD', 'postgres')
dbURL = os.getenv('DATABASE_HOST', '127.0.0.1')
dbPort = os.getenv('DATABASE_PORT', '5432')
dbName1 = os.getenv('DATABASE_NAME_FILES', 'tot-files')
dbName2 = os.getenv('DATABASE_NAME_AUTH', 'tot-auth')

db_list = [dbName1, dbName2]


def exist_db(dbName):
        try:
            # conn_string = 'host={0} user={1} password={2}'.format(dbURL, dbUser, dbPassword)
            # conn = psycopg2.connect(conn_string)
            conn = psycopg2.connect(host=dbURL, port=dbPort, user=dbUser,
                                    password=dbPassword, database=dbName, connect_timeout=1)
            conn.close()
            return True

        except Exception as e:
            print('exist_db -> Exception -> ' + str(e))
            return False

def create_db(dbName):
        try:

            # CRIA O BANCO
            conn = psycopg2.connect(host=dbURL, port=dbPort, user=dbUser, 
                                    password=dbPassword)

            print("conectado")

            conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
            cur = conn.cursor()
            cur.execute(sql.SQL('''CREATE DATABASE {}
                                    WITH 
                                    OWNER = postgres
                                    ENCODING = 'UTF8'
                                    TABLESPACE = pg_default
                                    CONNECTION LIMIT = -1;''').format(
                                    sql.Identifier(dbName)))
            conn.commit()
            print("DB {} created".format(dbName))
            conn.close()


            return 

        except Exception as e:
            print('create_db -> Exception -> ' + str(e))
            return False

for db in db_list:
    exists = exist_db(db)
    print("does the db {} exists? ".format(db), exists)
    if exists != True:
        create_db(db)
