import '../../../../core/error/exceprtion.dart';
import '../../../../core/network/api_constant.dart';
import '../../../../core/network/api_services.dart';
import '../model/prediction_model.dart';

class StockPredictionDataSource {
  final ApiServices apiServices;
  StockPredictionDataSource({required this.apiServices});

  Future<StockPredictionResponse> stockPrediction() async {
    final response = await apiServices.getData(
      urll: ApiConstance.stockPrediction,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return StockPredictionResponse.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
