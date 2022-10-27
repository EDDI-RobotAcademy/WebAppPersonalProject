import 'package:flutter/material.dart';

class DrawerListTilePages extends StatelessWidget {
  /// 메뉴를 눌렀을 때 나타나는 Page List <br>
  /// pageName : 이동할 페이지() <br>
  /// pageTitle : 상단 타이틀 text <br>
  /// iconsName : 설정할 아이콘, 컬러
  const DrawerListTilePages({Key? key,
    required this.pageName,
    required this.pageTitle,
    required this.iconsName, Color? color
  }) : super(key: key);

  final Function() pageName;
  final String pageTitle;
  final IconData iconsName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconsName,
          color:Colors.grey[850]),
      title: Text(pageTitle),
      onTap:(){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return pageName();
            }
            )
        );
      },
      trailing: const Icon(Icons.add),
    );
  }
}
