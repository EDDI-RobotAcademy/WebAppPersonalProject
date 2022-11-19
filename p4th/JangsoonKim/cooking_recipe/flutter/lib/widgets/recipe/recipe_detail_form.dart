import 'package:flutter/material.dart';
import '../../app_theme.dart';
import '../../model/tmp_recipe.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RecipeDetailForm extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailForm({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetailForm> createState() => _RecipeDetailFormState();
}

class _RecipeDetailFormState extends State<RecipeDetailForm> {
  List<Widget> carouseImages = [];
  bool _like = false;
  int _current = 0;
  double _rate = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _like = widget.recipe.like;
    _rate = widget.recipe.rating;

    for (var i = 0; i < widget.recipe.images.length; i++) {
      carouseImages!.add(Image.asset(widget.recipe.images[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: size.width,
                        enlargeCenterPage: true,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                        reverse: false,
                        autoPlay: false,
                      ),
                      items: widget.recipe.images.map((path) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Image.asset(
                              path,
                              width: size.width,
                              fit: BoxFit.cover,
                            );
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Container(
                      height: 1,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(carouseImages.length, (index) {
                          return Container(
                            width: 8,
                            height: 10,
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.4),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    /*TextButton(
                      onPressed: () {
                        print(widget.recipe.images);
                      },
                      child: Text("출력"),
                    )*/
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Expanded(
                        child: Text(
                          widget.recipe.title,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        widget.recipe.foodCategory,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    _rate == 0
                        ? Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "레시피를 평가해주세요",
                                  style: TextStyle(color: Colors.red),
                                )),
                          )
                        : Row(
                            children: [
                              Text(
                                "${_rate}",
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w400),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.star,
                                      color: Colors.amberAccent,
                                      size: 33,
                                    )),
                              ),
                            ],
                          )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 20, bottom: 15),
                  child: Row(
                    children: [
                      Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage("assets/icons/profile.png"),
                              backgroundColor: Colors.white,
                            ),
                            Text(widget.recipe.nickname,
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: size.height * 0.03,
                            )
                          ]
                      ),
                      Spacer(flex: 1),
                      _like == true
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  _like = false;
                                });
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.redAccent,
                              ))
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  _like = true;
                                });
                              },
                              icon: Icon(
                                Icons.favorite_outline,
                                color: Colors.redAccent,
                                size: 30,
                              ))
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  color: Colors.grey.withOpacity(0.3),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 20, bottom: 15),
                  child: Row(
                    children: [
                      Text(
                        '조리 순서',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            letterSpacing: 0.27,
                            color: AppTheme.indiaInk
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.03,),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 20, bottom: 15),
                  child: Text(
                    widget.recipe.content,
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
