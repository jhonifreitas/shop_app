import 'package:flutter/material.dart';
import 'package:shop_app/pages/home.dart';
import 'package:shop_app/pages/product.dart';
import 'package:shop_app/widgets/custom_drawer.dart';

class HomeTab extends StatelessWidget {

  final _pageCtrl = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: this._pageCtrl,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomePage(),
          drawer: CustomDrawer(this._pageCtrl),
        ),
        Scaffold(
          body: ProductPage(),
          drawer: CustomDrawer(this._pageCtrl),
        )
      ],
    );
  }
}
