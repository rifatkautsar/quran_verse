part of 'detail_surat_bloc.dart';

@immutable
sealed class DetailSuratEvent {}

final class LoadDetailSurat extends DetailSuratEvent {
  final int id;
  LoadDetailSurat({required this.id});
}
