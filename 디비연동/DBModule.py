#DBModule.py
import pymysql

class Database():
    #생성자 - 하나만 생성가능 
    def __init__(self):
        self.db = pymysql.connect(host='localhost',
         user='user01',
         password='1234',
         db='mydb', port=3306)
        self.cursor = self.db.cursor(pymysql.cursors.DictCursor)

    #insert, delete, update
    def execute(self, query, args={}):
        self.cursor.execute(query, args)
        self.db.commit()

    def executeOne(self, query, args={}):
        self.cursor.execute(query, args)
        row = self.cursor.fetchone() 
        #실행 후 첫번째 데이터만 반환한다 
        return row 

    def executeAll(self, query, args={}):
        self.cursor.execute(query, args)
        rows = self.cursor.fetchall() 
        #실행 후 모든 데이터를 반환한다 
        return rows 
    
    def close(self):
        self.db.close()

