// To parse this JSON data, do
//
//     final prediction = predictionFromJson(jsonString);

import 'dart:convert';

Prediction predictionFromJson(String str) => Prediction.fromJson(json.decode(str));

String predictionToJson(Prediction data) => json.encode(data.toJson());

class Prediction {
  Prediction({
    required this.diseasePrediction,
  });

  String diseasePrediction;

  factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
    diseasePrediction: json["Disease Prediction"],
  );

  Map<String, dynamic> toJson() => {
    "Disease Prediction": diseasePrediction,
  };
}
