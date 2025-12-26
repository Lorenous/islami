import 'package:flutter/material.dart';
import 'package:islami/core/app_colors.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

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
              child: Stack(
                alignment: AlignmentGeometry.center,
                children: [
                  Image.asset('assets/images/sebhabody.png'),
                  Positioned(
                    top: MediaQuery.heightOf(context) * 0.167,
                    child: Column(
                      children: [
                        Text(
                          'سبحان الله',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '30',
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
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
