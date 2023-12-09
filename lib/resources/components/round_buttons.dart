import 'package:flutter/material.dart';
import 'package:weather_app/resources/color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    required this.title,
    this.loading = false,
    this.onPress,
  });

  final String title;
  final bool loading;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 12,
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: AppColors.bgCardColor,
                  strokeAlign: -2,
                  strokeWidth: 3,
                )
              : Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
