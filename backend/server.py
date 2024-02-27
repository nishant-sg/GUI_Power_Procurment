from flask import Flask
from flask_cors import CORS

# will run on http://localhost:5000
app = Flask(__name__)

# Enable CORS for all routes
CORS(app)  

@app.route('/test')
def test():
    return 'Hello World! Test API is working properly.'

if __name__ == '__main__':
    app.run(debug=True)
