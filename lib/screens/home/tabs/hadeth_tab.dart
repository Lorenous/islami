import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/app_styles.dart';
import 'package:islami/models/hadeth_model.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> allAhadeethData = [];
  @override
  void initState() {
    super.initState();
    loadHadithFile();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: AlignmentGeometry.topCenter,
          fit: BoxFit.contain,
          image: AssetImage('assets/images/hadethbg.png'),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.dark.withAlpha(158), AppColors.dark],
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset('assets/images/intro_top.png', width: 250),
            ),
            CarouselSlider(
              items: allAhadeethData
                  .map(
                    (hadeth) => Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  right: 8,
                                  left: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'assets/images/left_corner.png',
                                      color: AppColors.black,
                                      width: 100,
                                    ),
                                    Image.asset(
                                      'assets/images/right_corner.png',
                                      color: AppColors.black,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Opacity(
                                  opacity: 0.15,
                                  child: Image.asset(
                                    'assets/images/hadeth_card_bg.png',
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/images/bottom_decoration.png',
                                color: AppColors.dark.withAlpha(130),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 45,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  hadeth.title,
                                  style: AppStyles.bold24.copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: hadeth.content.length,
                                    itemBuilder: (context, index) => Text(
                                      hadeth.content[index],
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                aspectRatio: 3 / 4,
                viewportFraction: 0.7,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loadHadithFile() async {
    String hadethFile = await rootBundle.loadString("assets/ahadeeth.txt");

    List<String> allAhadeth = hadethFile.split("#"); // len >> 50

    for (int i = 0; i < allAhadeth.length; i++) {
      String hadethOne = allAhadeth[i];
      List<String> hadethLines = hadethOne.trim().split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      List<String> hadethContent = hadethLines;

      allAhadeethData.add(HadethModel(title: title, content: hadethContent));
    }

    setState(() {});
  }
}
