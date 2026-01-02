import 'package:flutter/material.dart';
import 'package:islami/core/app_colors.dart';
import 'dart:math' as math;

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angel = 12 * math.pi / 180;
  String sebhaText = 'سبحان الله';
  int counter = 30;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: AlignmentGeometry.topCenter,
          fit: BoxFit.cover,
          image: AssetImage('assets/images/sebhabg.jpg'),
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
          children: [
            Center(
              child: Image.asset('assets/images/intro_top.png', width: 250),
            ),
            Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Image.asset('assets/images/sebha_top.png', height: 80),

            Expanded(
              child: GestureDetector(
                onTap: onSebhaTap,
                child: Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    Transform.rotate(
                      angle: angel,
                      child: Image.asset('assets/images/sebhabody.png'),
                    ),
                    Positioned(
                      top: MediaQuery.heightOf(context) * 0.167,
                      child: Column(
                        children: [
                          Text(
                            sebhaText,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$counter',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  void onSebhaTap() {
    angel += 12 * math.pi / 180;
    counter--;
    if (counter == 0 && sebhaText == 'سبحان الله') {
      counter = 30;
      sebhaText = 'الحمدلله';
    } else if (counter == 0 && sebhaText == 'الحمدلله') {
      counter = 30;
      sebhaText = 'الله اكبر';
    } else if (counter == 0 && sebhaText == 'الله اكبر') {
      counter = 30;
      sebhaText = 'سبحان الله';
    }
    setState(() {});
  }
}
