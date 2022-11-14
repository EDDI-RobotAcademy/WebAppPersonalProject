import 'package:flutter/material.dart';
import 'package:lol_esports_korea_app/utility/size.dart';

import '../../../utility/common_check_box.dart';

class AcceptCheck extends StatelessWidget {
  const AcceptCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 160,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  "이용약관/개인정보 수집 동의 내용 \n"
                  "약관내용 test 약관내용 test 약관내용 test 약관내용 test"
                  "약관내용 test 약관내용 test 약관내용 test 약관내용 test"
                  "약관내용 test 약관내용 test 약관내용 test 약관내용 test"
                  "약관내용 test 약관내용 test 약관내용 test 약관내용 test"
                  "약관내용 test 약관내용 test 약관내용 test 약관내용 test"
                  "약관내용 test 약관내용 test 약관내용 test 약관내용 test"
                  "약관내용 test 약관내용 test 약관내용 test 약관내용 test"
                  "약관내용 test 약관내용 test 약관내용 test 약관내용 test"
                  "약관내용 test 약관내용 test 약관내용 test 약관내용 test"
                  "약관내용 test 약관내용 test 약관내용 test 약관내용 test"
                  "약관내용 test 약관내용 test 약관내용 test 약관내용 test"
                  "약관내용 test 약관내용 test 약관내용 test 약관내용 test"
                  "약관내용 test 약관내용 test 약관내용 test 약관내용 test",
                  style: TextStyle(color: Colors.white12),
                ),
              ),
            ),
            const SizedBox(height: small_gap),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
              CommonCheckBox(),
              SizedBox(width: small_gap),
              Text(
                "동의합니다.",
                style: TextStyle(color: Colors.white),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
