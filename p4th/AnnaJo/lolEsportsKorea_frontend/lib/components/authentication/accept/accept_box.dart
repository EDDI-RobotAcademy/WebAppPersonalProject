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
                  "<개인정보 수집·동의서> \n"
                  "1.수집하는 개인정보 항목 이메일 \n"
                  "2.개인정보의 수집 및 이용 목적 제공하신 정보는 앱 서비스 가입을 위해 사용합니다.\n"
                  "① 본인 확인 식별(성명, 이메일, 휴대폰번호) \n"
                  "② 의사소통 및 정보 전달 등에 이용(성명, 이메일, 휴대폰번호)\n"
                  "3.개인정보의 보유 및 잉요기간 수집된 개인정보의 보유 기간은"
                  "앱 서비스 이용 종료 후 1년간이며 삭제 요청시,"
                  "당사자는 개인 정보를 재생이 불가능한 방법으로 즉시 파기합니다. \n"
                  "※ 귀하는 이에 대한 동의를 거부할 수 있습니다.\n"
                  "다만 동의가 없을 경우 당 기관의 앱 서비스 이용이 불가능할 수도 있음을 알려드립니다.",
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
