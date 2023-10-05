import 'package:flutter/material.dart';
import 'package:quran_verse/utilities/color.dart';
import 'package:quran_verse/utilities/custom_text_widget.dart';

class ItemDoa extends StatefulWidget {
  const ItemDoa({super.key});

  @override
  State<ItemDoa> createState() => _ItemDoaState();
}

class _ItemDoaState extends State<ItemDoa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.itemDoaColor,
        border: Border.all(color: ColorConstant.itemDoaColor, width: 1.0),
      ),
      child: const ExpansionTile(
        backgroundColor: ColorConstant.itemDoaColor,
        title: Text('Doa Sesudah Makan'),
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        'اَللّٰهُمَّ بَارِكْ لَنَا فِيْمَا رَزَقْتَنَا وَقِنَا عَذَابَ النَّارِ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                CustomTextWithSizeCustomColor(valueText: 'Alloohumma barik lanaa fiimaa razatanaa waqinaa adzaa bannar', textSize: 16.0, colorText: Colors.green,),
                SizedBox(height: 10.0),
                CustomTextWithSizeWhite(valueText: 'Ya Allah, berkahilah kami dalam rezeki yang telah Engkau berikan kepada kami dan peliharalah kami dari siksa api nerakar', textSize: 15.0),
              ],
            ),
          )

        ],
      ),
    );
  }
}
