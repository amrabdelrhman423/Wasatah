import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MainController extends GetxController{

  ScrollController controllerSwiper = new ScrollController();
int currentSwiper=0;
  @override
  void onInit() {
    super.onInit();
    controllerSwiper.addListener(() {
      if(currentSwiper!=scrollListenerWithItemHeight()&&scrollListenerWithItemHeight()<4){
        print(scrollListenerWithItemHeight());
        currentSwiper=scrollListenerWithItemHeight();
        update();
      }
    });
  }

  List likesAds=[
  [false,false],
  [false,false],
  [false,false]
];

List likeArticle=[
  false,
  false,

];
changelikeAds(index,i){
  print("Liske = "+index.toString());
  likesAds[index][i]=!likesAds[index][i];
  update();
}

int scrollListenerWithItemHeight() {

  int itemHeight = 135; // including padding above and below the list item
  double scrollOffset = controllerSwiper.offset;
  int firstVisibleItemIndex = scrollOffset < itemHeight
      ? 0
      : ((scrollOffset - itemHeight) / itemHeight).ceil();
  return firstVisibleItemIndex;
}
changelikearticle(index){
  print("Liske = "+index.toString());
  likeArticle[index]=!likeArticle[index];
  update();
}

}