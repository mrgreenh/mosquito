import os
import json
from flask import Flask
from flask import render_template
from flask import jsonify
from flask import request
from direttore import Direttore

app = Flask(__name__)
os.environ["PITCH"]="400"

direttore = Direttore()

@app.route('/play/', methods=['POST'])
def play():
    metadata = request.form
    return direttore.store_instrument(metadata)

@app.route("/player/")
def player():
    return render_template('note.html', pitch=os.environ["PITCH"])

@app.route("/instruments/")
def getInstruments():
    return direttore.get_instruments()

if __name__ == "__main__":
    app.run(host='0.0.0.0',debug=True)