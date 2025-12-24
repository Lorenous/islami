import 'package:flutter/material.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/app_styles.dart';
import 'package:islami/core/cache_helper.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/screens/sura_details_screen.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  void initState() {
    super.initState();
    createSurasList();
    filteredSuras = allSuras;
  }

  List<SuraModel> allSuras = [];
  List<SuraModel> filteredSuras = [];
  void createSurasList() {
    for (var i = 0; i < surasName.length; i++) {
      allSuras.add(
        SuraModel(
          nameAr: surasName[i],
          nameEn: surasNameEnglish[i],
          versesNum: surasVersesCount[i],
          suraIndex: i,
        ),
      );
    }
  }

  void filterSuras(String value) {
    if (value.isEmpty) {
      filteredSuras = allSuras;
    } else {
      filteredSuras = allSuras
          .where(
            (sura) =>
                sura.nameEn.toLowerCase().contains(value.toLowerCase()) ||
                sura.nameAr.contains(value),
          )
          .toList();
    }
    setState(() {});
  }

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
            TextField(
              onChanged: (value) {
                filterSuras(value);
              },
              cursorColor: AppColors.primaryColor,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(14),
                prefixIcon: ImageIcon(
                  AssetImage('assets/images/ic_quran.png'),
                  color: AppColors.primaryColor,
                ),
                hintText: 'Sura Name',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (CacheHelper.getMostRecentlyItems().isNotEmpty) ...[
              Text(
                'Most Recently',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      SuraDetailsScreen.routeName,
                      arguments: CacheHelper.getMostRecentlyItems()[index],
                    ),
                    child: SuraCard(
                      suraModel: SuraModel(
                        nameAr:
                            surasName[CacheHelper.getMostRecentlyItems()[index]],
                        nameEn:
                            surasNameEnglish[CacheHelper.getMostRecentlyItems()[index]],
                        versesNum:
                            surasVersesCount[CacheHelper.getMostRecentlyItems()[index]],
                        suraIndex:
                            CacheHelper.getMostRecentlyItems()[index] + 1,
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: CacheHelper.getMostRecentlyItems().length,
                ),
              ),
              SizedBox(height: 10),
            ],
            Text(
              'Suras List',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () async {
                    Navigator.pushNamed(
                      context,
                      SuraDetailsScreen.routeName,
                      arguments: allSuras.indexOf(filteredSuras[index]),
                    );
                    await CacheHelper.addMostRecentlyItem(
                      allSuras.indexOf(filteredSuras[index]),
                    );
                    setState(() {});
                  },
                  child: SuraListTile(suraModel: filteredSuras[index]),
                ),
                separatorBuilder: (context, index) =>
                    Divider(thickness: 2, indent: 40, endIndent: 40),
                itemCount: filteredSuras.length,
              ),
            ),
          ],
        ),
      ),
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
