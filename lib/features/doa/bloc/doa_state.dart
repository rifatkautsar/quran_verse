part of 'doa_bloc.dart';

@immutable
abstract class DoaState {}

class DoaInitial extends DoaState {}

class DoaLoading extends DoaState {}

class DoaLoaded extends DoaState {
  final List<Doa> doa;
  DoaLoaded({required this.doa});
}

class DoaError extends DoaState {
  final String error;
  DoaError({required this.error});
}
