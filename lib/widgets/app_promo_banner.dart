import 'package:flutter/material.dart';
import 'package:simple_mbti/utils/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class AppPromoBanner extends StatelessWidget {
  const AppPromoBanner({super.key});

  // 플레이스토어 링크로 이동하는 함수
  Future<void> _launchPlayStore() async {
    final Uri url = Uri.parse(
        'https://play.google.com/store/apps/details?id=kr.heeblings.parent_helper');

    // LaunchMode.externalApplication을 사용하여 앱 내장 웹뷰가 아닌 외부 브라우저나 구글 플레이스토어 앱으로 열리도록 보장합니다.
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      logger.i('Play Store 링크를 열 수 없습니다: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchPlayStore,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            // 1. 앱 아이콘 영역
            // 추후 실제 앱 아이콘 이미지로 변경하시려면 아래 Container를 Image.asset('경로') 등으로 교체하세요.
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                // 이미지가 컨테이너 영역을 꽉 채우거나 잘리지 않도록 설정이 필요하다면
                // Image 위젯 내에서 fit 속성을 조절하세요.
              ),
              // Icon 대신 Image.asset 사용
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: Image.asset(
                  'assets/parent_helper_icon.png',
                  fit: BoxFit.cover, // 또는 컨테이너에 맞게 이미지 크기 조절
                ),
              ),
            ),
            const SizedBox(width: 16),

            // 2. 텍스트 영역 (앱 이름 및 소개)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    '등하원알리미',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '아이마다 요일마다 다른 등하원시간, 기록하고 잊지않게 알림 받아보세요!',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                      height: 1.3,
                      letterSpacing: -0.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // 3. 이동 화살표 아이콘
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}