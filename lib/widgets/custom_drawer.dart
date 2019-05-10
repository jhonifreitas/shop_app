import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          this._buildDrawerBack(),
          Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('Flutter Clotting')
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDrawerBack() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromRGBO(211, 118, 130, 1), Color.fromRGBO(255, 255, 255, 1)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
    );
  }
}
