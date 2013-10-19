import os
import json
from flask import Flask
from flask import render_template
from flask import jsonify

app = Flask(__name__)

@app.route("/note/<pitch>")
def note(pitch):
    os.environ["PITCH"]=pitch
    return "Note set to "+os.environ["PITCH"]

@app.route("/note/")
def getNote():
    return jsonify(pitch=os.environ["PITCH"])

@app.route("/player/")
def player():
    return render_template('note.html', pitch=os.environ["PITCH"])

if __name__ == "__main__":
    app.run(host='0.0.0.0',debug=True)