import '../data/model/prediction_model.dart';

abstract class StockPredictionState {}

class StockPredictionInitial extends StockPredictionState {}

class StockPredictionLoading extends StockPredictionState {}

class StockPredictionSuccess extends StockPredictionState {
  final StockPredictionResponse stockPredictionResponse;

  StockPredictionSuccess(this.stockPredictionResponse);
}

class StockPredictionFailure extends StockPredictionState {
  final String errorMessage;

  StockPredictionFailure(this.errorMessage);
}
