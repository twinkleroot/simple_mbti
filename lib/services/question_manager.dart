import 'dart:math';
import '../data/mbti_data.dart';

// 앱의 질문 세트를 관리하는 클래스 (싱글턴 패턴)
class QuestionManager {
  // 싱글턴 인스턴스 생성
  static final QuestionManager _instance = QuestionManager._internal();
  factory QuestionManager() {
    return _instance;
  }
  QuestionManager._internal() {
    // 처음 생성될 때 사용 가능한 질문 목록을 전체 목록으로 초기화
    _availableQuestionSets = List.from(allQuestionSets);
  }

  // 사용 가능한 질문 세트 목록
  late List<List<Map<String, Object>>> _availableQuestionSets;

  // 랜덤 질문 세트를 뽑아주는 함수
  List<Map<String, Object>> getRandomQuestionSet() {
    // 만약 사용 가능한 질문 세트가 없다면,
    if (_availableQuestionSets.isEmpty) {
      // 다시 전체 목록으로 초기화 (모든 세트를 다 사용한 경우)
      _availableQuestionSets = List.from(allQuestionSets);
    }

    // 사용 가능한 세트 중에서 랜덤으로 하나를 선택
    final Random random = Random();
    final int index = random.nextInt(_availableQuestionSets.length);
    final List<Map<String, Object>> selectedSet = _availableQuestionSets[index];

    // 뽑힌 세트는 다음 선택지에 나오지 않도록 목록에서 제거
    _availableQuestionSets.removeAt(index);

    return selectedSet;
  }
}