import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/app_styles.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

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
              items: [
                HadethCard(),
                HadethCard(),
                HadethCard(),
                HadethCard(),
                HadethCard(),
              ],
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
}

class HadethCard extends StatelessWidget {
  const HadethCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  child: Image.asset('assets/images/hadeth_card_bg.png'),
                ),
              ),
              Image.asset(
                'assets/images/bottom_decoration.png',
                color: AppColors.dark.withAlpha(130),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 45),
            child: Column(
              children: [
                Text(
                  'الحديث الأول',
                  style: AppStyles.bold24.copyWith(color: AppColors.black),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Text(
                        " عن أمـيـر المؤمنـين أبي حـفص عمر بن الخطاب رضي الله عنه ، قال : سمعت رسول الله صلى الله عـليه وسلم يـقـول : ( إنـما الأعـمـال بالنيات وإنـمـا لكـل امـرئ ما نـوى . فمن كـانت هجرته إلى الله ورسولـه فهجرتـه إلى الله ورسـوله ومن كانت هجرته لـدنيا يصـيبها أو امرأة ينكحها فهجرته إلى ما هاجر إليه ).رواه إمام المحد ثين أبـو عـبـد الله محمد بن إسماعـيل بن ابراهـيـم بن المغـيره بن بـرد زبه البخاري الجعـفي،[رقم:1] وابـو الحسـيـن مسلم بن الحجاج بن مـسلم القـشـيري الـنيسـابـوري [رقم :1907] رضي الله عنهما في صحيحيهما اللذين هما أصح الكتب المصنفه.",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
