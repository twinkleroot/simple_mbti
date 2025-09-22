import 'package:flutter/material.dart';

void main() => runApp(const MBTIApp());

// 앱의 기본 설정
class MBTIApp extends StatelessWidget {
  const MBTIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '간단 MBTI 테스트',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Pretendard', // 앱 전체에 적용할 폰트 (필요시 pubspec.yaml에 추가)
      ),
      home: const HomeScreen(),
    );
  }
}

// 1. 시작 화면
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            // Image.asset(
              // 'assets/main_image.png', // 예시 이미지 (assets 폴더에 추가 필요)
              // height: 200,
              // 이미지가 없는 경우 아래 코드로 대체
              // child: Icon(Icons.psychology, size: 150, color: Colors.blue),
            // ),
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
                  MaterialPageRoute(builder: (context) => const QuestionScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// 2. 질문 화면
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

  void _answerQuestion(String type) {
    setState(() {
      _scores[type] = _scores[type]! + 1;
      _questionIndex++;
    });

    if (_questionIndex >= _questions.length) {
      _showResult();
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
      MaterialPageRoute(
        builder: (context) => ResultScreen(mbtiResult: mbtiResult),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
    );
  }
}

// 3. 결과 화면
class ResultScreen extends StatelessWidget {
  final String mbtiResult;

  const ResultScreen({super.key, required this.mbtiResult});

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
              mbtiResult,
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              mbtiDescriptions[mbtiResult] ?? '결과를 찾을 수 없습니다.',
              style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('다시 검사하기'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                      (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}