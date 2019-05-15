import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  final IconData icon;
  final String text;
  final PageController pageCtrl;
  final int page;

  DrawerTile(this.icon, this.text, this.pageCtrl, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: <Widget>[
              Icon(this.icon, size: 32, color: this.pageCtrl.page == this.page ? Theme.of(context).primaryColor : Colors.black),
              SizedBox(width: 32),
              Text(this.text, style: TextStyle(fontSize: 16, color: this.pageCtrl.page == this.page ? Theme.of(context).primaryColor : Colors.black, fontWeight: FontWeight.bold))
            ],
          ),
        ),
        onTap: (){
          Navigator.of(context).pop();
          this.pageCtrl.jumpToPage(this.page);
        },
      ),
    );
  }
}
