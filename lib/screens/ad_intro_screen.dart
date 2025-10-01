import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../data/ui_data.dart';
import '../utils/fade_page_route.dart';
import '../screens/result_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AdIntroScreen extends StatefulWidget {
  final String mbtiResult;

  const AdIntroScreen({super.key, required this.mbtiResult});

  @override
  State<AdIntroScreen> createState() => _AdIntroScreenState();
}

class _AdIntroScreenState extends State<AdIntroScreen> {
  InterstitialAd? _resultAd;
  bool _isAdLoading = false; // 광고 로딩 중 상태 표시를 위한 변수

  // 버튼을 누르면 광고를 로드하고 표시하는 함수
  void _loadAndShowResultAd() {
    setState(() {
      _isAdLoading = true; // 로딩 상태 시작
    });

    final adUnitId = dotenv.env['GOOGLE_ADMOB_ID_ANDROID_FULLPAGE']!;

    InterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _resultAd = ad;
          setState(() {
            _isAdLoading = false; // 로딩 상태 종료
          });

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _navigateToResult();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              _navigateToResult();
            },
          );

          ad.show();
        },
        onAdFailedToLoad: (error) {
          setState(() {
            _isAdLoading = false;
          });
          _navigateToResult(); // 광고 로드 실패 시에도 결과는 보여줌
        },
      ),
    );
  }

  void _navigateToResult() {
    Navigator.pushReplacement(
      context,
      FadePageRoute(
        builder: (context) => ResultScreen(mbtiResult: widget.mbtiResult),
      ),
    );
  }

  @override
  void dispose() {
    _resultAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              _isAdLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                onPressed: _loadAndShowResultAd,
                child: const Text('결과 보러 가기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}