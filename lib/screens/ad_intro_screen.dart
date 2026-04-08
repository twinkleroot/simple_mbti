import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:applovin_max/applovin_max.dart';

import '../data/ui_data.dart';
import '../utils/fade_page_route.dart';
import '../utils/logger.dart';
import 'result_screen.dart';

class AdIntroScreen extends StatefulWidget {
  final String mbtiResult;

  const AdIntroScreen({super.key, required this.mbtiResult});

  @override
  State<AdIntroScreen> createState() => _AdIntroScreenState();
}

class _AdIntroScreenState extends State<AdIntroScreen> {
  late String _interstitialAdUnitId;

  @override
  void initState() {
    super.initState();
    // 1. .env 파일에서 AppLovin 전면 광고 ID 가져오기
    _interstitialAdUnitId = dotenv.env['APPLOVIN_ANDROID_INTERSTITIAL'] ?? '';

    // 2. 화면 진입 시 전면 광고를 백그라운드에서 로드 시작
    if (_interstitialAdUnitId.isNotEmpty) {
      _initializeInterstitialAds();
    }
  }

  void _initializeInterstitialAds() {
    AppLovinMAX.setInterstitialListener(InterstitialListener(
      onAdLoadedCallback: (ad) {
        logger.i('AppLovin 전면 광고 로드 완료');
      },
      onAdLoadFailedCallback: (adUnitId, error) {
        logger.i('AppLovin 전면 광고 로드 실패: ${error.message}');
      },
      onAdDisplayedCallback: (ad) {},
      onAdDisplayFailedCallback: (ad, error) {
        // 광고 띄우기 실패 시 기다리게 하지 않고 바로 결과로 이동
        _goToResultScreen();
      },
      onAdClickedCallback: (ad) {},
      onAdHiddenCallback: (ad) {
        // [핵심] 유저가 광고의 [X] 버튼을 눌러 닫았을 때 결과 화면으로 이동!
        _goToResultScreen();
      },
    ));

    // 로드 요청
    AppLovinMAX.loadInterstitial(_interstitialAdUnitId);
  }

  void _goToResultScreen() {
    Navigator.pushReplacement(
      context,
      FadePageRoute(builder: (context) => ResultScreen(mbtiResult: widget.mbtiResult)),
    );
  }

  void _showAdAndGoToResult() async {
    // 버튼 클릭 시 광고가 준비되었는지 확인
    bool isReady = (await AppLovinMAX.isInterstitialReady(_interstitialAdUnitId)) ?? false;

    if (isReady) {
      // 로드된 광고 띄우기 (광고를 닫으면 onAdHiddenCallback 실행되어 결과로 감)
      AppLovinMAX.showInterstitial(_interstitialAdUnitId);
    } else {
      // 광고 로드 실패 상태라면 즉시 결과 화면으로 이동
      _goToResultScreen();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(Icons.ondemand_video_rounded, size: 100, color: primaryColor.withValues(alpha: 0.8)),
                  const SizedBox(height: 24),
                  Text(
                    '모든 질문에 답을 마쳤습니다',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '광고 시청 후 결과를 바로 확인하세요!',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  ElevatedButton(
                    onPressed: _showAdAndGoToResult,
                    child: const Text('결과 보러 가기'),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}