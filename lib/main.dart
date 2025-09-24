import 'package:flutter/material.dart';
// 광고 패키지를 import 합니다.
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io'; // Platform 확인을 위해 추가
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();

  KakaoSdk.init(nativeAppKey: '8fb42a2c21d5aacb4e272f60014ca431');
  runApp(const MBTIApp());
}

// 앱의 기본 설정
class MBTIApp extends StatelessWidget {
  const MBTIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '간단 MBTI 테스트',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 3초 후에 홈 화면으로 이동합니다.
    Future.delayed(const Duration(seconds: 3), _navigateToHome);
  }

  void _navigateToHome() {
    // 위젯이 화면에 없을 때 setState 등을 호출하는 에러를 방지합니다.
    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      FadePageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 이미지를 화면 중앙에 배치합니다.
      body: Center(
        // 여기에 준비한 이미지 파일 경로를 넣으세요.
        child: Image.asset('assets/loading.png'),
      ),
    );
  }
}

// 1. 시작 화면 (StatefulWidget으로 변경)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 3. 광고 관련 변수 추가
  late BannerAd _bannerAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    final adUnitId = 'ca-app-pub-9349659716533734/1643573240'; // Android 테스트 ID
    // 플랫폼에 따라 다른 테스트 ID를 사용합니다.
    // final adUnitId = Platform.isAndroid
    //     ? 'ca-app-pub-3940256099942544/6300978111' // Android 테스트 ID
    //     : 'ca-app-pub-3940256099942544/2934735716'; // iOS 테스트 ID
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('MBTI 성격 유형 검사'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '나의 성격 유형을 알아볼까요?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Icon(Icons.psychology, size: 150, color: Colors.blue),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('검사 시작하기'),
              onPressed: () {
                Navigator.push(
                  context,
                  FadePageRoute(builder: (context) => const QuestionScreen()),
                );
              },
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

// ## 2. 질문 화면 ##
class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _questionIndex = 0;
  final Map<String, int> _scores = {
    'E': 0, 'I': 0, 'S': 0, 'N': 0, 'T': 0, 'F': 0, 'J': 0, 'P': 0,
  };

  // 질문 목록 (총 12개)
  final List<Map<String, Object>> _questions = const [
    // E/I 질문 3개
    {
      'questionText': '주말에 당신은...',
      'answers': [
        {'text': '친구들과 만나 파티를 즐긴다.', 'type': 'E'},
        {'text': '집에서 조용히 혼자 시간을 보낸다.', 'type': 'I'},
      ],
    },
    {
      'questionText': '새로운 사람을 만났을 때...',
      'answers': [
        {'text': '먼저 말을 걸며 대화를 주도한다.', 'type': 'E'},
        {'text': '상대방이 말을 걸 때까지 기다린다.', 'type': 'I'},
      ],
    },
    {
      'questionText': '에너지를 얻는 방식은?',
      'answers': [
        {'text': '사람들과의 교류를 통해', 'type': 'E'},
        {'text': '혼자만의 시간을 통해', 'type': 'I'},
      ],
    },
    // S/N 질문 3개
    {
      'questionText': '일을 처리할 때...',
      'answers': [
        {'text': '현실적이고 실제적인 방법을 선호한다.', 'type': 'S'},
        {'text': '미래의 가능성과 아이디어를 중시한다.', 'type': 'N'},
      ],
    },
    {
      'questionText': '숲을 본다면?',
      'answers': [
        {'text': '나무, 꽃 등 구체적인 것들이 보인다.', 'type': 'S'},
        {'text': '숲 전체의 분위기와 의미를 생각한다.', 'type': 'N'},
      ],
    },
    {
      'questionText': '더 중요한 것은?',
      'answers': [
        {'text': '현재의 사실', 'type': 'S'},
        {'text': '미래의 가능성', 'type': 'N'},
      ],
    },
    // T/F 질문 3개
    {
      'questionText': '친구가 고민을 털어놓을 때...',
      'answers': [
        {'text': '논리적인 해결책을 제시해준다.', 'type': 'T'},
        {'text': '따뜻한 말로 공감하고 위로해준다.', 'type': 'F'},
      ],
    },
    {
      'questionText': '결정을 내릴 때 기준은?',
      'answers': [
        {'text': '객관적인 사실과 원칙', 'type': 'T'},
        {'text': '사람들과의 관계와 감정', 'type': 'F'},
      ],
    },
    {
      'questionText': '더 듣고 싶은 말은?',
      'answers': [
        {'text': '"똑똑하네요"', 'type': 'T'},
        {'text': '"친절하네요"', 'type': 'F'},
      ],
    },
    // J/P 질문 3개
    {
      'questionText': '여행을 간다면...',
      'answers': [
        {'text': '미리 철저하게 계획을 세운다.', 'type': 'J'},
        {'text': '상황에 따라 즉흥적으로 즐긴다.', 'type': 'P'},
      ],
    },
    {
      'questionText': '나의 생활 방식은?',
      'answers': [
        {'text': '체계적이고 정리정돈이 잘 되어 있다.', 'type': 'J'},
        {'text': '자유롭고 유연하게 대처한다.', 'type': 'P'},
      ],
    },
    {
      'questionText': '마감 기한이 다가올 때...',
      'answers': [
        {'text': '미리미리 끝내고 여유를 가진다.', 'type': 'J'},
        {'text': '마감 직전에 집중해서 처리한다.', 'type': 'P'},
      ],
    },
  ];

  // 1. 배너 광고에 필요한 변수 추가
  late BannerAd _bannerAd;
  bool _isBannerAdLoaded = false;

  @override
  void initState() {
    super.initState();
    // 2. initState에서 배너 광고 로드 함수 호출
    _loadBannerAd();
  }

  // 3. 배너 광고 로드 함수 추가
  void _loadBannerAd() {
    final adUnitId = 'ca-app-pub-9349659716533734/1643573240'; // Android 테스트 ID
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isBannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
  }

  void _answerQuestion(String type) {
    _scores[type] = _scores[type]! + 1;

    // 변경점: 다음 질문으로 넘어가기 전에, 마지막 질문인지 먼저 확인합니다.
    if (_questionIndex + 1 >= _questions.length) {
      _showResult(); // 마지막 질문이면 결과 표시 함수를 바로 호출
    } else {
      // 마지막 질문이 아니면, 다음 질문을 보여주기 위해 상태를 업데이트
      setState(() {
        _questionIndex++;
      });
    }
  }

  void _showResult() {
    String mbtiResult = '';
    mbtiResult += (_scores['E']! > _scores['I']!) ? 'E' : 'I';
    mbtiResult += (_scores['S']! > _scores['N']!) ? 'S' : 'N';
    mbtiResult += (_scores['T']! > _scores['F']!) ? 'T' : 'F';
    mbtiResult += (_scores['J']! > _scores['P']!) ? 'J' : 'P';

    Navigator.pushReplacement(
      context,
      FadePageRoute(
        builder: (context) => AdIntroScreen(mbtiResult: mbtiResult),
      ),
    );
  }

  @override
  void dispose() {
    // 4. 배너 광고 리소스 해제 코드 추가
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 기존 질문 화면
    return Scaffold(
      appBar: AppBar(
        title: Text('질문 ${_questionIndex + 1}/${_questions.length}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                _questions[_questionIndex]['questionText'] as String,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ...(_questions[_questionIndex]['answers'] as List<Map<String, Object>>)
                  .map((answer) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: Text(answer['text'] as String),
                  onPressed: () => _answerQuestion(answer['type'] as String),
                );
              }).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _isBannerAdLoaded
          ? SizedBox(
        height: _bannerAd.size.height.toDouble(),
        width: _bannerAd.size.width.toDouble(),
        child: AdWidget(ad: _bannerAd),
      )
          : const SizedBox.shrink(), // 광고가 로드되지 않았을 때는 빈 공간
    );
  }
}

