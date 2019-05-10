import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';


class HomeTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        this._buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Novidades'),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
              future: Firestore.instance.collection('products').orderBy('order').getDocuments(),
              builder: (context, snapshot){
                if(!snapshot.hasData)
                  return this._buildLoader();
                else
                  return SliverStaggeredGrid.count(
                    crossAxisCount: 2,
                    // mainAxisSpacing: 1,
                    // crossAxisSpacing: 1,
                    staggeredTiles: snapshot.data.documents.map((doc){
                      return StaggeredTile.count(doc.data['x'], doc.data['y']);
                    }).toList(),
                    children: snapshot.data.documents.map((doc){
                      return FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: doc.data['image'],
                        fit: BoxFit.cover
                      );
                    }).toList(),
                  );
              },
            )
          ],
        )
      ],
    );
  }

  Widget _buildLoader() {
    return SliverToBoxAdapter(
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        )
      )
    );
  }

  Widget _buildBodyBack() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromRGBO(211, 118, 130, 1), Color.fromRGBO(253, 181, 168, 1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      ),
    );
  }
}
