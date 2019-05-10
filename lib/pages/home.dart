import 'package:flutter/material.dart';
import 'package:shop_app/tabs/home.dart';
import 'package:shop_app/widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {

  final _pageCtrl = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: this._pageCtrl,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(),
        )
      ],
    );
  }
}
