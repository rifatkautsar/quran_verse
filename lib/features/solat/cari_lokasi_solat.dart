import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_verse/features/solat/bloc/cari_lokasi_solat_bloc.dart';
import 'package:quran_verse/model/lokasi_solat_model.dart';
import 'package:quran_verse/services/repository.dart';
import 'package:quran_verse/utilities/color.dart';
import 'package:quran_verse/utilities/custom_text_widget.dart';

class CariLokasiSolat extends StatefulWidget {
  const CariLokasiSolat({super.key});

  @override
  State<CariLokasiSolat> createState() => _CariLokasiSolatState();
}

class _CariLokasiSolatState extends State<CariLokasiSolat> {
  final TextEditingController textEditingController = TextEditingController();
  List<LocationResponse> _searchResults = [];

  void onLocationSelected(String id) {
    Navigator.pop(context, id);
  }

  @override
  Widget build(BuildContext context) {
    bool isTextNotEmpty = textEditingController.text.isNotEmpty;
    return BlocProvider(
      create: (context) =>
          CariLokasiSolatBloc(service: Service())..add(LoadKota()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.baseColor,
          title: const CustomTextWithSizeWhite(
              valueText: 'Lokasi Jadwal Solat', textSize: 18.0),
        ),
        backgroundColor: ColorConstant.baseColor,
        body: BlocBuilder<CariLokasiSolatBloc, CariLokasiSolatState>(
          builder: (context, state) {
            if (state is CariLokasiSolatLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CariLokasiSolatLoaded) {
              final kota = state.kota;

              void onSearchTextChanged(String query) {
                _searchResults.clear();
                if (query.isNotEmpty) {
                  _searchResults = kota
                      .where((kota) => kota.lokasi
                          .toLowerCase()
                          .contains(query.toLowerCase()))
                      .toList();
                }
                setState(() {});
              }

              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                   TextField(
                     controller: textEditingController,
                     onChanged: onSearchTextChanged,
                     decoration: InputDecoration(
                       hintText: 'Cari Lokasi',
                       hintStyle: const TextStyle(color: Colors.grey),
                       suffixIcon: Visibility(
                         visible: isTextNotEmpty,
                         child: IconButton(
                           onPressed: () {
                             setState(() {
                               textEditingController.clear();
                             });
                           },
                           icon: const Icon(
                             CupertinoIcons.clear,
                             color: Colors.grey,
                           ),
                         ),
                       ),
                       prefixIcon: const Icon(
                         CupertinoIcons.search,
                         color: Colors.grey,
                       ),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10.0),
                         borderSide: BorderSide.none,
                       ),
                       filled: true,
                       fillColor: ColorConstant.itemDoaColor,
                     ),
                   ),
                    const SizedBox(height: 15.0),
                    textEditingController.text.isEmpty
                        ? Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(kota[index].lokasi),
                                  onTap: () {
                                    onLocationSelected(kota[index].id); // Call the function
                                  },
                                );
                              },
                              itemCount: kota.length,
                            ),
                          )
                        : _searchResults.isEmpty
                            ? const Center(
                                child: Text('No results found'),
                              )
                            : Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(_searchResults[index].lokasi),
                                      onTap: () {},
                                    );
                                  },
                                  itemCount: _searchResults.length,
                                ),
                              ),
                  ],
                ),
              );
            }
            return const Center(
              child: Text('Error'),
            );
          },
        ),
      ),
    );
  }
}
