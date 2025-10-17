import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
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
  bool _isDownloading = false;
  final adUnitId = dotenv.env['GOOGLE_ADMOB_ID_ANDROID_BANNER']!;

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

  @override
  Widget build(BuildContext context) {
    final resultData = mbtiDescriptions[widget.mbtiResult];
    final jobs = (resultData?['jobs'] as List<String>?)?.join(', ') ?? '';
    final compatibility =
        (resultData?['compatibility'] as List<String>?)?.join(', ') ?? '';

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text('검사 결과')),
          body: SingleChildScrollView(
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
                const SizedBox(height: 24),
                // 3. UI에 '다운로드' 버튼 추가 및 로딩 상태 연동
                ElevatedButton.icon(
                  icon: _isDownloading
                      ? Container(
                    width: 24,
                    height: 24,
                    padding: const EdgeInsets.all(2.0),
                    child: const CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 3,
                    ),
                  )
                      : const Icon(Icons.download_rounded),
                  label: const Text('결과 이미지 다운로드'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4CAF50), // 초록색 계열
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _downloadImageFromS3,
                ),
                const SizedBox(height: 16),
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
              ? SafeArea(
              child : SizedBox(
                    height: _bannerAd.size.height.toDouble(),
                    width: _bannerAd.size.width.toDouble(),
                    child: AdWidget(ad: _bannerAd),
                  )
                )
              : const SizedBox(),
        ),
    );
  }

  // 카카오톡 공유 함수
  void _shareToKakao() async {
    // 카카오톡 설치 여부 확인
    if (await isKakaoTalkInstalled()) {
      final resultData = mbtiDescriptions[widget.mbtiResult];
      final simpleDesc = resultData?['simple'] as String? ?? '';
      final detailDesc = resultData?['detail'] as String? ?? '';
      try {
        final String imageUrl = 'https://heeee-static-datas.s3.ap-northeast-2.amazonaws.com/images/MBTI_${widget.mbtiResult}.png';
        // 공유할 메시지 템플릿 생성
        final FeedTemplate template = FeedTemplate(
          content: Content(
            title: '내 MBTI 결과는 [${widget.mbtiResult}]!',
            description: '$simpleDesc\n${detailDesc.substring(0, detailDesc.length > 100 ? 100 : detailDesc.length)}...',
            imageUrl: Uri.parse(imageUrl), // 예시 이미지
            link: Link(
              androidExecutionParams: {'id': 'com.heeee.simple_mbti'},
            ),
          ),
          buttons: [
            Button(
              title: '나도 테스트 하러가기',
              link: Link(
                androidExecutionParams: {'id': 'com.heeee.simple_mbti'},
              ),
            ),
          ],
        );
        // 카카오톡으로 공유
        var uri = await ShareClient.instance.shareDefault(template: template);
        await ShareClient.instance.launchKakaoTalk(uri);
      } catch (error) {
        logger.e('카카오톡 공유 실패: $error');
      }
    } else {
      try {
        await launchUrl(Uri.parse(dotenv.env['GOOGLE_PLAY_LINK_URL']!));
      } catch (error) {
        logger.e('스토어 링크 열기 실패: $error');
      }
    }
  }

  // 1. 커스텀 모달 다이얼로그 함수 추가
  void _showCustomDownloadSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: true, // 사용자가 외부 탭으로 닫을 수 있도록 설정
      builder: (BuildContext dialogContext) {
        // 다이얼로그 표시 후 2초 뒤 자동으로 닫기
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            Navigator.of(dialogContext).pop(); // 다이얼로그 닫기
          }
        });

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // 둥근 모서리
          ),
          contentPadding: const EdgeInsets.all(20.0), // 내부 패딩
          content: Column(
            mainAxisSize: MainAxisSize.min, // 콘텐츠 크기에 맞춤
            children: [
              const Icon(
                Icons.check_circle_outline, // 체크 아이콘
                color: Colors.green,
                size: 60,
              ),
              const SizedBox(height: 15),
              Text(
                '이미지가 갤러리에 저장되었습니다!',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                '2초 뒤 자동으로 사라집니다.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  void _downloadImageFromS3() async {
    // 이미 다운로드 중이면 다시 실행하지 않음
    if (_isDownloading) return;

    setState(() {
      _isDownloading = true; // 다운로드 시작 상태로 변경
    });

    try {
      // S3 이미지 URL 동적 생성
      final String url = 'https://heeee-static-datas.s3.ap-northeast-2.amazonaws.com/images/MBTI_${widget.mbtiResult}.png';

      // 임시 저장 경로 설정
      final tempDir = await getTemporaryDirectory();
      final path = '${tempDir.path}/${widget.mbtiResult}.png';

      // Dio를 사용하여 파일 다운로드
      await Dio().download(url, path);

      // GallerySaver를 사용하여 갤러리에 저장
      await GallerySaver.saveImage(path, albumName: 'MBTI 결과');

      if (mounted) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('이미지가 갤러리에 다운로드되었습니다!')),
        // );
        _showCustomDownloadSuccessDialog();
      }
    } catch (e) {
      logger.e('이미지 다운로드 실패: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('이미지 다운로드에 실패했습니다.')),
        );
      }
    } finally {
      // 성공/실패 여부와 관계없이 다운로드 상태 종료
      if (mounted) {
        setState(() {
          _isDownloading = false;
        });
      }
    }
  }
}