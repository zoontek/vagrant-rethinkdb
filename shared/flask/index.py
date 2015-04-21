from flask import Flask
import rethinkdb as r

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello Rethink!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3000)
