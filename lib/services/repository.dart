import 'package:dio/dio.dart';
import 'package:quran_verse/model/lokasi_solat_model.dart';
import 'package:quran_verse/model/solat_model.dart';
import 'package:quran_verse/model/surat_detail_model.dart';
import 'package:quran_verse/model/surat_model.dart';
import 'package:quran_verse/services/api_constant.dart';

import '../model/doa_model.dart';

class Service {
  final Dio dio = Dio(BaseOptions(baseUrl: equranApiBaseUrl));
  final Dio dio2 = Dio(BaseOptions(baseUrl: muslimifyApiBaseUrl));
  final Dio dio3 = Dio(BaseOptions(baseUrl: solatApiBaseUrl));

  Future<List<Surah>> fetchDataSurat() async {
    try {
      Response response = await dio.get('/surat');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<Surah> suratList = data.map((item) => Surah.fromJson(item)).toList();
        return suratList;
      } else {
        throw Exception('Failed to load Surah data');
      }
    } catch (error) {

      throw Exception('Failed to load Surah data: $error');

    }
  }

  Future<SurahDetail> fetchDetailDataSurat(int id) async {
    try {
      Response response = await dio.get('/surat/$id');
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        return SurahDetail.fromJson(data);
      } else {
        throw Exception('Failed to load Surah data');
      }
    } catch (error) {
      print(error);
      throw Exception('Failed to load Surah data: $error');
    }
  }
  Future<List<Doa>> fetchDataDoa() async {
    try {
      Response response = await dio2.get('/doaharian');
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        List<dynamic> data = responseData['data'];
        List<Doa> doaList = data.map((item) => Doa.fromJson(item)).toList();
        return doaList;
      } else {
        throw Exception('Failed to load Surah data');
      }
    } catch (error) {
      print(error);
      throw Exception('Failed to load Surah data: $error');
    }
  }

  Future<Data> fetchDataSolat(int kodeDaerah, int tahun, int bulan, int tanggal) async {
    try {
      Response response = await dio3.get('/sholat/jadwal/$kodeDaerah/$tahun/$bulan/$tanggal');
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        dynamic data = responseData['data'];
        Data solatData = Data.fromJson(data);
        return solatData;
      } else {
        throw Exception('Failed to load Surah data');
      }
    } catch (error) {
      print(error);
      throw Exception('Failed to load Surah data: $error');
    }
  }

  Future<List<LocationResponse>> fetchDataLokasiSolat() async {
    try {
      Response response = await dio3.get('/sholat/kota/semua');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data; // It's an array, so parse it as a list
        List<LocationResponse> result = data.map((item) => LocationResponse.fromJson(item)).toList();
        return result;
      } else {
        throw Exception('Failed to load Surah data');
      }
    } catch (error) {
      print(error);
      throw Exception('Failed to load Surah data: $error');
    }
  }


}
