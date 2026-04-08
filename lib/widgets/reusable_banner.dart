import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:applovin_max/applovin_max.dart';
import 'package:simple_mbti/utils/logger.dart';

class ReusableBannerAd extends StatelessWidget {
  const ReusableBannerAd({super.key});

  @override
  Widget build(BuildContext context) {
    final adUnitId = dotenv.env['APPLOVIN_ANDROID_BANNER'] ?? '';

    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 50.0, // 표준 배너 높이
      child: MaxAdView(
        adUnitId: adUnitId,
        adFormat: AdFormat.banner,
        listener: AdViewAdListener(
          onAdLoadedCallback: (ad) {
            logger.i('앱러빈 배너 로드 성공');
          },
          onAdLoadFailedCallback: (adUnitId, error) {
            logger.i('앱러빈 배너 로드 실패: ${error.message}');
          },
          onAdClickedCallback: (ad) {
            logger.i('앱러빈 배너 클릭됨');
          },
          onAdExpandedCallback: (ad) {},
          onAdCollapsedCallback: (ad) {},
        ),
      ),
    );
  }
}