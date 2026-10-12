import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/social_login_button.dart';
import 'main_shell.dart';

/// Figma "0. 로그인" (126:213). 세로 간격은 Figma 값을 비율(flex)로 유지.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _goHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const MainShell()),
      (route) => false,
    );
  }

  void _showSignUpPending(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(const SnackBar(content: Text('준비 중이에요')));
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.cream,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 8),
              _header(context),
              const Spacer(flex: 105),
              // 글자 로고 (Figma: 중앙에서 오른쪽으로 3.5px)
              Transform.translate(
                offset: const Offset(3.5, 0),
                child: Image.asset(
                  'assets/images/logo_wordmark_slate.png',
                  width: 129,
                  height: 29,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 129,
                    height: 29,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lavenderLine),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 111),
              SocialLoginButton(
                label: '카카오톡으로 로그인',
                iconAsset: 'assets/images/login_kakao.png',
                iconSize: const Size(25, 23),
                onPressed: () => _goHome(context),
              ),
              const SizedBox(height: 13),
              SocialLoginButton(
                label: '네이버로 로그인',
                iconAsset: 'assets/images/login_naver.png',
                iconSize: const Size(35, 35),
                onPressed: () => _goHome(context),
              ),
              const SizedBox(height: 13),
              SocialLoginButton(
                label: 'Google로 로그인',
                iconAsset: 'assets/images/login_google.png',
                iconSize: const Size(25, 25),
                onPressed: () => _goHome(context),
              ),
              const SizedBox(height: 13),
              SocialLoginButton(
                label: 'Apple로 로그인',
                iconAsset: 'assets/images/login_apple.png',
                iconSize: const Size(25, 25),
                onPressed: () => _goHome(context),
              ),
              const SizedBox(height: 13),
              _emailButton(context),
              const Spacer(flex: 123),
              _signUpRow(context),
              const Spacer(flex: 42),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    final style = GoogleFonts.jua(height: 1.4, color: AppColors.ink);
    return SizedBox(
      height: 48,
      child: Stack(
        children: [
          Positioned(
            left: 22,
            top: 0,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.pop(context),
              child: Text('‹', style: style.copyWith(fontSize: 34)),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 15,
            child: Text(
              '로그인',
              textAlign: TextAlign.center,
              style: style.copyWith(fontSize: 19),
            ),
          ),
        ],
      ),
    );
  }

  Widget _emailButton(BuildContext context) {
    return SizedBox(
      width: 362,
      height: 52,
      child: Material(
        color: AppColors.deepSlate,
        borderRadius: BorderRadius.circular(26),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => _goHome(context),
          child: Center(
            child: Text(
              '또는 이메일로 시작하기',
              style: GoogleFonts.jua(fontSize: 16, color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signUpRow(BuildContext context) {
    final style = GoogleFonts.jua(
      fontSize: 13,
      height: 1.4,
      color: AppColors.deepSlate,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('아직 계정이 없나요?  ', style: style),
        GestureDetector(
          onTap: () => _showSignUpPending(context),
          child: Text('회원가입', style: style),
        ),
      ],
    );
  }
}
