import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_verse/utilities/color.dart';
import 'package:quran_verse/utilities/custom_text_widget.dart';

class ItemQuran extends StatefulWidget {
  final String noAyat;
  final String arabAyat;
  final String latinAyat;
  final String artiAyat;

  const ItemQuran(
      {super.key,
      required this.noAyat,
      required this.arabAyat,
      required this.latinAyat,
      required this.artiAyat});

  @override
  State<ItemQuran> createState() => _ItemQuranState();
}

class _ItemQuranState extends State<ItemQuran> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 55.0,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: ColorConstant.itemDoaColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipOval(
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    color: ColorConstant.purpleColor,
                    child: Center(
                      child: Text(
                        widget.noAyat,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.bookmark,
                    color: ColorConstant.purpleColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: CustomTextWithSizeWhite(
                    valueText: widget.arabAyat,
                    textSize: 24.0),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
         CustomTextWithSizeCustomColor(
          valueText: widget.latinAyat,
          textSize: 16.0,
          colorText: Colors.grey,
        ),
        const SizedBox(height: 10.0),
        CustomTextWithSizeWhite(
            valueText: widget.artiAyat,
            textSize: 15.0),
      ],
    );
  }
}
