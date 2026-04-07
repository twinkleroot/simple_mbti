import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../utils/logger.dart';
import '../utils/ad_tracker.dart';

class ReusableBannerAd extends StatefulWidget {
  const ReusableBannerAd({super.key});

  @override
  State<ReusableBannerAd> createState() => _ReusableBannerAdState();
}

class _ReusableBannerAdState extends State<ReusableBannerAd> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  bool _canShowAd = false; // 광고 노출 가능 여부 상태

  @override
  void initState() {
    super.initState();
    _checkAdRulesAndLoad();
  }

  Future<void> _checkAdRulesAndLoad() async {
    // 1. 노출 빈도 및 어뷰징 체크
    final canShow = await AdTracker.canShowAd();

    if (canShow) {
      setState(() {
        _canShowAd = true;
      });
      _loadAd();
    }
  }

  void _loadAd() {
    final adUnitId = dotenv.env['GOOGLE_ADMOB_ID_ANDROID_BANNER'] ?? '';

    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isLoaded = true;
          });
          // 2. 광고 로드 성공(노출) 시 Impression 기록
          AdTracker.logImpression();
        },
        onAdFailedToLoad: (ad, error) {
          logger.e('배너 광고 로드 실패: $error');
          ad.dispose();
        },
        onAdClicked: (ad) {
          // 3. 광고 클릭 시 Click 기록
          AdTracker.logClick();
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 규정에 걸려 광고를 보여줄 수 없거나, 아직 로드되지 않은 경우 빈 공간 반환
    if (!_canShowAd || !_isLoaded || _bannerAd == null) {
      return const SizedBox.shrink(); // 공간을 차지하지 않고 사라짐
    }

    return SafeArea(
      child: SizedBox(
        height: _bannerAd!.size.height.toDouble(),
        width: _bannerAd!.size.width.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      ),
    );
  }
}