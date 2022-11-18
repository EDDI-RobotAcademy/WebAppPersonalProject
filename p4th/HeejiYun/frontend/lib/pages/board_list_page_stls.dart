import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/custom_app_bar.dart';
import 'package:frontend/components/custom_drawer.dart';
import 'package:provider/provider.dart';

import '../api/board.dart';
import '../utility/provider_test.dart';

class BoardListPageStls extends StatelessWidget {
  BoardListPageStls({Key? key}) : super(key: key);

  late ProviderTest _providerTest;

  @override
  Widget build(BuildContext context) {
    _providerTest = Provider.of<ProviderTest>(context, listen: false);
    _providerTest.loadBoards();
    return Scaffold(
        appBar: CommonAppBar(title: "자유게시판"),
        drawer: CustomDrawer(isLogin: true,),
        body: Consumer<ProviderTest>(
          builder: (context, provider, widget){
            if (provider.boards != null && provider.boards.length > 0) {
              return _makeListView(provider.boards);
            }
            // 데이터가 없으면 CircularProgressIndicator 수행(로딩)
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        )
    );
  }


  Widget _makeListView(List<Board> boards) {
    return ListView.separated(
      itemCount: boards.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 300, color: Colors.white,
            child: Column(children: [
              Text("제목"),
              _makeBoard(boards[index])
            ]
            ));
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }

    Widget _makeBoard(Board board) {
      return Row(
          children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    board.title.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox( height: 10,)
                ],
              ),
              ),
          ),
        ],
      );
  }
}