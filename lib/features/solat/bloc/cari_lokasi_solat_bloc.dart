import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_verse/model/lokasi_solat_model.dart';
import 'package:quran_verse/services/repository.dart';

part 'cari_lokasi_solat_event.dart';
part 'cari_lokasi_solat_state.dart';

class CariLokasiSolatBloc extends Bloc<CariLokasiSolatEvent, CariLokasiSolatState> {
  final Service service;

  CariLokasiSolatBloc({required this.service}) : super(CariLokasiSolatInitial()) {
    on<LoadKota>((event, emit) async {
      try {
       final result = await service.fetchDataLokasiSolat();
        emit(CariLokasiSolatLoaded(kota: result));
      } catch (e) {
        emit(CariLokasiSolatError(error: e.toString()));
      }
    });
  }
}
