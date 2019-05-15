import 'package:flutter/material.dart';
import 'package:shop_app/widgets/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageCtrl;

  CustomDrawer(this.pageCtrl);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          this._buildDrawerBack(),
          ListView(
            padding: EdgeInsets.fromLTRB(30, 40, 30, 20),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text('Flutter\'s Clotting', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                    ),
                    Text('Olá,', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    GestureDetector(
                      child: Text('Entre ou cadastre-se >', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                      onTap: (){
                        // Navigator.push()
                      }
                    )
                  ],
                )
              ),
              Divider(),
              DrawerTile(Icons.home, 'Início', this.pageCtrl, 0),
              DrawerTile(Icons.list, 'Produtos', this.pageCtrl, 1),
              DrawerTile(Icons.location_on, 'Lojas', this.pageCtrl, 2),
              DrawerTile(Icons.playlist_add_check, 'Meus Pedidos', this.pageCtrl, 3)
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
          colors: [Colors.blue[100], Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
    );
  }
}
