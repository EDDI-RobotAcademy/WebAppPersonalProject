import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/forms/board_list_view.dart';
import 'package:frontend/components/custom_app_bar.dart';
import 'package:frontend/components/custom_drawer.dart';
import 'package:provider/provider.dart';

import '../../utility/providers/board_list_provider.dart';

class BoardListPageAsk extends StatelessWidget {
  BoardListPageAsk({Key? key}) : super(key: key);

  late BoardListProvider _providerTest;

  @override
  Widget build(BuildContext context) {
    _providerTest = Provider.of<BoardListProvider>(context, listen: false);
    _providerTest.loadAskBoards();
    return Scaffold(
        appBar: CommonAppBar(title: "질문 게시판"),
        drawer: CustomDrawer(),
        body: Consumer<BoardListProvider>(
          builder: (context, provider, widget){
            if (provider.boards != null && provider.boards.length > 0) {
              return BoardListView(boards: provider.boards, listTitle: "게시물 목록",);
            }
            return Center(
              child: Text("존재하는 게시물이 없습니다!"),
            );
          },
        )
    );
  }
}