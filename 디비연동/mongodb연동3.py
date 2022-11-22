import pymongo
from pymongo import MongoClient 
from pymongo.collection import ReturnDocument

# db 연동- 목록 가져오기 
from pymongo import MongoClient
conn = MongoClient("mongodb://test:1234@127.0.0.1:27017/")
db = conn.mydb 

# collection 생성
guestbook = db.guestbook # 새로운 컬랙션 생성하기 
'''
db.countCollection.insert({"_id": "guestbook",  seq:0})
db.countCollection.findAndModify({'query': { '_id':'guestbook'}, update: {'$inc':{seq:1}}, 'new': true	})
'''

def get_sequence(name):
    document = db.countCollection.find_one_and_update(
              {"_id":"guestbook"},  #query
              {"$inc": {"seq":1}},  #update
              return_document=True) #new
    #print(document.get('sec'))
    return document['seq']

id = str(get_sequence('guestbook'))
guestbook.insert_one({'id':id, 'title':'제목'+id, 'contents':'내용'+id, 'writer':'홍길동'+id,
                 'wdate':'2019-03-15', 'age':23}); 

rows = db.guestbook.find()
for row in rows :
    print(row)


