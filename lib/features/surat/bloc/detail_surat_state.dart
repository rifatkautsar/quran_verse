part of 'detail_surat_bloc.dart';

@immutable
abstract class DetailSuratState {}

class DetailSuratInitial extends DetailSuratState {}

class DetailSuratLoading extends DetailSuratState {}

class DetailSuratLoaded extends DetailSuratState {
  final List<Ayat> ayat;
  DetailSuratLoaded({required this.ayat});
}

class DetailSuratError extends DetailSuratState {
  final String error;
  DetailSuratError({required this.error});
}


