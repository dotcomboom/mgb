from flask import Flask, request
app = Flask(__name__)

users= {
    'foo': {
        'login': 'foo',
        'password': 'bar',
        'secretquestion': 'Name of first pet?',
        'email': 'foo@bar.com',
        'secretanswer': 'Perky',
        'dob': '12/31/2006'
    }
}

@app.route("/")
def index():
    return 'hello'
    
@app.route("/crossdomain.xml")
def cd():
    return app.send_static_file('crossdomain.xml')
    
@app.route("/user/flex_heartbeat_safe", methods=["POST"])
def heartbeat():
    print(request.headers)
    return "good"
    
@app.route("/user/flexcreateuser", methods=["POST"])
def flexcreateuser():
    if request.form['login'] in users:
        return "No!"
    else:
        print(request.form)
        return "ok"
@app.route("/user/flexlogin", methods=["POST"])
def flexlogin():
    return "ok"
    
@app.route("/log/logbug", methods=["POST"])
def logbug():
    print(request.form)
    return "good"
 
if __name__ == '__main__':
    app.run(debug=True, port=3000)