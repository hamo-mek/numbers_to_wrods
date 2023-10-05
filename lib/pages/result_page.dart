import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:number_to_words_english/number_to_words_english.dart';

class ResultBox extends StatefulWidget {
  final int number;
  const ResultBox({
    super.key,
    required this.number,
  });

  @override
  State<ResultBox> createState() => _ResultBoxState();
}

class _ResultBoxState extends State<ResultBox> {
  String convertNumberToWord(int number) {
    return NumberToWordsEnglish.convert(number);
  }

  String capitalizeFirstLetter(String word) {
    if (word == null || word.isEmpty) {
      return word;
    }
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0.r),
              ),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(
                            capitalizeFirstLetter(
                              convertNumberToWord(widget.number),
                            ),
                            style: TextStyle(
                              fontSize: 17.0.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: IconButton(
                      icon: Icon(
                        Icons.text_snippet,
                        color: Colors.grey.shade700,
                      ),
                      onPressed: () {
                        Clipboard.setData(new ClipboardData(
                            text: convertNumberToWord(widget.number)));
                        Fluttertoast.showToast(
                          msg: "Text copied to clipboard",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0.sp,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.grey.shade700,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
