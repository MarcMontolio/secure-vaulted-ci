# examples/dummy-app/src/app.py
from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route("/health")
def health():
    user = open("/run/secrets/username").read().strip()
    pw   = open("/run/secrets/password").read().strip()
    return jsonify(status="ok", user=user)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
