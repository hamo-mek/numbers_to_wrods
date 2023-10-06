import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  MyTextField({
    super.key,
    required this.controller
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
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
      child: TextField(
        controller: controller,
        maxLength: 12,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: '',
          hintText: 'Number to convert',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
