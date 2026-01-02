import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/app_styles.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: AlignmentGeometry.topCenter,
          fit: BoxFit.cover,
          image: AssetImage('assets/images/radiobg.jpg'),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Center(
                child: Image.asset('assets/images/intro_top.png', width: 250),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: AppColors.dark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                      ),
                      child: Text('Radio', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.dark.withAlpha(180),
                        foregroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                      ),
                      child: Text('Reciters', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => RadioItem(),
                  separatorBuilder: (context, index) => SizedBox(height: 8),
                  itemCount: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  const RadioItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Spacer(),
              Image.asset(
                'assets/images/bottom_decoration.png',
                color: AppColors.dark.withAlpha(130),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              children: [
                Align(
                  alignment: AlignmentGeometry.center,
                  child: Text(
                    'Radio Ibrahim Al-Akdar',
                    style: AppStyles.bold20.copyWith(color: AppColors.dark),
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Spacer(flex: 3),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.play,
                        color: AppColors.dark,
                        size: 35,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.volumeHigh,
                        color: AppColors.dark,
                        size: 25,
                      ),
                    ),
                    Spacer(flex: 2),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
