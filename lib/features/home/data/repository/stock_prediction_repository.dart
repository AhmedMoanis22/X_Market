import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_error.dart';
import '../data_souce/stock_prediction_data_source.dart';
import '../model/prediction_model.dart';

class StockPredictionRepository {
  final StockPredictionDataSource stockPredictionDataSource;
  final NetworkInfo networkInfo;

  StockPredictionRepository(
      {required this.stockPredictionDataSource, required this.networkInfo});

  Future<Either<Failure, StockPredictionResponse>> stockPrediction() async {
    try {
      final remoteData = await stockPredictionDataSource.stockPrediction();

      return Right(remoteData);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
