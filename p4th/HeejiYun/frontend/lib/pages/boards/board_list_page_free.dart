import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/forms/board_list_view.dart';
import 'package:frontend/components/custom_app_bar.dart';
import 'package:frontend/components/custom_drawer.dart';
import 'package:provider/provider.dart';

import '../../utility/providers/board_list_provider.dart';

class BoardListPageFree extends StatelessWidget {
  BoardListPageFree({Key? key}) : super(key: key);

  late BoardListProvider _providerTest;

  @override
  Widget build(BuildContext context) {
    _providerTest = Provider.of<BoardListProvider>(context, listen: false);
    _providerTest.loadFreeBoards();
    return Scaffold(
        appBar: CommonAppBar(title: "자유 게시판"),
        drawer: CustomDrawer(),
        body: Consumer<BoardListProvider>(
          builder: (context, provider, widget){
            if (provider.boards != null && provider.boards.length > 0) {
              return BoardListView(boards: provider.boards, listTitle: "게시물 목록",);
            }
            // 데이터가 없으면 CircularProgressIndicator 수행(로딩)
            return Center(
              child: Text("현재 존재하는 게시물이 없습니다!"),
            );
          },
        )
    );
  }
}