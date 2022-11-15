import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:look_style/pages/board_register_page.dart';
import 'package:look_style/utility/custom_icons_icons.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key, this.email, this.nickname}) : super(key: key);

  String? email;
  String? nickname;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedPageIndex = 0;

  List _pages = [
    Text('1'),
    Text('2'),
    Text('3'),
    Text('4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                        )
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10),
                              Container(
                                height: 5,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                              SizedBox(height: 10),
                              Text('새 게시물 등록', style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 10),
                              Divider(thickness: 0.3, height: 1,),
                              ListTile(
                                leading: Icon(CustomIcons.outfit),
                                title: Text('Fashion'),
                                onTap: () {
                                  Get.to(BoardRegisterPage());
                                },
                                trailing: Icon(Icons.add),
                              ),
                              ListTile(
                                leading: Icon(CustomIcons.salon),
                                title: Text('Hair style'),
                                onTap: () {
                                  Get.to(BoardRegisterPage());
                                },
                                trailing: Icon(Icons.add),
                              ),
                              ListTile(
                                leading: Icon(CustomIcons.makeup),
                                title: Text('Make-up'),
                                onTap: () {
                                  Get.to(BoardRegisterPage());
                                },
                                trailing: Icon(Icons.add),
                              ),
                            ],
                          ),
                        );
                      }
                  );
                },
                icon: Icon(CustomIcons.add_square),
          ),
          title: Text(
            "Look Style",
            style:
                TextStyle(color: Colors.black, fontFamily: 'bazzi', fontSize: 25),
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.3)),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white10,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
            ),
          ],
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          border: Border(top: BorderSide(color: Colors.grey, width: 0.3))
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(CustomIcons.outfit), label: '패션'),
            BottomNavigationBarItem(icon: Icon(CustomIcons.salon), label: '헤어스타일'),
            BottomNavigationBarItem(icon: Icon(CustomIcons.makeup), label: '메이크업'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: '마이페이지')
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
}
