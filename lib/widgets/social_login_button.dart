import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

/// 로그인 화면의 흰색 둥근 소셜 로그인 버튼 (362x52, 아이콘 + 가운데 라벨).
class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.label,
    required this.iconAsset,
    required this.iconSize,
    required this.onPressed,
  });

  final String label;
  final String iconAsset;
  final Size iconSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 362,
      height: 52,
      child: Material(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26),
          side: const BorderSide(color: AppColors.lavenderLine, width: 0.5),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 아이콘 중심이 버튼 왼쪽에서 31.5px (Figma 기준)
              Positioned(
                left: 14,
                width: 35,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Image.asset(
                    iconAsset,
                    width: iconSize.width,
                    height: iconSize.height,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: iconSize.width,
                      height: iconSize.height,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.lavenderLine),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                label,
                textAlign: TextAlign.center,
                style: GoogleFonts.jua(fontSize: 16, color: AppColors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
