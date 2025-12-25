import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/app_styles.dart';
import 'package:islami/models/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura-details-screen';
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    loadSuraFile(index + 1);
    if (verses.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      backgroundColor: AppColors.dark,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primaryColor,
        title: Text(surasNameEnglish[index], style: AppStyles.bold20),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/left_corner.png'),
                Text(surasName[index], style: AppStyles.bold24),
                Image.asset('assets/images/right_corner.png'),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Center(
                  child: Text(
                    verses[index],
                    style: AppStyles.bold20,
                    textAlign: TextAlign.center,
                  ),
                ),
                itemCount: verses.length,
              ),
            ),
            SizedBox(height: 10),
            Image.asset('assets/images/bottom_decoration.png'),
          ],
        ),
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    String suraFile = await rootBundle.loadString("assets/suras/$index.txt");
    List<String> suraLines = suraFile.split("\n");
    verses = suraLines;

    setState(() {});
  }
}
