class StockPredictionResponse {
  final String predictionDate;
  final Map<String, double> predictions;

  StockPredictionResponse({
    required this.predictionDate,
    required this.predictions,
  });

  factory StockPredictionResponse.fromJson(Map<String, dynamic> json) {
    return StockPredictionResponse(
      predictionDate: json['prediction_date'] ?? '',
      predictions: Map<String, double>.from(
        (json['predictions'] as Map).map(
          (key, value) => MapEntry(key as String, (value as num).toDouble()),
        ),
      ),
    );
  }
}
