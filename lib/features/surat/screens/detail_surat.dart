import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_verse/features/surat/bloc/detail_surat_bloc.dart';
import 'package:quran_verse/services/repository.dart';
import 'package:quran_verse/utilities/color.dart';
import 'package:quran_verse/utilities/custom_text_widget.dart';
import 'package:quran_verse/widget/item_quran.dart';

class DetailSurat extends StatefulWidget {
  final int idSurat;
  final String namaSurat;
  final String artiSurat;
  final String jumlahAyat;
  final String turunSurat;
  final String audioAyat;

  const DetailSurat(
      {super.key,
      required this.idSurat,
      required this.namaSurat,
      required this.artiSurat,
      required this.jumlahAyat,
      required this.turunSurat,
      required this.audioAyat});

  @override
  State<DetailSurat> createState() => _DetailSuratState();
}

class _DetailSuratState extends State<DetailSurat> {
  final player = AudioPlayer();
  bool isPlaying = false;
  bool isStopped = false;

  Future<void> playAudioFromUrl(String url) async {
    if (isPlaying && !isStopped) {
      await player.pause(); // Pause the audio
      setState(() {
        isPlaying = false;
      });
    } else if (isStopped) {
      await player.resume(); // Resume the audio
      setState(() {
        isPlaying = true;
        isStopped = false;
      });
    } else {
      await player.play(UrlSource(url));
      setState(() {
        isPlaying = true;
      });
    }
  }

  Future<void> stopAudio() async {
    await player.stop(); // Stop the audio
    setState(() {
      isPlaying = false;
      isStopped = true;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.baseColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.baseColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
            stopAudio();
          },
        ),
        title: Text(widget.namaSurat),
      ),
      body: BlocProvider(
        create: (context) => DetailSuratBloc(service: Service())
          ..add(LoadDetailSurat(id: widget.idSurat)),
        child: BlocBuilder<DetailSuratBloc, DetailSuratState>(
          builder: (context, state) {
            if (state is DetailSuratLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is DetailSuratLoaded) {
              final ayat = state.ayat;
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 250.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          //color: ColorConstant.purpleColor,
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              ColorConstant.itemReadColor1,
                              ColorConstant.itemReadColor2,
                            ],
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0.0,
                              right: 0.0,
                              child: Opacity(
                                opacity: 0.2,
                                child: SvgPicture.asset(
                                  'assets/quran_icon_home.svg',
                                  width: 250.0,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 5.0,
                              right: 0.0,
                              left: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomTextWithSizeWhite(
                                        valueText: widget.namaSurat,
                                        textSize: 24.0),
                                    const SizedBox(height: 10.0),
                                    CustomTextWithSizeWhite(
                                        valueText: widget.artiSurat,
                                        textSize: 16.0),
                                    const SizedBox(
                                      height: 25.0,
                                    ),
                                    const SizedBox(
                                      width: 250.0,
                                      child: Divider(
                                        color: Colors.white,
                                        height: 1.0,
                                        thickness: 0.8,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          widget.turunSurat,
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        const SizedBox(width: 5.0),
                                        const Icon(
                                          CupertinoIcons.circle_fill,
                                          size: 5.0,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(width: 5.0),
                                        Text(
                                          widget.jumlahAyat,
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20.0,
                              right: 0.0,
                              left: 0.0,
                              child: SvgPicture.asset(
                                'assets/bissmillah_icon.svg',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {
                            playAudioFromUrl(widget.audioAyat);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: ColorConstant.orangeColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                isPlaying && !isStopped
                                    ? CupertinoIcons.pause_fill
                                    : CupertinoIcons.play_fill,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                isPlaying && !isStopped ? 'Pause' : 'Play',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: isPlaying && !isStopped
                            ? ElevatedButton(
                          onPressed: () {
                            stopAudio();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(CupertinoIcons.stop_fill, color: Colors.black),
                              SizedBox(width: 10.0),
                              Text('Stop', style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        )
                            : null,
                      ),
                      const SizedBox(height: 20.0),
                      ListView.separated(
                        itemCount: ayat.length,
                        // Number of items in the list
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return ItemQuran(
                              noAyat: ayat[index].nomor.toString(),
                              arabAyat: ayat[index].ar,
                              latinAyat: ayat[index].tr,
                              artiAyat: ayat[index].idn);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            color: Colors.grey, // Set the color of the line
                            thickness: 0.1, // Set the thickness of the line
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text('Error'),
              );
            }
          },
        ),
      ),
    );
  }
}
