import 'package:demo/screens/authentication%20/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title:'오늘 뭘 해먹지?',
            body: '어떤 요리를 만들어 먹을지 메뉴가 고민이신가요?',
            image: Image.asset('assets/images/introduction/embarrassment.png',
              height: size.height * 0.5
            ),
            decoration: getPageDecoration()
          ),
          PageViewModel(
              title:'편리한 검색기능',
              body: '재료명으로 편리하게 레시피를 찾아보세요.',
              image: Image.asset('assets/images/introduction/cooking.png',
                  height: size.height * 0.5),
              decoration: getPageDecoration()
          ),
          PageViewModel(
              title:'레시피 공유기능',
              body: '나만의 레시피를 공유하고 맘에 드는 레시피를 골라보세요.',
              image: Image.asset('assets/images/introduction/withFood.png',
                  height: size.height * 0.5),
              decoration: getPageDecoration()
          ),
        ],
        done: const Text('시작하기', style: TextStyle(
            fontSize: 18
        )),
        skip: const Text('SKIP', style: TextStyle(
      fontSize: 18
      )),
        showSkipButton: true,
        onDone:() => onDone(context),
        next: const Text('다음', style: TextStyle(
          fontSize: 18
        ),),
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  PageDecoration getPageDecoration(){
    return const PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),
      bodyTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.black87
      ),
      imagePadding: EdgeInsets.only(top: 40),
      imageFlex: 2,
    );
  }
}

void onDone(context) async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('ON_BOARDING', false);
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginScreen())
  );
}