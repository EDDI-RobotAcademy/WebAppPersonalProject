import 'package:demo/app_theme.dart';
import 'package:demo/widgets/recipe/all_recipes_form.dart';
import 'package:demo/screens/recipe_screen.dart';
import 'package:demo/widgets/authentication/login_form.dart';
import 'package:demo/widgets/custom_appbar.dart';
import 'package:demo/widgets/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import '../model/tmp_recipe.dart';
import '../widgets/hot/hot_recipe_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = LoginFormState().email;

  List<Recipe> recipes = [
    Recipe.fromMap(
      {
        'title': '1분만에 뚝딱 간장계란밥, 정말로 맛있어요ㅋㅋㅋㅋㅋ',
        'nickname': '요리사',
        'foodCategory': '한식',
        'images': ['assets/images/tmp/ggb.png','assets/images/tmp/gcb.png'],
        'like': false,
        'rating': 4.5,
        'boardNo': 1,
        'content' : """
        1. 재료:밥1공기,계란3개,식용유2스푼,진간장1스푼,참기름1스푼,깨 (1인분기준입니다)
        
        
        2. 계란3개중에 2개만 이렇게 풀어서 준비합니다.	
        
        
        3. 풀어놓은 계란은 후라이팬에 식용유를 넣고 젓가락으로 휘져어 가면서 너무 뭉치지 않게 해주세요. 자 이제 에그스크럼블식으로 만든 계란은 가스불을 꺼주세요.
        
        
        4. 여기에 따뜻한 밥1그릇을 넣고, (만약에 찬밥을이용해서 하실분들은 가스불을 끄지 않고 밥을 넣고 계란과 함께 볶아주세요)
       
       
        5. 진간장1스푼,참기름1스푼을 넣고,
        
        
        6. 밥과 계란, 그리고 양념이 잘섞이도록 섞어줍니다.
        
        
        7. 이제 계란1개를 반숙으로 튀겨주듯이 후라이를 해줍니다.
        
        
        8. 그릇에 간장계란밥을 올리고 반숙후라이를 올린후  집에 김이 있으면 김을 잘라 올려주시면 간장계란밥 완성입니다!
        """
      },
    ),
    Recipe.fromMap(
      {
        'title': '매일 먹어도 맛있는 김치볶음밥',
        'nickname': '요리사',
        'foodCategory': '한식',
        'images': ['assets/images/tmp/gcb.png','assets/images/tmp/ggb.png'],
        'like': false,
        'rating': 4.5,
        'boardNo': 2,
        'content' : "a"
      },
    ),
    Recipe.fromMap(
      {
        'title': '입맛없을때 최고! 여름철 별미 우럭물회',
        'nickname': '요리사',
        'foodCategory': '한식',
        'images': [ 'assets/images/tmp/mh.png','assets/images/tmp/ggb.png','assets/images/tmp/ggb.png'],
        'like': false,
        'rating': 4.5,
        'boardNo': 3,
        'content' : "a"
      },
    ),
    Recipe.fromMap(
      {
        'title': '간단하고 맛있는 간계밥',
        'nickname': '요리사',
        'foodCategory': '한식',
        'images': ['assets/images/tmp/ggb.png','assets/images/tmp/ggb.png'],
        'like': false,
        'rating': 0.0,
        'boardNo': 4,
        'content' : "a"
      },
    ),
    Recipe.fromMap(
      {
        'title': '간단하고 맛있는 간계밥',
        'nickname': '요리사',
        'foodCategory': '기타',
        'images': ['assets/images/tmp/ggb.png','assets/images/tmp/ggb.png'],
        'like': false,
        'rating': 4.5,
        'boardNo': 5,
        'content' : "a"
      },
    ),
    Recipe.fromMap(
      {
        'title': '간단하고 맛있는 간계밥',
        'nickname': '요리사',
        'foodCategory': '기타',
        'images': ['assets/images/tmp/ggb.png','assets/images/tmp/ggb.png'],
        'like': false,
        'rating': 4.5,
        'boardNo': 6,
        'content' : "a"
      },
    ),
    Recipe.fromMap(
      {
        'title': '간단하고 맛있는 간계밥',
        'nickname': '요리사',
        'foodCategory': '기타',
        'images': ['assets/images/tmp/ggb.png','assets/images/tmp/ggb.png'],
        'like': false,
        'rating': 4.5,
        'boardNo': 7,
        'content' : "a"
      },
    ),
    Recipe.fromMap(
      {
        'title': '간단하고 맛있는 간계밥',
        'nickname': '요리사',
        'foodCategory': '기타',
        'images': ['assets/images/tmp/ggb.png','assets/images/tmp/ggb.png'],
        'like': false,
        'rating': 4.5,
        'boardNo': 8,
        'content' : "a"
      },
    ),
    Recipe.fromMap(
      {
        'title': '간단하고 맛있는 간계밥',
        'nickname': '요리사',
        'foodCategory': '기타',
        'images': ['assets/images/tmp/ggb.png','assets/images/tmp/ggb.png'],
        'like': false,
        'rating': 4.5,
        'boardNo': 9,
        'content' : "a"
      },
    ),
    Recipe.fromMap(
      {
        'title': '간단하고 맛있는 간계밥',
        'nickname': '요리사',
        'foodCategory': '기타',
        'images': ['assets/images/tmp/ggb.png','assets/images/tmp/ggb.png'],
        'like': false,
        'rating': 4.5,
        'boardNo': 10,
        'content' : "a"
      },
    ),
    Recipe.fromMap(
      {
        'title': '간단하고 맛있는 간계밥',
        'nickname': '요리사',
        'foodCategory': '기타',
        'images': ['assets/images/tmp/ggb.png','assets/images/tmp/ggb.png'],
        'like': false,
        'rating': 4.5,
        'boardNo': 11,
        'content' : "a"
      },
    ),
    Recipe.fromMap(
      {
        'title': '간단하고 맛있는 간계밥',
        'nickname': '요리사',
        'foodCategory': '기타',
        'images': ['assets/images/tmp/ggb.png','assets/images/tmp/ggb.png'],
        'like': false,
        'rating': 4.5,
        'boardNo': 12,
        'content' : "a"
      },
    ),
    Recipe.fromMap(
      {
        'title': '간단하고 맛있는 간계밥',
        'nickname': '요리사',
        'foodCategory': '기타',
        'images': ['assets/images/tmp/ggb.png','assets/images/tmp/ggb.png'],
        'like': false,
        'rating': 4.5,
        'boardNo': 13,
        'content' : "a"
      },
    ),
    Recipe.fromMap(
      {
        'title': '간단하고 맛있는 간계밥',
        'nickname': '요리사',
        'foodCategory': '기타',
        'images': ['assets/images/tmp/ggb.png','assets/images/tmp/ggb.png'],
        'like': false,
        'rating': 4.5,
        'boardNo': 14,
        'content' : "a"
      },
    ),
    Recipe.fromMap(
      {
        'title': '간단하고 맛있는 간계밥',
        'nickname': '요리사',
        'foodCategory': '기타',
        'images': ['assets/images/tmp/ggb.png','assets/images/tmp/ggb.png'],
        'like': false,
        'rating': 4.5,
        'boardNo': 15,
        'content' : "a"
      },
    ),
    Recipe.fromMap(
      {
        'title': '간단하고 맛있는 간계밥',
        'nickname': '요리사',
        'foodCategory': '기타',
        'images': ['assets/images/tmp/ggb.png','assets/images/tmp/ggb.png'],
        'like': false,
        'rating': 4.5,
        'boardNo': 16,
        'content' : "a"
      },
    ),
    Recipe.fromMap(
      {
        'title': '간단하고 맛있는 간계밥',
        'nickname': '요리사',
        'foodCategory': '기타',
        'images': ['assets/images/tmp/ggb.png','assets/images/tmp/ggb.png'],
        'like': false,
        'rating': 4.5,
        'boardNo': 17,
        'content' : "a"
      },
    ),
    Recipe.fromMap(
      {
        'title': '입맛없을때 최고! 여름철 별미 우럭물회',
        'nickname': '요리사',
        'foodCategory': '기타',
        'images': ['assets/images/tmp/ggb.png','assets/images/tmp/ggb.png'],
        'like': false,
        'rating': 4.5,
        'boardNo': 18,
        'content' : "a"
      },
    ),
    Recipe.fromMap(
      {
        'title': '간단하고 맛있는 간계밥',
        'nickname': '요리사',
        'foodCategory': '기타',
        'images': ['assets/images/tmp/ggb.png','assets/images/tmp/ggb.png'],
        'like': false,
        'rating': 4.5,
        'boardNo': 19,
        'content' : "a"
      },
    ),
    Recipe.fromMap(
      {
        'title': '간단하고 맛있는 간계밥',
        'nickname': '요리사',
        'foodCategory': '기타',
        'images': ['assets/images/tmp/ggb.png','assets/images/tmp/ggb.png'],
        'like': false,
        'rating': 4.5,
        'boardNo': 20,
        'content' : "a"
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: AppTheme.natureWhite,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: customAppbar(),
          endDrawer: const CustomDrawer(),
          body: Column(
            children: <Widget>[
              SizedBox(
                height: size.height * 0.03,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                    height: size.height * 10.48,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        HotRecipeListView(
                          callBack: () {
                            moveTo();
                          },
                        ),
                        SizedBox(height: size.height * 0.03),
                        AllRecipesForm(recipes: recipes)
                      ],
                    )),
              )),
            ],
          ),
        ));
  }

  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => RecipeScreen(),
      ),
    );
  }
}
