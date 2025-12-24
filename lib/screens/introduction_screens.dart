import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/app_styles.dart';
import 'package:islami/core/cache_helper.dart';
import 'package:islami/screens/home/home_screen.dart';

class IntroductionScreens extends StatelessWidget {
  IntroductionScreens({super.key});
  static const String routeName = 'introduction-screens';
  final List<PageViewModel> pages = [
    PageViewModel(
      image: Image.asset('assets/images/intro.png'),
      body: '',
      titleWidget: Text('Welcome To Islami App', style: AppStyles.bold24),
    ),
    PageViewModel(
      image: Image.asset('assets/images/kabba.png'),

      titleWidget: Text('Welcome To Islami', style: AppStyles.bold24),
      bodyWidget: Text(
        'We Are Very Excited To Have You In Our Community',
        style: AppStyles.bold20,
        textAlign: TextAlign.center,
      ),
    ),
    PageViewModel(
      image: Image.asset('assets/images/welcome.png'),

      titleWidget: Text('Reading The Quran', style: AppStyles.bold24),
      bodyWidget: Text(
        'Read, and your Lord is the Most Generous',
        style: AppStyles.bold20,
        textAlign: TextAlign.center,
      ),
    ),
    PageViewModel(
      image: Image.asset('assets/images/bearish.png'),

      titleWidget: Text('Bearish', style: AppStyles.bold24),
      bodyWidget: Text(
        'Praise the name of your Lord, the Most High',
        style: AppStyles.bold20,
        textAlign: TextAlign.center,
      ),
    ),
    PageViewModel(
      image: Image.asset('assets/images/radio.png'),
      titleWidget: Text('Holy Quran Radio', style: AppStyles.bold24),
      bodyWidget: Text(
        'You can listen to the Holy Quran Radio through the application for free and easily',
        style: AppStyles.bold20,
        textAlign: TextAlign.center,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      bodyPadding: EdgeInsets.only(top: 240),
      pages: pages,
      controlsPadding: EdgeInsets.symmetric(vertical: 16),
      done: Text('Done', style: TextStyle(color: AppColors.primaryColor)),
      onDone: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        CacheHelper.saveBool();
      },
      next: Text('Next', style: TextStyle(color: AppColors.primaryColor)),
      showBackButton: true,
      back: Text('Back', style: TextStyle(color: AppColors.primaryColor)),
      globalBackgroundColor: AppColors.dark,
      globalHeader: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Image.asset('assets/images/intro_top.png', height: 170),
      ),
      dotsDecorator: DotsDecorator(
        activeColor: AppColors.primaryColor,
        activeSize: Size(18, 7),
        activeShape: OutlineInputBorder(),
        size: Size(7, 7),
      ),
    );
  }
}
