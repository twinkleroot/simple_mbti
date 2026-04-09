import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

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
  final String _adPlacementId = 'Manual_Ad_Interstitial_Android'; // 유니티 전면광고 기본 ID

  bool _isNavigating = false; // 중복 화면 이동 방지용 플래그

  @override
  void initState() {
    super.initState();
    _startAdSequence(); // 화면 진입 시 광고 시퀀스 시작
  }

  // 로드 -> 재생의 흐름을 갖습니다.
  Future<void> _startAdSequence() async {
      _loadAd();
  }

  void _loadAd() {
    UnityAds.load(
      placementId: _adPlacementId,
      onComplete: (placementId) {
        logger.i('광고 로드 성공, 재생 시작');
        // _showAd();
      },
      onFailed: (placementId, error, message) {
        logger.i('광고 로드 실패: $message');
        // _goToResultScreen();
      },
    );
  }

  void _showAd() {
    UnityAds.showVideoAd(
      placementId: _adPlacementId,
      onComplete: (placementId) => _goToResultScreen(), // 시청 완료
      onFailed: (placementId, error, message) => _goToResultScreen(), // 재생 중 에러
      onSkipped: (placementId) => _goToResultScreen(), // 건너뛰기
    );
  }

  void _goToResultScreen() {
    if (_isNavigating) return;
    _isNavigating = true;

    if (mounted) {
      // 기존에 결과 화면으로 파라미터를 넘겨주던 방식이 있다면 동일하게 적용해 주세요.
      Navigator.pushReplacement(
        context,
        FadePageRoute(builder: (context) => ResultScreen(mbtiResult: widget.mbtiResult)),
      );
    }
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
                    onPressed: _showAd,
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