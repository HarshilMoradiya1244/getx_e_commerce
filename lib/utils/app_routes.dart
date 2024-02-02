import 'package:flutter/material.dart';
import 'package:getx_ecommerce/screen/cart/view/cart_screen.dart';
import 'package:getx_ecommerce/screen/detail/view/detail_screen.dart';
import 'package:getx_ecommerce/screen/home/view/home_screen.dart';
import 'package:getx_ecommerce/screen/splash/view/splash_screen.dart';

Map<String,WidgetBuilder> app_routes = {
  '/':(context) => const SplashScreen(),
  'home':(context) => const ProductScreen(),
  'detail':(context) => const ProductDetailScreen(),
  'cart':(context) => const ProductCartScreen(),
};