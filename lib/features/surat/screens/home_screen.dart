import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_verse/features/surat/bloc/surat_bloc.dart';
import 'package:quran_verse/features/surat/screens/detail_surat.dart';
import 'package:quran_verse/services/repository.dart';
import 'package:quran_verse/utilities/color.dart';
import 'package:quran_verse/utilities/custom_text_widget.dart';
import 'package:quran_verse/widget/item_surat.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SuratBloc(service: Service())..add(LoadSurat()),
      child: Scaffold(
        backgroundColor: ColorConstant.baseColor,
        body: BlocBuilder<SuratBloc, SuratState>(
          builder: (context, state) {
            if (state is SuratLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SuratLoaded) {
              final surah = state.surah;

              return SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Quran App',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              color: Colors.white,
                              icon: const Icon(CupertinoIcons.search),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        const CustomTextWithSizeCustomColor(
                            valueText: 'Assalamualikum',
                            textSize: 20.0,
                            colorText: ColorConstant.purpleTextColor),
                        const SizedBox(height: 30.0),
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 150.0,
                              padding: const EdgeInsets.all(20.0),
                              decoration: const BoxDecoration(
                                color: ColorConstant.purpleColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    ColorConstant.itemReadColor1,
                                    ColorConstant.itemReadColor2,
                                  ],
                                ),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(CupertinoIcons.book_fill,
                                          color: Colors.white),
                                      SizedBox(width: 10.0),
                                      CustomTextWithSizeWhite(
                                          valueText: 'Last Read',
                                          textSize: 18.0),
                                    ],
                                  ),
                                  SizedBox(height: 20.0),
                                  Column(
                                    children: [
                                      CustomTextWithSizeWhite(
                                          valueText: 'Al-Fatihah',
                                          textSize: 18.0),
                                      SizedBox(height: 5.0),
                                      CustomTextWithSizeWhite(
                                          valueText: 'Ayat No: 1',
                                          textSize: 18.0),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: SvgPicture.asset(
                                  'assets/quran_icon_home.svg'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30.0),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: surah.length,
                          itemBuilder: (context, index) {
                            // idSurat = surah[index].nomor;
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailSurat(
                                            idSurat: surah[index].nomor,
                                            namaSurat: surah[index].namaLatin,
                                            artiSurat: surah[index].arti,
                                            jumlahAyat: surah[index]
                                                .jumlahAyat
                                                .toString(),
                                            turunSurat:
                                                surah[index].tempatTurun,
                                            audioAyat: surah[index].audio,
                                          )),
                                );
                              },
                              child: ItemSurat(
                                surat: surah[index].namaLatin,
                                tempatTurun: surah[index].tempatTurun,
                                nomorSurat: surah[index].nomor,
                                jumlahAyat: surah[index].jumlahAyat.toString(),
                                namaAyat: surah[index].nama,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is SuratError) {
              return Center(
                child: Text(state.error),
              );
            } else {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
          },
        ),
      ),
    );
  }
}
