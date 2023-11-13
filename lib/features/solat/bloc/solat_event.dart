part of 'solat_bloc.dart';

@immutable
sealed class SolatEvent {}

final class LoadSolat extends SolatEvent {
  final int idKota;
  final int tahun;
  final int bulan;
  final int hari;
  LoadSolat({required this.idKota, required this.tahun, required this.bulan, required this.hari});
}
