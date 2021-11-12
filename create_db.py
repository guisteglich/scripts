import psycopg2
import os

dbUser = os.getenv('DATABASE_USER', 'postgres')
dbPassword = os.getenv('DATABASE_PASSWORD', 'postgres')
dbURL = os.getenv('DATABASE_HOST', '127.0.0.1')
dbPort = os.getenv('DATABASE_PORT', '5431')
dbName = os.getenv('DATABASE_NAME', 'tot-files')

def exist_db(self):
        try:
            
            conn_string = 'host={0} user={1} dbname={2} password={3}'.format(dbURL, dbUser, dbName, dbPassword)
            conn = psycopg2.connect(conn_string)
            conn.close()
            return True

        except Exception as e:
            print('exist_db -> Exception -> ' + str(e))
            return False

def create_db(self):
        try:

            # CRIA O BANCO
            conn_string = 'host={0} user={1} dbname={2} password={3}'.format(dbURL, dbUser, dbName, dbPassword)
            conn = psycopg2.connect(conn_string)

            print("conectado")

            cursor = conn.cursor()

            cursor.execute("CREATE DATABASE tot-files;")

            cursor.close()
            conn.close()
            return 
            
        except Exception as e:
            print('create_db -> Exception -> ' + str(e))
            return False