// ## 3. 광고 시청을 안내하는 중간 화면 ##
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

    final adUnitId = 'ca-app-pub-9349659716533734/9186472609';

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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '모든 질문에 답을 마쳤습니다.',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                '광고 하나 보는 동안 분석해서 결과를 보여드릴게요!',
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // 광고 로딩 중일 때는 로딩 아이콘을, 아닐 때는 버튼을 표시
              _isAdLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
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

// 4. 결과 화면 (StatefulWidget으로 변경)
class ResultScreen extends StatefulWidget {
  final String mbtiResult;
  const ResultScreen({super.key, required this.mbtiResult});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  // 3. 광고 관련 변수 추가
  late BannerAd _bannerAd;
  bool _isAdLoaded = false;

  // 플랫폼에 따라 다른 테스트 ID를 사용합니다.
  final adUnitId = 'ca-app-pub-9349659716533734/1643573240'; // Android 테스트 ID
  // final adUnitId = Platform.isAndroid
  //     ? 'ca-app-pub-3940256099942544/6300978111' // Android 테스트 ID
  //     : 'ca-app-pub-3940256099942544/2934735716'; // iOS 테스트 ID

  // 각 MBTI 유형에 대한 간단한 설명
  static const Map<String, String> mbtiDescriptions = {
    'ISTJ': '청렴결백한 논리주의자, 소금형',
    'ISFJ': '용감한 수호자, 권력형',
    'INFJ': '선의의 옹호자, 예언자형',
    'INTJ': '용의주도한 전략가, 과학자형',
    'ISTP': '만능 재주꾼, 백과사전형',
    'ISFP': '호기심 많은 예술가, 성인군자형',
    'INFP': '열정적인 중재자, 잔다르크형',
    'INTP': '논리적인 사색가, 아이디어형',
    'ESTP': '모험을 즐기는 사업가, 활동가형',
    'ESFP': '자유로운 영혼의 연예인, 사교형',
    'ENFP': '재기발랄한 활동가, 스파크형',
    'ENTP': '뜨거운 논쟁을 즐기는 변론가, 발명가형',
    'ESTJ': '엄격한 관리자, 사업가형',
    'ESFJ': '사교적인 외교관, 친선도모형',
    'ENFJ': '정의로운 사회운동가, 언변능숙형',
    'ENTJ': '대담한 통솔자, 지도자형',
  };

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: adUnitId, // 🚨 테스트 ID입니다. 배포 시 실제 ID로 변경하세요.
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
        print('카카오톡 공유 실패: $error');
      }
    } else {
      // 카카오톡이 설치되지 않았을 경우 웹으로 공유 시도 (예시)
      try {
        await launchUrl(Uri.parse('https://developers.kakao.com'));
      } catch (error) {
        print('웹 공유 실패: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('검사 결과'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '당신의 성격 유형은...',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            Text(
              widget.mbtiResult,
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              mbtiDescriptions[widget.mbtiResult] ?? '결과를 찾을 수 없습니다.',
              style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 40),
            // 버튼들을 가로로 배치하기 위해 Row 위젯 사용
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () { /* 다시 검사하기 로직 */ },
                  child: const Text('다시 검사하기'),
                ),
                const SizedBox(width: 20), // 버튼 사이 간격
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFEE500), // 카카오 노란색
                    foregroundColor: const Color(0xFF191919), // 검은색 글씨
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onPressed: _shareToKakao,
                  child: const Text('카톡 공유'),
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

// Fade 효과를 적용하는 커스텀 PageRoute
class FadePageRoute<T> extends PageRouteBuilder<T> {
  // WidgetBuilder는 Widget Function(BuildContext context) 타입입니다.
  final WidgetBuilder builder;

  FadePageRoute({required this.builder})
      : super(
    transitionDuration: const Duration(milliseconds: 500),
    // pageBuilder에서 전달받은 builder를 사용하여 페이지를 생성합니다.
    pageBuilder: (context, animation, secondaryAnimation) => builder(context),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}