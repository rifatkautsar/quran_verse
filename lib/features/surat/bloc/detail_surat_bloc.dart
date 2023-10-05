import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_verse/model/surat_detail_model.dart';
import 'package:quran_verse/services/repository.dart';

part 'detail_surat_event.dart';
part 'detail_surat_state.dart';

class DetailSuratBloc extends Bloc<DetailSuratEvent, DetailSuratState> {
  final Service service;
  DetailSuratBloc({required this.service}) : super(DetailSuratInitial()) {
    on<LoadDetailSurat>((event, emit) async {
      emit(DetailSuratLoading());
      try {
        final result = await service.fetchDetailDataSurat(event.id);
        emit(DetailSuratLoaded(ayat: result.ayat));
      } catch (e) {
        emit(DetailSuratError(error: e.toString()));
      }
    });
  }
}
