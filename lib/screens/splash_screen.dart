import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'login_screen.dart';

/// Figma "0. 로그인" (107:874) — 402x874 프레임 기준 좌표를 화면 높이에 맞춰 배치.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const _frameHeight = 874.0;

  void _goToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _goToLogin(context),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                // Figma: linear-gradient(160deg, lavender 7.15%, mint 92.31%)
                begin: Alignment(-0.34, -1),
                end: Alignment(0.34, 1),
                colors: [AppColors.lavender, AppColors.mint],
                stops: [0.0715, 0.9231],
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final w = constraints.maxWidth;
                final scale = constraints.maxHeight / _frameHeight;
                double y(double figmaTop) => figmaTop * scale;
                double fromCenter(double offset) => w / 2 + offset;

                return Stack(
                  children: [
                    // 별 장식 4개
                    _star(left: 48, top: y(140), size: 16),
                    _star(left: fromCenter(139), top: y(170), size: 12),
                    _star(left: 70, top: y(620), size: 14),
                    _star(left: fromCenter(119), top: y(600), size: 10),
                    // 글자 로고
                    Positioned(
                      left: fromCenter(-65),
                      top: y(283),
                      child: const _AssetOrPlaceholder(
                        'assets/images/logo_wordmark_white.png',
                        width: 129,
                        height: 29,
                      ),
                    ),
                    // 큰 쿠키
                    Positioned(
                      left: fromCenter(-89),
                      top: y(346),
                      child: const _AssetOrPlaceholder(
                        'assets/images/cookie_splash.png',
                        width: 178,
                        height: 144.19,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: y(569),
                      child: Text(
                        '오늘도 좋은 하루가 될 거예요',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.jua(
                          fontSize: 16,
                          height: 1.4,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: y(753),
                      child: Text(
                        '화면을 터치해 주세요',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.gowunDodum(
                          fontSize: 11.5,
                          height: 1.4,
                          color: AppColors.deepSlate,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _star({
    required double left,
    required double top,
    required double size,
  }) {
    return Positioned(
      left: left,
      top: top,
      child: _AssetOrPlaceholder(
        'assets/images/splash_star.png',
        width: size,
        height: size,
      ),
    );
  }
}

/// 에셋이 아직 없으면 같은 크기의 반투명 자리만 표시.
class _AssetOrPlaceholder extends StatelessWidget {
  const _AssetOrPlaceholder(
    this.path, {
    required this.width,
    required this.height,
  });

  final String path;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.25),
          border: Border.all(color: AppColors.white.withValues(alpha: 0.7)),
        ),
      ),
    );
  }
}
