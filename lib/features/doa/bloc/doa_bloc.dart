import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_verse/services/repository.dart';

import '../../../model/doa_model.dart';

part 'doa_event.dart';
part 'doa_state.dart';

class DoaBloc extends Bloc<DoaEvent, DoaState> {
  final Service service;
  DoaBloc({required this.service}) : super(DoaInitial()) {
    on<LoadDoa>((event, emit) async {
      emit(DoaLoading());
      try {
        final result = await service.fetchDataDoa();
        emit(DoaLoaded(doa: result));
      } catch (e) {
        emit(DoaError(error: e.toString()));
      }
    });
  }
}
