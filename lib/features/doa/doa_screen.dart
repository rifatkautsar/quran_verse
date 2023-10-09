import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_verse/services/repository.dart';
import 'package:quran_verse/utilities/custom_text_widget.dart';
import 'package:quran_verse/widget/item_doa.dart';

import '../../utilities/color.dart';
import 'bloc/doa_bloc.dart';

class DoaScreen extends StatelessWidget {
  const DoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoaBloc(service: Service())..add(LoadDoa()),
      child: Scaffold(
        backgroundColor: ColorConstant.baseColor,
        body: BlocBuilder<DoaBloc, DoaState>(
          builder: (context, state) {
            if (state is DoaLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is DoaLoaded) {
              final doa = state.doa;
              return SingleChildScrollView(
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
                          itemCount: doa.length,
                          // Number of items in the list
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ItemDoa(
                                namaDoa: doa[index].name,
                                doaArab: doa[index].arabic,
                                doaLatin: doa[index].latin,
                                doaArti: doa[index].translation);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 10.0);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text('Error'),
              );
            }
          },
        ),
      ),
    );
  }
}
