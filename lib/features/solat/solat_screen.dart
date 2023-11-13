import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:quran_verse/features/solat/bloc/solat_bloc.dart';
import 'package:quran_verse/services/repository.dart';
import 'package:quran_verse/utilities/custom_text_widget.dart';
import 'package:quran_verse/widget/item_jadwal_solat.dart';

import '../../utilities/color.dart';
import 'cari_lokasi_solat.dart';

class SolatScreen extends StatefulWidget {

  final int? idKotaInitial;
  const SolatScreen({this.idKotaInitial, super.key});

  @override
  State<SolatScreen> createState() => _SolatScreenState();
}

class _SolatScreenState extends State<SolatScreen> {
  DateTime now = DateTime.now();
  HijriCalendar _todayHijri = HijriCalendar.now();


  String? selectedIdKota;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('d MMMM, y').format(now);
    return BlocProvider(
      create: (context) => SolatBloc(service: Service())
        ..add(LoadSolat(
            idKota: selectedIdKota ?? widget.idKotaInitial,
            tahun: now.year,
            bulan: now.month,
            hari: now.day)),
      child: Scaffold(
        backgroundColor: ColorConstant.baseColor,
        body: BlocBuilder<SolatBloc, SolatState>(
          builder: (context, state) {
            if (state is SolatLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SolatLoaded) {
              final solat = state.solat;
              return SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        height: 150.0,
                        decoration: const BoxDecoration(
                          color: ColorConstant.purpleColor,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              ColorConstant.itemReadColor1,
                              ColorConstant.itemReadColor2,
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomTextWithSizeWhite(
                                    valueText: _todayHijri
                                        .toFormat("dd MMMM yyyy")
                                        .toString(),
                                    textSize: 16.0),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CariLokasiSolat()));
                                  },
                                  color: Colors.white,
                                  icon: const Icon(Icons.search),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            CustomTextWithSizeWhite(
                                valueText: formattedDate, textSize: 15.0),
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                const Icon(CupertinoIcons.placemark_fill,
                                    color: Colors.white),
                                CustomTextWithSizeWhite(
                                    valueText:
                                        solat[0].lokasi + solat[0].daerah,
                                    textSize: 15.0),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListView.builder(
                          itemCount: solat.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ItemJadwalSholat(
                                waktuSolatSubuh: solat[index].jadwal.subuh,
                                waktuSolatDzuhur: solat[index].jadwal.dzuhur,
                                waktuSolatAshar: solat[index].jadwal.ashar,
                                waktuSolatMaghrib: solat[index].jadwal.maghrib,
                                waktuSolatIsya: solat[index].jadwal.isya);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: Text('Error'),
            );
          },
        ),
      ),
    );
  }
}
