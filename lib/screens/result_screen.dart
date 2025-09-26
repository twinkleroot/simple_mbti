import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/mbti_data.dart';
import '../utils/logger.dart';
import '../utils/fade_page_route.dart';
import 'home_screen.dart';

class ResultScreen extends StatefulWidget {
  final String mbtiResult;
  const ResultScreen({super.key, required this.mbtiResult});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late BannerAd _bannerAd;
  bool _isAdLoaded = false;

  // 플랫폼에 따라 다른 테스트 ID를 사용합니다.
  final adUnitId = 'ca-app-pub-9349659716533734/1643573240'; // Android 테스트 ID
  // final adUnitId = Platform.isAndroid
  //     ? 'ca-app-pub-3940256099942544/6300978111' // Android 테스트 ID
  //     : 'ca-app-pub-3940256099942544/2934735716'; // iOS 테스트 ID

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  // 카카오톡 공유 함수
  void _shareToKakao() async {
    // 카카오톡 설치 여부 확인
    if (await isKakaoTalkInstalled()) {
      try {
        // 공유할 메시지 템플릿 생성
        final FeedTemplate template = FeedTemplate(
          content: Content(
            title: '나의 MBTI 결과는? ${widget.mbtiResult}!',
            description: '#MBTI #성격유형 #MBTI테스트',
            imageUrl: Uri.parse('https://mud-kage.kakaocdn.net/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png'), // 예시 이미지
            link: Link(
              webUrl: Uri.parse('https://developers.kakao.com'), // 앱 스토어 링크 등
              mobileWebUrl: Uri.parse('https://developers.kakao.com'),
            ),
          ),
          buttons: [
            Button(
              title: '나도 테스트 하러가기',
              link: Link(
                webUrl: Uri.parse('https://developers.kakao.com'),
                mobileWebUrl: Uri.parse('https://developers.kakao.com'),
              ),
            ),
          ],
        );

        // 카카오톡으로 공유
        await ShareClient.instance.shareDefault(template: template);
      } catch (error) {
        logger.e('카카오톡 공유 실패: $error');
      }
    } else {
      // 카카오톡이 설치되지 않았을 경우 웹으로 공유 시도 (예시)
      try {
        await launchUrl(Uri.parse('https://developers.kakao.com'));
      } catch (error) {
        logger.e('웹 공유 실패: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final resultData = mbtiDescriptions[widget.mbtiResult];
    final jobs = (resultData?['jobs'] as List<String>?)?.join(', ') ?? '';
    final compatibility =
        (resultData?['compatibility'] as List<String>?)?.join(', ') ?? '';

    return Scaffold(
      appBar: AppBar(title: const Text('검사 결과')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              '당신의 성격 유형은...',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0, horizontal: 16.0),
                child: Column(
                  children: [
                    Text(
                      widget.mbtiResult,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 16),
                    ExpansionTile(
                      title: Text(
                        resultData?['simple'] as String? ?? '결과를 찾을 수 없습니다.',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.color,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                resultData?['detail'] as String? ?? '',
                                textAlign: TextAlign.justify,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(height: 1.6),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                '⭐ 추천 직업',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                jobs,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 24),
                              Text(
                                '🤝 잘 맞는 유형',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                compatibility,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 48),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).cardTheme.color,
                      foregroundColor: Theme.of(context).primaryColor,
                      side: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1.5),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        FadePageRoute(builder: (context) => const HomeScreen()),
                            (Route<dynamic> route) => false,
                      );
                    },
                    child: const Text('다시 검사하기'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFEE500),
                      foregroundColor: const Color(0xFF191919),
                    ),
                    onPressed: _shareToKakao,
                    child: const Text('카톡 공유'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // 4. 화면 하단에 광고 위젯 추가
      bottomNavigationBar: _isAdLoaded
          ? SizedBox(
        height: _bannerAd.size.height.toDouble(),
        width: _bannerAd.size.width.toDouble(),
        child: AdWidget(ad: _bannerAd),
      )
          : const SizedBox(),
    );
  }
}