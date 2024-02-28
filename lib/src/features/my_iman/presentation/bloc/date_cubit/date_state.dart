import 'package:equatable/equatable.dart';

abstract class DateState extends Equatable {
  const DateState();

  @override
  List<Object> get props => [];
}

class DateEmpty extends DateState {
  @override
  List<Object> get props => [];
}

class DateLoaded extends DateState {
  final String date;

  DateLoaded(this.date);
}

class DateError extends DateState {
  final String message;

  const DateError({required this.message});

  @override
  List<Object> get props => [message];
}
