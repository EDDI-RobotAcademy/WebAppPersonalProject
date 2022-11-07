import 'package:demo/model/tmp_hot_recipe.dart';
import 'package:flutter/material.dart';

class HotRecipeView extends StatefulWidget {
  const HotRecipeView(
      {Key? key,
        this.callback,
        this.hotRecipe,
        this.animationController,
        this.animation})
      : super(key: key);

  final VoidCallback? callback;
  final HotRecipe? hotRecipe;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  State<HotRecipeView> createState() => _HotRecipeViewState();
}

class _HotRecipeViewState extends State<HotRecipeView> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.animationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
            opacity: widget.animation!,
            child: Transform(
              transform: Matrix4.translationValues(
                  100 * (1.0 - widget.animation!.value), 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: widget.callback,
                child: SizedBox(
                  width: 280,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            const SizedBox(
                              width: 48,
                            ),
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xFFEEF1F3),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(16.0)),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    const SizedBox(
                                      width: 48 + 24.0,
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 16),
                                              child: Text(
                                                widget.hotRecipe!.title,
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  letterSpacing: 0.27,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            const Expanded(
                                              child: SizedBox(),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16, bottom: 4, top: 3),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    child: Row(
                                                      children: <Widget>[
                                                        Text(
                                                          widget.hotRecipe!.foodCategory,
                                                          textAlign:
                                                          TextAlign.left,
                                                          style: const TextStyle(
                                                            fontWeight:
                                                            FontWeight.w200,
                                                            fontSize: 16,
                                                            letterSpacing: 0.27,
                                                            color: Colors.black54,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 16, right: 16),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '${widget.hotRecipe!.rating}',
                                                        textAlign:
                                                        TextAlign.left,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          fontSize: 18,
                                                          letterSpacing: 0.27,
                                                          color:
                                                          Color(0xFF00B6F0),
                                                        ),
                                                      ),
                                                      const Icon(
                                                        Icons.star,
                                                        color:
                                                        Colors.amberAccent,
                                                        size: 20,
                                                      ),
                                                    ],
                                                  ),
                                                  const Padding(
                                                    padding:
                                                    EdgeInsets.all(
                                                        4.0),
                                                    child: Icon(
                                                      Icons.favorite_border,
                                                      color: Colors
                                                          .redAccent, //등록 필요
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 24, bottom: 24, left: 16),
                          child: Row(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0)),
                                child: AspectRatio(
                                    aspectRatio: 1.0,
                                    child: Image.asset(widget.hotRecipe!.imagePath)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}