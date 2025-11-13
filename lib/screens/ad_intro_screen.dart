import 'package:flutter/material.dart';
import '../data/ui_data.dart';
import '../utils/fade_page_route.dart';
import '../screens/result_screen.dart';
import '../services/ad_service.dart'; // AdService import

class AdIntroScreen extends StatefulWidget {
  final String mbtiResult;

  const AdIntroScreen({super.key, required this.mbtiResult});

  @override
  State<AdIntroScreen> createState() => _AdIntroScreenState();
}

class _AdIntroScreenState extends State<AdIntroScreen> {
  void _navigateToResult(BuildContext context) {
    Navigator.pushReplacement(
      context,
      FadePageRoute(
        builder: (context) => ResultScreen(mbtiResult: widget.mbtiResult),
      ),
    );
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
                      onPressed: () {
                        AdService().showPreloadedInterstitialAd(
                          context: context,
                          onAdDismissed: () {
                            _navigateToResult(context);
                          },
                        );
                      },
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