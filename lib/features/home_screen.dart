import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            ],
          ),
        ),
      ),
    );
  }
}
