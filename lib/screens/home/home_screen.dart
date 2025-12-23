import 'package:flutter/material.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/screens/home/tabs/hadeth_tab.dart';
import 'package:islami/screens/home/tabs/quran_tab.dart';
import 'package:islami/screens/home/tabs/radio_tab.dart';
import 'package:islami/screens/home/tabs/sebha_tab.dart';
import 'package:islami/screens/home/tabs/time_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primaryColor,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.dark,
        showUnselectedLabels: false,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: index == 0
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.dark.withAlpha(153),
                      borderRadius: BorderRadius.circular(66),
                    ),
                    child: ImageIcon(AssetImage('assets/images/ic_quran.png')),
                  )
                : ImageIcon(AssetImage('assets/images/ic_quran.png')),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: index == 1
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.dark.withAlpha(153),
                      borderRadius: BorderRadius.circular(66),
                    ),
                    child: ImageIcon(AssetImage('assets/images/ic_hadeth.png')),
                  )
                : ImageIcon(AssetImage('assets/images/ic_hadeth.png')),
            label: 'Hadith',
          ),
          BottomNavigationBarItem(
            icon: index == 2
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.dark.withAlpha(153),
                      borderRadius: BorderRadius.circular(66),
                    ),
                    child: ImageIcon(AssetImage('assets/images/ic_sebha.png')),
                  )
                : ImageIcon(AssetImage('assets/images/ic_sebha.png')),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: index == 3
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.dark.withAlpha(153),
                      borderRadius: BorderRadius.circular(66),
                    ),
                    child: ImageIcon(AssetImage('assets/images/ic_radio.png')),
                  )
                : ImageIcon(AssetImage('assets/images/ic_radio.png')),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: index == 4
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.dark.withAlpha(153),
                      borderRadius: BorderRadius.circular(66),
                    ),
                    child: ImageIcon(AssetImage('assets/images/ic_time.png')),
                  )
                : ImageIcon(AssetImage('assets/images/ic_time.png')),
            label: 'Time',
          ),
        ],
      ),
      body: tabs[index],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
}
