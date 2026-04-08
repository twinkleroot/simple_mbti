import 'package:flutter/material.dart';
import '../data/ui_data.dart';
import '../utils/fade_page_route.dart';
import '../services/question_manager.dart';
import '../widgets/reusable_banner.dart';
import 'question_screen.dart';

// 1. 시작 화면 (StatefulWidget으로 변경)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('MBTI 성격 유형 검사'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(Icons.psychology, size: 120, color: primaryColor.withValues(alpha: 0.8)),
                  const SizedBox(height: 24),
                  Text(
                    '나의 진짜 성격 유형 찾기',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '간단한 질문을 통해 16가지 성격 유형 중\n나와 가장 잘 맞는 유형을 알아보세요!',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  ElevatedButton(
                      child: const Text('검사 시작하기'),
                      onPressed: () {
                        // QuestionManager를 통해 랜덤 질문 세트를 받아옴
                        final questionSet = QuestionManager().getRandomQuestionSet();

                        // QuestionScreen에 받아온 질문 세트를 전달
                        Navigator.push(
                          context,
                          FadePageRoute(
                            builder: (context) => QuestionScreen(questions: questionSet),
                          ),
                        );
                      }
                  ),
                ],
              ),
            ),
          ),
          // 4. 화면 하단에 광고 위젯 추가
          bottomNavigationBar: const ReusableBannerAd(),
        ),
    );
  }
}

