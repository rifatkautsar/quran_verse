import 'package:flutter/material.dart';
import 'package:quran_verse/utilities/color.dart';
import 'package:quran_verse/utilities/custom_text_widget.dart';

class ItemDoa extends StatelessWidget {
  final String namaDoa;
  final String doaArab;
  final String doaLatin;
  final String doaArti;

  const ItemDoa(
      {super.key,
      required this.namaDoa,
      required this.doaArab,
      required this.doaLatin,
      required this.doaArti});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.itemDoaColor,
        border: Border.all(color: ColorConstant.itemDoaColor, width: 1.0),
      ),
      child: ExpansionTile(
        backgroundColor: ColorConstant.itemDoaColor,
        title: Text(namaDoa),
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        doaArab,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                CustomTextWithSizeCustomColor(
                  valueText:
                      doaLatin,
                  textSize: 16.0,
                  colorText: Colors.green,
                ),
                const SizedBox(height: 10.0),
                CustomTextWithSizeWhite(
                    valueText:
                        doaArti,
                    textSize: 15.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}
