import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_graphql/models/home_query.dart';
import 'package:flutter_graphql/services/graphql_service.dart';

class RecipesDetailPage extends StatelessWidget {
  const RecipesDetailPage({Key? key, required this.item}) : super(key: key);

  final ReceiptsDatum item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.attributes.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //images
            Image.network(GraphQLServices.baseUrl +
                item.attributes.images.data.first.attributes.url),

            //name
            Text(item.attributes.name),

            //Descritions
            Text(item.attributes.description),
            
            //ingrediants
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: item.attributes.ingredients.map((item) {
                  return Text('🚀 ${item.name}');
                }).toList(),
            )

       
          ],
        ),
      ),
    );
  }
}
