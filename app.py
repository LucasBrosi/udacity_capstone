"""This is an app that displays my name"""

from flask import Flask
app = Flask(__name__)


@app.route("/")
def home():
    """relevant code goes here"""
    html = f"<h3>Hello, my name is Lucas</h3>"
    return html.format(format)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True) # specify port=80
