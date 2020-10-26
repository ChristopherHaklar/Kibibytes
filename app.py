"""
Main application file
"""
from flask import Flask
app = Flask(__name__)

@app.route('/<random_string>')
def returnBackwardsString(random_string):
    """Reverse and return the provided URI"""
    return "Breaking the unit test"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
