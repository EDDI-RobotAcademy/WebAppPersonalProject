import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/api/spring_member_api.dart';
import 'package:frontend/utility/providers/login_data_provider.dart';
import 'package:provider/provider.dart';

import '../components/forms/board_list_view.dart';
import '../components/custom_drawer.dart';
import '../components/custom_app_bar.dart';
import '../utility/providers/board_list_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserDataResponse res;
  late BoardListProvider _providerTest;
  late LoginDataProvider _loginDataProvider;

  @override
  void initState() {
    _loginDataProvider = Provider.of<LoginDataProvider>(context, listen: false);
    _providerTest = Provider.of<BoardListProvider>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _providerTest.loadEveryBoards();
    debugPrint("homepage loginstate:" + _loginDataProvider.loginState.toString());

    if(_loginDataProvider.loginState == true) {
      _loginDataProvider.getUserData();
    }

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
      drawer: CustomDrawer(),
    );
  }
}
