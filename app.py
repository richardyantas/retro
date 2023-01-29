from flask import Flask, request, jsonify
from inference import predict

# curl -XPOST -d @./data.json -H "Content-Type:application/json" http://127.0.0.1:5000

app = Flask(__name__)

@app.route("/", methods=['POST'])
def hello():
	data = request.get_json(force=True)
	# if request.method == 'POST':
	# 	print("POST'd details::", request.json["details"])	
	res = predict(data['details'])
	return jsonify(str(res))

if __name__ == "__main__":
    app.run(host='0.0.0.0')

