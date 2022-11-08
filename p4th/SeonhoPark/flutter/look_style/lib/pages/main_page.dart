import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:look_style/pages/sign_up_page.dart';
import 'package:look_style/utility/custom_icons_icons.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedPageIndex = 0;

  List _pages = [
    Text("Fashion", style: TextStyle(fontSize: 30)),
    Text("Hair Style", style: TextStyle(fontSize: 30)),
    Text("Make-up", style: TextStyle(fontSize: 30)),
    Text("MyPage", style: TextStyle(fontSize: 30))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 20),
            Center(
                child: Text("새 게시물 등록", style: TextStyle(fontSize: 30,))
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(CustomIcons.outfit),
              title: Text('Fashion'),
              onTap: () {Get.back();},
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(CustomIcons.salon),
              title: Text('Hair Style'),
              onTap: () {},
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(CustomIcons.makeup),
              title: Text('Make-up'),
              onTap: () {},
              trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),
      appBar: AppBar(
          // title: Image.asset('assets/logo.png', fit: BoxFit.fitHeight,),
          // leading: IconButton(
          //     onPressed: (){},
          //     icon: Icon(Icons.menu)
          // ),
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(CustomIcons.add_in_square),
              );
            }
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
      body: Center(
          child: _pages[_selectedPageIndex]
      ),
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
            BottomNavigationBarItem(icon: Icon(CustomIcons.outfit), label: 'Fashion'),
            BottomNavigationBarItem(icon: Icon(CustomIcons.salon), label: 'Hair Style'),
            BottomNavigationBarItem(icon: Icon(CustomIcons.makeup), label: 'Make-up'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'My Page')
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
