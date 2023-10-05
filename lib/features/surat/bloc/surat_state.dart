part of 'surat_bloc.dart';

@immutable
abstract class SuratState {}

class SuratInitial extends SuratState {}

class SuratLoading extends SuratState {}

class SuratLoaded extends SuratState {
  final List<Surah> surah;
  SuratLoaded({required this.surah});
}

class SuratError extends SuratState {
  final String error;
  SuratError({required this.error});
}
