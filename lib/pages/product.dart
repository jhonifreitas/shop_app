import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Produtos'),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
              future: Firestore.instance.collection('categories').orderBy('order').getDocuments(),
              builder: (context, snapshot){
                if(!snapshot.hasData)
                  return this._buildLoader();
                else
                  return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index){
                      return Row(
                        children: <Widget>[],
                      );
                    },
                  );
              }
            )
          ]
        )
      ]
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

}
