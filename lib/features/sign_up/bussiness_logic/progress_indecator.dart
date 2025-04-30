import 'package:flutter_bloc/flutter_bloc.dart';

class ProgressIndecator extends Cubit<double> {
  ProgressIndecator() : super(0.0);

  void updateProgress(double step) {
    emit(state + step);
  }
}
