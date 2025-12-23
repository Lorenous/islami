import 'package:flutter/material.dart';
import 'package:islami/core/app_colors.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/quranbg.jpg'),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: AppColors.dark.withAlpha(158)),
        ),
      ],
    );
  }
}
