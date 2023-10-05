import 'package:flutter/material.dart';
import 'package:quran_verse/utilities/custom_text_widget.dart';
import 'package:quran_verse/widget/item_doa.dart';

import '../../utilities/color.dart';

class DoaScreen extends StatefulWidget {
  const DoaScreen({super.key});

  @override
  State<DoaScreen> createState() => _DoaScreenState();
}

class _DoaScreenState extends State<DoaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.baseColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
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
                child: const Stack(
                  children: [
                    Positioned(
                      bottom: 30.0,
                      right: 0.0,
                      left: 0.0,
                      child: Column(
                        children: [
                          CustomTextWithSizeWhite(
                              valueText: 'Doa Harian', textSize: 24.0),
                          SizedBox(height: 10.0),
                          Text(
                            'Doa adalah pengharapan seseorang\n hamba kepada Tuhannya',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.separated(
                  itemCount: 10,
                  // Number of items in the list
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return const ItemDoa();
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
