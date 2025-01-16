import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/theme.dart';
import 'package:flutter_svg/svg.dart';

class IconTitleOutlineWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool isRedBg;
  final String? trailingText;
  final VoidCallback onPressed;

  const IconTitleOutlineWidget({
    super.key,
    required this.title,
    required this.iconPath,
    this.isRedBg = false,
    this.trailingText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isRedBg ? const Color(0xFFFF0000) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFE9E9E9),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    iconPath,
                    colorFilter: ColorFilter.mode(
                      isRedBg ? Colors.white : AppColors.iconColor,
                      BlendMode.srcIn,
                    ),
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: isRedBg ? Colors.white : AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (trailingText != null && trailingText!.isNotEmpty)
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    trailingText!,
                    style: TextStyle(
                      color: isRedBg ? Colors.white : AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
