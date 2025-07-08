import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/error/error_func.dart';
import '../data/repository/stock_prediction_repository.dart';
import 'stock_prediction_state.dart';

class StockPredictionCubit extends Cubit<StockPredictionState> {
  final StockPredictionRepository stockPredictionRepository;

  StockPredictionCubit({required this.stockPredictionRepository})
      : super(StockPredictionInitial());

  void stockPrediction() async {
    emit(StockPredictionLoading());
    final result = await stockPredictionRepository.stockPrediction();

    result.fold(
      (failure) => emit(StockPredictionFailure(mapFailureToMessage(failure))),
      (data) => emit(StockPredictionSuccess(data)),
    );
  }
}
