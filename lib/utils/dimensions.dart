import 'package:flutter/material.dart';

class Dimensions {
  static late double screenHeight;
  static late double screenWidth;

  static late double pageViewContainer;
  static late double pageViewTextContainer;
  static late double cardView;

  static late double height5;
  static late double height8;
  static late double height10;
  static late double height15;
  static late double height20;
  static late double height25;
  static late double height27;
  static late double height30;
  static late double height45;
  static late double height40;
  static late double height58;
  static late double height60;
  static late double height80;
  static late double height150;
  static late double height180;
  static late double height200;
  static late double height300;
  static late double height350;
  static late double height400;
  static late double height280;

  static late double width1;
  static late double width2;
  static late double width10;
  static late double width15;
  static late double width20;
  static late double width25;
  static late double width27;
  static late double width30;
  static late double width45;
  static late double width40;
  static late double width60;
  static late double width180;
  static late double width200;
  static late double width300;
  static late double width325;
  static late double width400;

  static late double fontSize10;
  static late double fontSize12;
  static late double fontSize13;
  static late double fontSize14;
  static late double fontSize15;
  static late double fontSize16;
  static late double fontSize20;
  static late double fontSize26;
  static late double fontSize28;
  static late double fontSize34;
  static late double fontSize60;

  static late double iconSize24;
  static late double iconSize16;

  static late double radius80;
  static late double radius10;
  static late double radius100;
  static late double radius20;

  static late double listViewImageSize;
  static late double listViewTextContainer;
  static late double eventImgSize;

  static late double splashImage;

  static void init(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    pageViewContainer = screenHeight / 3.84;
    pageViewTextContainer = screenHeight / 3.84;
    cardView = screenHeight / 2.64;

    height5 = screenHeight / 168.8;
    height8 = screenHeight / 105.5;
    height10 = screenHeight / 84.4;
    height15 = screenHeight / 56.27;
    height20 = screenHeight / 42.2;
    height25 = screenHeight / 33.76;
    height27 = screenHeight / 31.25;
    height30 = screenHeight / 28.13;
    height45 = screenHeight / 18.76;
    height40 = screenHeight / 21.1;
    height58 = screenHeight / 14.55;
    height60 = screenHeight / 14.06;
    height80 = screenHeight / 10.55;
    height150 = screenHeight / 5.62;
    height180 = screenHeight / 4.69;
    height200 = screenHeight / 4.22;
    height300 = screenHeight / 2.81;
    height350 = screenHeight / 2.41;
    height400 = screenHeight / 2.11;
    height280 = screenHeight / 3.01;

    width1 = screenWidth / 844;
    width2 = screenWidth / 422;
    width10 = screenWidth / 84.4;
    width15 = screenWidth / 56.27;
    width20 = screenWidth / 42.2;
    width25 = screenWidth / 33.76;
    width27 = screenWidth / 31.25;
    width30 = screenWidth / 28.13;
    width45 = screenWidth / 18.76;
    width40 = screenWidth / 21.1;
    width60 = screenWidth / 14.06;
    width180 = screenWidth / 4.69;
    width200 = screenWidth / 4.22;
    width300 = screenWidth / 2.81;
    width325 = screenWidth / 2.60;
    width400 = screenWidth / 2.11;

    fontSize10 = screenHeight / 84.4;
    fontSize12 = screenHeight / 70.33;
    fontSize13 = screenHeight / 64.92;
    fontSize14 = screenHeight / 60.28;
    fontSize15 = screenHeight / 56.27;
    fontSize16 = screenHeight / 52.75;
    fontSize20 = screenHeight / 42.2;
    fontSize26 = screenHeight / 32.46;
    fontSize28 = screenHeight / 30.14;
    fontSize34 = screenHeight / 24.82;
    fontSize60 = screenHeight / 14.06;

    iconSize24 = screenHeight / 35.17;
    iconSize16 = screenHeight / 52.75;

    radius80 = screenHeight / 10.55;
    radius10 = screenHeight / 84.4;
    radius100 = screenHeight / 8.44;
    radius20 = screenHeight / 42.2;

    listViewImageSize = screenWidth / 2.16;
    listViewTextContainer = screenWidth / 3.9;
    eventImgSize = screenHeight / 2.29;

    splashImage = screenHeight / 3.375;
  }
}
