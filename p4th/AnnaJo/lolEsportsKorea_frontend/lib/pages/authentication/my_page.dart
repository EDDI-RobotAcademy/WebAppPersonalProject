import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lol_esports_korea_app/pages/authentication/sign_in_page.dart';

import '../../components/app_bar/common_top_app_bar.dart';
import '../../utility/size.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  static const _storage = FlutterSecureStorage();
  dynamic userInfo = '';
  dynamic nickname = '';
  dynamic email = '';
  dynamic memberPoint = '';

  /// 회원 정보 불러오기
  Future<void> _memberInfoRead() async {
    try {
      userInfo = await _storage.read(key: 'userToken');
      nickname = await _storage.read(key: 'nickname');
      email = await _storage.read(key: 'email');
      memberPoint = await _storage.read(key: 'memberPoint');
      if (userInfo == null) {
        debugPrint('로그인 페이지로 이동');
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignInPage()));
      } else {
        setState(() {
          nickname = nickname;
          email = email;
          memberPoint = memberPoint;
        });
        debugPrint('회원 접속중');
      }
    } catch (e) {
      debugPrint('e');
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _memberInfoRead();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonTopAppBar(
          title: const Text('My Page'),
          appBar: AppBar(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              children: <Widget>[
            Container(
                height: 250,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(width: 1, color: Colors.black)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '환영합니다. $nickname님 🥰❤️',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: medium_gap),
                        Text(
                          'My Point : $memberPoint',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Center(
                          child: Container(
                            height: 40.0,
                            width: 220.0,
                            margin: const EdgeInsets.all(10.0),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              gradient: LinearGradient(
                                  colors: [Colors.deepPurple, Colors.indigo],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  tileMode: TileMode.clamp),
                            ),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    '내 정보 변경하기',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,),
                                  ),
                                  SizedBox(width: medium_gap),
                                  Icon(Icons.vpn_key_rounded, color: Colors.white,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ]),
        ));
  }
}
