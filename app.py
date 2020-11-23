"""
Main application file
"""
from flask import Flask
import logging
app = Flask(__name__)

# Initialize Logger
LOGGER = logging.getLogger()
LOGGER.setLevel(logging.INFO)

@app.route('/<random_string>')
def returnBackwardsString(random_string):
    """Reverse and return the provided URI"""
    LOGGER.info('Received a message: %s', random_string)
    return "".join(reversed(random_string))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
