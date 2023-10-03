import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_verse/utilities/color.dart';
import 'package:quran_verse/utilities/custom_text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.baseColor,
      body: SafeArea(
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
                            Icon(CupertinoIcons.book_fill, color: Colors.white),
                            SizedBox(width: 10.0),
                            CustomTextWithSizeWhite(
                                valueText: 'Last Read', textSize: 18.0),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Column(
                          children: [
                            CustomTextWithSizeWhite(
                                valueText: 'Al-Fatihah', textSize: 18.0),
                            const SizedBox(height: 5.0),
                            CustomTextWithSizeWhite(
                                valueText: 'Ayat No: 1', textSize: 18.0),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: SvgPicture.asset('assets/quran_icon_home.svg'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
