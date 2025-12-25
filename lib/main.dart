import 'package:flutter/material.dart';
import 'package:islami/screens/hadeth_details.dart';
import 'package:islami/screens/home/home_screen.dart';
import 'package:islami/screens/introduction_screens.dart';
import 'package:islami/screens/sura_details_screen.dart';
import 'core/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CacheHelper.introIsOpened() == true
          ? HomeScreen.routeName
          : IntroductionScreens.routeName,
      routes: {
        IntroductionScreens.routeName: (context) => IntroductionScreens(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
    );
  }
}
