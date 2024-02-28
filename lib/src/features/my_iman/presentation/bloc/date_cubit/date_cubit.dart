import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seerah/src/core/error/failures.dart';
import 'package:seerah/src/features/my_iman/presentation/bloc/date_cubit/date_state.dart';

const serverFailureMessage = 'Server Failure';
const cachedFailureMassage = 'Cache Failure';

class DateCubit extends Cubit<DateState> {
  DateCubit() : super(DateEmpty());

  Future<void> loadDate() async {
    final date = "14 акпан";
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return serverFailureMessage;
      case CacheFailure _:
        return cachedFailureMassage;
      default:
        return 'Unexpected Error';
    }
  }
}
