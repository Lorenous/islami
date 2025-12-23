import 'package:flutter/material.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/app_styles.dart';

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset('assets/images/intro_top.png', width: 290),
              ),
              SizedBox(height: 16),
              SearchTextFeild(),
              SizedBox(height: 20),
              Text(
                'Most Recently',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              SuraCard(),
              SizedBox(height: 10),
              Text(
                'Suras List',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}

class SuraCard extends StatelessWidget {
  const SuraCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 150,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Al-Anbiya',
                  style: AppStyles.bold24.copyWith(color: AppColors.dark),
                ),
                Text(
                  'الأنبياء',
                  style: AppStyles.bold24.copyWith(color: AppColors.dark),
                ),
                Text(
                  '112 Verses',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/reading.png',
            width: 150,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class SearchTextFeild extends StatelessWidget {
  const SearchTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(14),
        prefixIcon: ImageIcon(
          AssetImage('assets/images/ic_quran.png'),
          color: AppColors.primaryColor,
        ),
        hintText: 'Sura Name',
        hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
