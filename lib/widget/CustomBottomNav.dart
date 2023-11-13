import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_verse/features/surat/screens/home_screen.dart';
import 'package:quran_verse/utilities/color.dart';

import '../features/doa/doa_screen.dart';
import '../features/solat/solat_screen.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _children = const [
    HomeScreen(),
    DoaScreen(),
    SolatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: ColorConstant.bottomNavColor,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/quran_icon.svg'),
            label: 'Quran'
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/dua_icon.svg', width: 25.0,),
            label: 'Prayer',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/salah_icon.svg', width: 20.0,),
            label: 'Salah',
          ),
        ],
      ),
    );
  }
}
