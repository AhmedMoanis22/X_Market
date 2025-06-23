import 'package:flutter_bloc/flutter_bloc.dart';

class ProgressIndicatorCubit extends Cubit<double> {
  final int totalSteps;
  int currentStep;

  ProgressIndicatorCubit({required this.totalSteps})
      : currentStep = 1, // نبدأ من الخطوة الأولى
        super(0.1);

  void nextStep() {
    if (currentStep < totalSteps) {
      currentStep++;
      emit(currentStep / totalSteps);
    }
  }

  void previousStep() {
    if (currentStep > 1) {
      currentStep--;
      emit(currentStep / totalSteps);
    }
  }
}
