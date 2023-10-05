import 'package:flutter/material.dart';
import 'package:quran_verse/utilities/color.dart';
import 'package:quran_verse/utilities/custom_text_widget.dart';

class ItemJadwalSholat extends StatelessWidget {
  const ItemJadwalSholat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 150.0,
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: ColorConstant.itemDoaColor,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: const Row(
        children: [
          CustomTextWithSizeWhite(valueText: 'Subuh', textSize: 16.0),
          Spacer(),
          CustomTextWithSizeWhite(valueText: '04:30', textSize: 16.0),
        ],
      ),
    );
  }
}
