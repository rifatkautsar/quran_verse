import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_verse/model/surat_model.dart';
import 'package:quran_verse/services/repository.dart';

part 'surat_event.dart';
part 'surat_state.dart';

class SuratBloc extends Bloc<SuratEvent, SuratState> {
  final Service service;
  SuratBloc({required this.service}) : super(SuratInitial()) {
    on<LoadSurat>((event, emit) async{
      emit(SuratLoading());
      try {
        final result = await service.fetchDataSurat();
        emit(SuratLoaded(surah: result));
      } catch (e) {
        emit(SuratError(error: e.toString()));
      }
    });
  }
}
