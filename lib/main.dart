import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './data/ui_data.dart';
import './screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // .env 파일 로드. 앱 시작 시 딱 한 번만 호출하면 됩니다.
  await dotenv.load(fileName: ".env");

  KakaoSdk.init(nativeAppKey: dotenv.env['KAKAO_NATIVE_APP_KEY']!);

  await MobileAds.instance.initialize();
  runApp(const MBTIApp());
}

// 앱의 기본 설정
class MBTIApp extends StatelessWidget {
  const MBTIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '간단 MBTI 테스트',
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