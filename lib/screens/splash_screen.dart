import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../utils/fade_page_route.dart';

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
    return SafeArea(
        child: Scaffold(
        // 이미지를 화면 중앙에 배치합니다.
        body: Center(
          // 여기에 준비한 이미지 파일 경로를 넣으세요.
          child: Image.asset('assets/loading.png'),
        ),
      ),
    );
  }
}