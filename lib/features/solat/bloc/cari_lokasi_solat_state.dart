part of 'cari_lokasi_solat_bloc.dart';

@immutable
abstract class CariLokasiSolatState {}

class CariLokasiSolatInitial extends CariLokasiSolatState {}

class CariLokasiSolatLoading extends CariLokasiSolatState {}

class CariLokasiSolatLoaded extends CariLokasiSolatState {
  final List<LocationResponse> kota;
  CariLokasiSolatLoaded({required this.kota});
}

class CariLokasiSolatError extends CariLokasiSolatState {
  final String error;
  CariLokasiSolatError({required this.error});
}
