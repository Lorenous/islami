import 'package:flutter/material.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/app_styles.dart';
import 'package:islami/models/sura_model.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = 'sura-details-screen';
  const SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
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
          ],
        ),
      ),
    );
  }
}
