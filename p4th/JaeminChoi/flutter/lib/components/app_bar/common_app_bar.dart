import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:leaing_helper/utility/decorations/color.dart';

import '../../utility/size.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CommonAppBar({Key? key, required this.appBar}) : super(key: key);

  final AppBar appBar;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {

  static final storage = FlutterSecureStorage(); //
    dynamic userInfo = ' ';

  //flutter_secure_storage 사용을 위한 초기화 작업
  @override
  void initState() {
    super.initState();

    // 비동기로 flutter secure storage 정보를 불러오는 작업
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    // read 함수로 key값에 맞는 정보를 불러오고 데이터타입은 String 타입
    // 데이터가 없을때는 null을 반환
    userInfo = await storage.read(key:'login');
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorStyle.defaultBlack,
      title: InkWell(
        onTap: () {Navigator.pushNamed(context, "/main_page");},
        child: Ink(
          height: xlarge_gap,
          width: xlarge_gap,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image:  AssetImage("assets/images/basicLogo.png"),
                fit: BoxFit.cover),
          ),
        ),
      ),
      centerTitle: true,
      actions: userInfo != null ? [
        IconButton(
            icon: const Icon(Icons.house_outlined),
            onPressed: (){},)
      ] : [
        IconButton(
            onPressed: (){},
            icon: const Icon(Icons.login))
      ],
    );
  }
}



