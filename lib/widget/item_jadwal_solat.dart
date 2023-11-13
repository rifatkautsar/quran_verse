import 'package:flutter/material.dart';
import 'package:quran_verse/utilities/color.dart';
import 'package:quran_verse/utilities/custom_text_widget.dart';

class ItemJadwalSholat extends StatelessWidget {
  final String waktuSolatSubuh;
  final String waktuSolatDzuhur;
  final String waktuSolatAshar;
  final String waktuSolatMaghrib;
  final String waktuSolatIsya;

  const ItemJadwalSholat(
      {super.key,
      required this.waktuSolatSubuh,
      required this.waktuSolatDzuhur,
      required this.waktuSolatAshar,
      required this.waktuSolatMaghrib,
      required this.waktuSolatIsya});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60.0,
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            color: ColorConstant.itemDoaColor,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Row(
            children: [
              const CustomTextWithSizeWhite(valueText: 'Subuh', textSize: 16.0),
              const Spacer(),
              CustomTextWithSizeWhite(
                  valueText: waktuSolatSubuh, textSize: 16.0),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          height: 60.0,
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            color: ColorConstant.itemDoaColor,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Row(
            children: [
              const CustomTextWithSizeWhite(
                  valueText: 'Dzuhur', textSize: 16.0),
              const Spacer(),
              CustomTextWithSizeWhite(
                  valueText: waktuSolatDzuhur, textSize: 16.0),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          height: 60.0,
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            color: ColorConstant.itemDoaColor,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Row(
            children: [
              const CustomTextWithSizeWhite(valueText: 'Ashar', textSize: 16.0),
              const Spacer(),
              CustomTextWithSizeWhite(
                  valueText: waktuSolatAshar, textSize: 16.0),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          height: 60.0,
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            color: ColorConstant.itemDoaColor,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Row(
            children: [
              const CustomTextWithSizeWhite(
                  valueText: 'Magrib', textSize: 16.0),
              const Spacer(),
              CustomTextWithSizeWhite(
                  valueText: waktuSolatMaghrib, textSize: 16.0),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          height: 60.0,
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            color: ColorConstant.itemDoaColor,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Row(
            children: [
              const CustomTextWithSizeWhite(valueText: 'Isya', textSize: 16.0),
              const Spacer(),
              CustomTextWithSizeWhite(
                  valueText: waktuSolatIsya, textSize: 16.0),
            ],
          ),
        ),
      ],
    );
  }
}
