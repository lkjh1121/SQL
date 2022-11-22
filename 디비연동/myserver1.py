import json 
from flask import Flask
from flask import Response

app = Flask(__name__)

#라우팅 
@app.route("/")
def index():
    data =[
        dict(name='홍길동', age=14, address='서울시'),
        dict(name='홍길동', age=14, address='서울시'),
        dict(name='홍길동', age=14, address='서울시'),
        dict(name='홍길동', age=14, address='서울시'),
    ]
    response = app.response_class(
        response=json.dumps(data),
        status=200,
        mimetype='application/json',
    )
    response.headers["Content-Type"] = "text/plain; charset=utf-8"
    return response

if __name__ == "__main__":
    app.debug = True  #서버 자동 재시작
    app.run()
