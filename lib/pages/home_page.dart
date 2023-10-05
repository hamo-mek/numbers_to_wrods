import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:numbers_to_wrods/pages/result_page.dart';
import 'package:numbers_to_wrods/util/my_button.dart';
import 'package:numbers_to_wrods/util/my_textfield.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGrey6,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 70.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyTextField(controller: controller),
              SizedBox(height: 20.0.h),
              MyButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultBox(
                        number: controller.text.isEmpty ? 0 : int.parse(controller.text),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
