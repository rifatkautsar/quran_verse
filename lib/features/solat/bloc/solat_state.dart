part of 'solat_bloc.dart';

@immutable
abstract class SolatState {}

class SolatInitial extends SolatState {}

class SolatLoading extends SolatState {}

class SolatLoaded extends SolatState {
  final List<Data> solat;
  SolatLoaded({required this.solat});
}

class SolatError extends SolatState {
  final String error;
  SolatError({required this.error});
}
