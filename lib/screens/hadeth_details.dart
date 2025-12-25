import 'package:flutter/material.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/app_styles.dart';
import 'package:islami/models/hadeth_model.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = 'hadeth-details';
  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    HadethModel hadeth =
        ModalRoute.of(context)!.settings.arguments as HadethModel;

    return Scaffold(
      backgroundColor: AppColors.dark,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primaryColor,
        title: Text(hadeth.title, style: AppStyles.bold20),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/left_corner.png'),
                Text(hadeth.title, style: AppStyles.bold24),
                Image.asset('assets/images/right_corner.png'),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Center(
                  child: Text(
                    hadeth.content[index],
                    style: AppStyles.bold20,
                    textAlign: TextAlign.center,
                  ),
                ),
                itemCount: hadeth.content.length,
              ),
            ),
            SizedBox(height: 10),
            Image.asset('assets/images/bottom_decoration.png'),
          ],
        ),
      ),
    );
  }
}
