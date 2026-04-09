import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import '../utils/logger.dart';

class ReusableBannerAd extends StatelessWidget {
  const ReusableBannerAd({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 50, // 유니티 기본 배너 높이
      color: Colors.transparent,
      child: UnityBannerAd(
        placementId: 'Banner_Android', // 유니티 배너 기본 ID
        onLoad: (placementId) => logger.i('배너 로드 성공'),
        onFailed: (placementId, error, message) => logger.i('배너 로드 실패: $message'),
        onClick: (placementId) => logger.i('배너 클릭됨'),
      ),
    );
  }
}