import 'package:flutter/material.dart';
import '../utils/fade_page_route.dart';
import '../data/ui_data.dart';
import 'ad_intro_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class QuestionScreen extends StatefulWidget {
  // 생성자를 통해 질문 리스트를 전달받음
  final List<Map<String, Object>> questions;

  const QuestionScreen({super.key, required this.questions});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _questionIndex = 0;
  final Map<String, int> _scores = {
    'E': 0, 'I': 0, 'S': 0, 'N': 0, 'T': 0, 'F': 0, 'J': 0, 'P': 0,
  };

  // 배너 광고에 필요한 변수
  late BannerAd _bannerAd;
  bool _isBannerAdLoaded = false;

  @override
  void initState() {
    super.initState();
    // 배너 광고 로드 함수 호출
    _loadBannerAd();
  }

  // 배너 광고 로드 함수
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
    if (_questionIndex + 1 >= widget.questions.length) {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('질문 ${_questionIndex + 1}/${widget.questions.length}'),
        // 질문 진행 상태를 보여주는 Progress Bar
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: LinearProgressIndicator(
            value: (_questionIndex + 1) / widget.questions.length,
            backgroundColor: Colors.white.withValues(alpha: 0.8),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              widget.questions[_questionIndex]['questionText'] as String,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            ...(widget.questions[_questionIndex]['answers'] as List<Map<String, Object>>)
                .map((answer) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  // 답변 버튼 스타일을 살짝 다르게 설정
                  style: ElevatedButton.styleFrom(
                    backgroundColor: surfaceColor,
                    foregroundColor: primaryColor,
                    elevation: 2,
                    side: const BorderSide(color: primaryColor, width: 1.5),
                  ),
                  child: Text(answer['text'] as String),
                  onPressed: () => _answerQuestion(answer['type'] as String),
                ),
              );
            }),
          ],
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