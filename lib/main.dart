import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:simple_mbti/utils/logger.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import './data/ui_data.dart';
import './screens/splash_screen.dart';


Future<void> main() async {
  // Flutter 엔진과 위젯 바인딩을 확실히 초기화합니다.
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase 초기화
  await Firebase.initializeApp();

  final String gameId = '6086329';

  // 앱 전역에서 사용할 유니티 애즈 초기화
  await UnityAds.init(
    gameId: gameId,
    testMode: const bool.fromEnvironment('dart.vm.product') == false,
    onComplete: () => logger.i('Unity Ads 전역 초기화 완료'),
    onFailed: (error, message) => logger.i('Unity Ads 초기화 실패: $message'),
  );

  // 1. Edge-to-Edge 모드를 활성화합니다.
  // 이렇게 하면 앱이 상태 표시줄과 내비게이션 바 영역까지 그려집니다.
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // 2. 시스템 UI 오버레이 스타일을 설정합니다.
  // 상태 표시줄과 내비게이션 바를 투명하게 만듭니다.
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // 상태 표시줄을 투명하게 설정
    statusBarColor: Colors.transparent,
    // 내비게이션 바를 투명하게 설정
    systemNavigationBarColor: Colors.transparent,
    // 내비게이션 바 아이콘 색상 (어두운 배경용)
    systemNavigationBarIconBrightness: Brightness.light,
    // 상태 표시줄 아이콘 색상 (밝은 배경용 - 필요시 Brightness.light로 변경)
    statusBarIconBrightness: Brightness.dark,
  ));

  // .env 파일 로드. 앱 시작 시 딱 한 번만 호출하면 됩니다.
  await dotenv.load(fileName: ".env");

  KakaoSdk.init(nativeAppKey: dotenv.env['KAKAO_NATIVE_APP_KEY']!);

  runApp(const MBTIApp());
}

// 앱의 기본 설정
class MBTIApp extends StatelessWidget {
  const MBTIApp({super.key});

  // 👇 Firebase Analytics 인스턴스 및 옵저버 생성 추가
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MBTI 1분 검사',
      theme: ThemeData(
        brightness: Brightness.dark, // 다크 테마 설정
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: 'Pretendard',
        appBarTheme: const AppBarTheme(
          backgroundColor: backgroundColor, // 앱 바 배경을 전체 배경과 통일
          foregroundColor: textColor,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Pretendard',
            color: textColor,
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: textColor, fontSize: 16),
          bodyMedium: TextStyle(color: textColor, fontSize: 16),
          headlineLarge: TextStyle(color: primaryColor, fontSize: 32, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold),
          // 보조 텍스트 색상을 새로운 상수로 변경
          titleMedium: TextStyle(color: secondaryTextColor, fontSize: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.black, // 골드 배경에는 검은색 텍스트가 잘 보입니다.
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pretendard',
            ),
          ),
        ),
        cardTheme: CardThemeData(
          color: surfaceColor,
          elevation: 0, // 다크 테마에서는 그림자보다 색상 구분이 더 깔끔합니다.
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        // 드롭다운(ExpansionTile) 아이콘 색상 변경
        iconTheme: const IconThemeData(color: primaryColor),
        dividerColor: Colors.white12, // 구분선 색상
      ),
      home: const SplashScreen(),
    );
  }
}