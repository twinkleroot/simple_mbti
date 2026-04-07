import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'logger.dart'; // 기존 로거

class AdTracker {
  static const String _keyLastAdTime = 'last_ad_time';
  static const String _keyImpressions = 'ad_impressions';
  static const String _keyClicks = 'ad_clicks';

  // 광고를 보여줘도 되는지 검사하는 함수 (1시간 쿨다운 & CTR 어뷰징 차단)
  static Future<bool> canShowAd() async {
    final prefs = await SharedPreferences.getInstance();

    // 1. 1시간 노출 빈도 제한 (Frequency Capping)
    final lastAdTimeString = prefs.getString(_keyLastAdTime);
    if (lastAdTimeString != null) {
      final lastAdTime = DateTime.parse(lastAdTimeString);
      final difference = DateTime.now().difference(lastAdTime);

      if (difference.inHours < 1) {
        logger.i('광고 제한: 마지막 노출 후 1시간이 지나지 않았습니다. (${difference.inMinutes}분 경과)');
        return false; // 1시간 쿨다운 차단
      }
    }

    // 2. 비정상 활동 감지 (CTR 10% 이상 차단)
    final impressions = prefs.getInt(_keyImpressions) ?? 0;
    final clicks = prefs.getInt(_keyClicks) ?? 0;

    // 최소 노출 횟수(예: 10회)가 넘었을 때만 CTR을 계산하여 억울한 차단 방지
    if (impressions >= 10) {
      final ctr = clicks / impressions;
      if (ctr >= 0.1) { // CTR 10% 이상
        logger.w('광고 제한: 비정상적인 클릭률(CTR: ${(ctr * 100).toStringAsFixed(1)}%)이 감지되어 광고를 차단합니다.');
        // 소명용으로 Firebase에 어뷰징 기기 로깅
        await FirebaseAnalytics.instance.logEvent(
          name: 'ad_abusing_detected',
          parameters: {'ctr': ctr, 'impressions': impressions, 'clicks': clicks},
        );
        return false; // 어뷰징 차단
      }
    }

    return true; // 모든 검사를 통과하면 광고 허용
  }

  // 광고 노출 시 호출 (시간 기록 및 노출 수 증가)
  static Future<void> logImpression() async {
    final prefs = await SharedPreferences.getInstance();

    // 현재 시간을 마지막 노출 시간으로 저장
    await prefs.setString(_keyLastAdTime, DateTime.now().toIso8601String());

    // 노출 수 증가
    final impressions = prefs.getInt(_keyImpressions) ?? 0;
    await prefs.setInt(_keyImpressions, impressions + 1);

    // Firebase 로깅
    await FirebaseAnalytics.instance.logEvent(name: 'custom_ad_impression');
  }

  // 광고 클릭 시 호출 (클릭 수 증가)
  static Future<void> logClick() async {
    final prefs = await SharedPreferences.getInstance();

    // 클릭 수 증가
    final clicks = prefs.getInt(_keyClicks) ?? 0;
    await prefs.setInt(_keyClicks, clicks + 1);

    // Firebase 로깅
    await FirebaseAnalytics.instance.logEvent(name: 'custom_ad_click');
  }
}