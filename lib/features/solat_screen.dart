import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_verse/utilities/custom_text_widget.dart';
import 'package:quran_verse/widget/item_jadwal_solat.dart';

import '../utilities/color.dart';

class SolatScreen extends StatefulWidget {
  const SolatScreen({super.key});

  @override
  State<SolatScreen> createState() => _SolatScreenState();
}

class _SolatScreenState extends State<SolatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.baseColor,
      body: SingleChildScrollView(
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
                       const CustomTextWithSizeWhite(valueText: '2 Dhul Al-Hijjah 1444', textSize: 16.0),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          color: Colors.white,
                          icon: const Icon(Icons.search),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    const CustomTextWithSizeWhite(valueText: '1 Oktober 2023', textSize: 15.0),
                    const SizedBox(height: 10.0),
                    const Row(
                      children: [
                       Icon(CupertinoIcons.placemark_fill, color: Colors.white),
                        CustomTextWithSizeWhite(valueText: 'Bandung, Jawa Barat', textSize: 15.0),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.separated(
                  itemCount: 10,
                  // Number of items in the list
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return const ItemJadwalSholat();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 10.0);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
