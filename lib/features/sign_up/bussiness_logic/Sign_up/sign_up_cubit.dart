import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<double> {
  SignUpCubit() : super(0.0); // بدء التقدم من 0%

  void updateProgress(double step) {
    emit(state + step); // زيادة التقدم تدريجيًا
  }
}
