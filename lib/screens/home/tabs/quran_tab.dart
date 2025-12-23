import 'package:flutter/material.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/app_styles.dart';
import 'package:islami/models/sura_model.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/quranbg.jpg'),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(color: AppColors.dark.withAlpha(158)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset('assets/images/intro_top.png', width: 250),
            ),
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
            SizedBox(height: 150, child: MostRecentlyListView()),
            SizedBox(height: 10),
            Text(
              'Suras List',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Expanded(child: SurasListView()),
          ],
        ),
      ),
    );
  }
}

class SurasListView extends StatelessWidget {
  const SurasListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => SuraListTile(
        suraModel: SuraModel(
          nameAr: surasName[index],
          nameEn: surasNameEnglish[index],
          versesNum: surasVersesCount[index],
          suraIndex: index + 1,
        ),
      ),
      separatorBuilder: (context, index) => Divider(thickness: 2),
      itemCount: surasName.length,
    );
  }
}

class MostRecentlyListView extends StatelessWidget {
  const MostRecentlyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => SuraCard(
        suraModel: SuraModel(
          nameAr: surasName[index],
          nameEn: surasNameEnglish[index],
          versesNum: surasVersesCount[index],
          suraIndex: index + 1,
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(width: 10),
      itemCount: surasName.length,
    );
  }
}

class SuraListTile extends StatelessWidget {
  final SuraModel suraModel;
  const SuraListTile({super.key, required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        suraModel.nameEn,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        '${suraModel.versesNum} Verses',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        suraModel.nameAr,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      leading: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Image.asset('assets/images/sura_number.png'),
          Text(
            '${suraModel.suraIndex}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class SuraCard extends StatelessWidget {
  final SuraModel suraModel;
  const SuraCard({super.key, required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                suraModel.nameEn,
                style: AppStyles.bold24.copyWith(color: AppColors.dark),
              ),
              Text(
                suraModel.nameAr,
                style: AppStyles.bold24.copyWith(color: AppColors.dark),
              ),
              Text(
                '${suraModel.versesNum} Verses',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          Expanded(
            child: Image.asset(
              'assets/images/reading.png',
              color: Colors.black,
            ),
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
      cursorColor: AppColors.primaryColor,
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
