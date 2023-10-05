import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  const MyButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0.h,
      width: 100.0.w,
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(20.0.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1.0.r,
            blurRadius: 5.0.r,
            offset: Offset(5, 5),
          ),
          BoxShadow(
            color: Colors.white,
            spreadRadius: 1.0.r,
            blurRadius: 5.0.r,
            offset: Offset(-5, -5),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const FaIcon(
          FontAwesomeIcons.wandMagicSparkles,
        ),
        tooltip: 'Convert the number you\'ve entered into words',
        color: Colors.grey.shade700,
      ),
    );
  }
}
