from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def index():
    return """
    <title>Blitz@ASB</title>
    <h1>Blitz!</h1>
    """

@app.route('/login')
def login():
    return render_template("login.html")

@app.route('/admin')
def admin():
    return render_template("admin.html")

@app.route('/leaderboard')
def leaderboard():
    return render_template("leaderboard.html")

@app.route('/operations')
def operations():
    return render_template("operations.html")

@app.route('/shop')
def shop():
    return render_template("shop.html")

app.run(host='127.0.0.5', port=80, debug=True)