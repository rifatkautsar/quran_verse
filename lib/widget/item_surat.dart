import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_verse/utilities/custom_text_widget.dart';

class ItemSurat extends StatelessWidget {
  final String surat;
  final int nomorSurat;
  final String tempatTurun;
  final String jumlahAyat;
  final String namaAyat;

  const ItemSurat(
      {super.key,
      required this.surat,
      required this.tempatTurun,
      required this.nomorSurat,
      required this.jumlahAyat,
      required this.namaAyat});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SvgPicture.asset('assets/icon_number_surah.svg'),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        nomorSurat.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    surat,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      Text(
                        tempatTurun,
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
                        jumlahAyat,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              CustomTextWithSizeWhite(valueText: namaAyat, textSize: 18),
            ],
          ),
          const SizedBox(height: 10.0),
          const Divider(
            color: Colors.grey, // Set the color of the line
            thickness: 0.1, // Set the thickness of the line
          )
        ],
      ),
    );
  }
}
