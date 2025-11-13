import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  // 1. 싱글턴 인스턴스 생성
  static final AdService _instance = AdService._internal();
  factory AdService() => _instance;
  AdService._internal();

  InterstitialAd? _preloadedInterstitialAd;

  // 2. 전면 광고 미리 로드 함수
  void preloadInterstitialAd() {
    // 이미 로드되었거나 로드 중이면 다시 요청하지 않음
    if (_preloadedInterstitialAd != null) {
      return;
    }

    final adUnitId = Platform.isAndroid
        ? dotenv.env['GOOGLE_ADMOB_ID_ANDROID_INTERSTITIAL']!
        : 'YOUR_IOS_INTERSTITIAL_AD_ID'; // iOS ID가 있다면 .env에 추가

    InterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('전면 광고가 성공적으로 미리 로드되었습니다.');
          _preloadedInterstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
          debugPrint('전면 광고 미리 로드 실패: $error');
          _preloadedInterstitialAd = null;
        },
      ),
    );
  }

  // 3. 미리 로드된 전면 광고 표시 함수
  void showPreloadedInterstitialAd({
    required BuildContext context,
    required Function onAdDismissed,
  }) {
    if (_preloadedInterstitialAd == null) {
      debugPrint('미리 로드된 광고가 없습니다. 광고를 건너뜁니다.');
      onAdDismissed(); // 광고가 없으면 바로 다음 동작 실행
      return;
    }

    _preloadedInterstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _preloadedInterstitialAd = null;
        onAdDismissed();
        preloadInterstitialAd(); // 다음 광고를 위해 다시 미리 로드 시작
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        _preloadedInterstitialAd = null;
        debugPrint('광고 표시에 실패했습니다: $error');
        onAdDismissed();
        preloadInterstitialAd(); // 다음 광고를 위해 다시 미리 로드 시작
      },
    );

    _preloadedInterstitialAd!.show();
  }
}