from flask import Flask # type: ignore

app = Flask(__name__)

@app.route("/inverter", methods=['GET'])
def inverter():
    return ["Inverter A", "Inverter B"]

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')