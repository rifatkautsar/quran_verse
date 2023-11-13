import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_verse/services/repository.dart';

import 'package:quran_verse/model/solat_model.dart';

part 'solat_event.dart';

part 'solat_state.dart';

class SolatBloc extends Bloc<SolatEvent, SolatState> {
  final Service service;

  SolatBloc({required this.service}) : super(SolatInitial()) {
    on<LoadSolat>((event, emit) async {
      emit(SolatLoading());
      try {
        final result = await service.fetchDataSolat(
            event.idKota as int, event.tahun, event.bulan, event.hari);
        emit(SolatLoaded(solat: [result]));
      } catch (e) {
        emit(SolatError(error: e.toString()));
      }
    });
  }
}
