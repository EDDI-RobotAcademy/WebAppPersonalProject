import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/forms/BoardListView.dart';
import '../components/custom_drawer.dart';
import '../components/custom_app_bar.dart';
import '../utility/board_list_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BoardListProvider _providerTest;
  dynamic userInfo;
  bool loginState = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _providerTest = Provider.of<BoardListProvider>(context, listen: false);
    _providerTest.loadEveryBoards();

    return Scaffold(
      appBar: CommonAppBar(title: "HOME-ALONE"),
      body: Consumer<BoardListProvider>(
          builder: (context, provider, widget){
            if (provider.boards != null && provider.boards.length > 0) {
              return BoardListView(boards: provider.boards, listTitle: "전체 게시글 목록",);
            }
            return Center(
              child: Text("존재하는 게시물이 없습니다!"),
            );
          },
        ),
      drawer: CustomDrawer(isLogin: loginState),
    );
  }
}
