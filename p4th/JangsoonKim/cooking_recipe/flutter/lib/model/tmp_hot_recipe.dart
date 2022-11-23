import 'package:flutter/material.dart';

class HotRecipe {
  String title;
  String imagePath;
  double rating;
  String foodCategory;

  HotRecipe(
      {this.title = '',
        this.imagePath = '',
        this.rating = 0.0,
        this.foodCategory = ''});

  static List<HotRecipe> hotRecipeList = <HotRecipe>[
    HotRecipe(
        title: '1분만에 뚝딱 간장계란밥, 정말로 맛있어요',
        imagePath: 'assets/images/tmp/ggb.png',
        rating: 4.8,
        foodCategory: '한식',
    ),
    HotRecipe(
        title: '매일 먹어도 맛있는 김치볶음밥',
        imagePath: 'assets/images/tmp/gcb.png',
        rating: 4.3,
        foodCategory: '한식'),
    HotRecipe(
        title: '입맛없을때 최고! 여름철 별미 우럭물회',
        imagePath: 'assets/images/tmp/mh.png',
        rating: 4.8,
        foodCategory: '한식'),
    HotRecipe(
        title: '1분만에 뚝딱 간장계란밥, 정말로 맛있어요',
        imagePath: 'assets/images/tmp/ggb.png',
        rating: 4.8,
        foodCategory: '한식'),
    HotRecipe(
        title: '매일 먹어도 맛있는 김치볶음밥',
        imagePath: 'assets/images/tmp/gcb.png',
        rating: 4.3,
        foodCategory: '한식'),
    HotRecipe(
        title: '입맛없을때 최고! 여름철 별미 우럭물회',
        imagePath: 'assets/images/tmp/mh.png',
        rating: 4.8,
        foodCategory: '한식'),
    HotRecipe(
        title: '1분만에 뚝딱 간장계란밥, 정말로 맛있어요',
        imagePath: 'assets/images/tmp/ggb.png',
        rating: 4.8,
        foodCategory: '한식'),
    HotRecipe(
        title: '매일 먹어도 맛있는 김치볶음밥',
        imagePath: 'assets/images/tmp/gcb.png',
        rating: 4.3,
        foodCategory: '한식'),
    HotRecipe(
        title: '입맛없을때 최고! 여름철 별미 우럭물회',
        imagePath: 'assets/images/tmp/mh.png',
        rating: 4.8,
        foodCategory: '한식'),
    HotRecipe(
        title: '1분만에 뚝딱 간장계란밥, 정말로 맛있어요',
        imagePath: 'assets/images/tmp/ggb.png',
        rating: 4.8,
        foodCategory: '한식'),
    HotRecipe(
        title: '매일 먹어도 맛있는 김치볶음밥',
        imagePath: 'assets/images/tmp/gcb.png',
        rating: 4.3,
        foodCategory: '한식'),
    HotRecipe(
        title: '입맛없을때 최고! 여름철 별미 우럭물회',
        imagePath: 'assets/images/tmp/mh.png',
        rating: 4.8,
        foodCategory: '한식'),
  ];
}