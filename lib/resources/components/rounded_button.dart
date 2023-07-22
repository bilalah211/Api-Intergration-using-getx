import 'package:flutter/material.dart';
import 'package:get_a/resources/app_colors/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final double height;
  final double width;
  final String? title;
  final VoidCallback onPressed;
  final Color textColor;
  final Color? colors;
  final bool loading;

  const RoundedButton(
      {super.key,
      this.height = 50,
      this.width = 200,
      this.colors,
      this.textColor = AppColors.whiteColor,
      required this.title,
      required this.onPressed,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
            child: loading
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title!,
                    style: TextStyle(fontSize: 20, color: textColor),
                  )),
      ),
    );
  }
}
