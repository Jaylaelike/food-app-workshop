import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_graphql/models/home_query.dart';
import 'package:flutter_graphql/pages/recipes_details.dart';
import 'package:flutter_graphql/services/graphql_service.dart';
import 'package:flutter_graphql/services/query.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food recipes"),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(readAllRecipes),
          pollInterval: Duration(seconds: 5),
        ),
        builder: (result, {fetchMore, refetch}) {
          //hase
          if (result.hasException) {
            return Text("Error!!");
          }
          // is loading
          if (result.isLoading) {
            return Text("Loading...");
          }
          // id empty
          if (result.data!.isEmpty) {
            return Text("Empty!!");
          }
          //Show data
          //log('${result.data}');
          //log('${result.data!["receipts"]["data"][0]["attributes"]["name"]}');
          log(json.encode(result.data));

          final recipes = receiptsFromJson(json.encode(result.data));
          final recipesItem = recipes.receipts.data;

          log(recipes.receipts.data.first.attributes.name);

          return ListView.builder(
            itemCount: recipesItem.length,
            itemBuilder: (BuildContext context, int index) {
              final name = recipesItem[index].attributes.name;
              final imageUrl = GraphQLServices.baseUrl +
                  recipesItem[index]
                      .attributes
                      .images
                      .data
                      .first
                      .attributes
                      .url;

              return ListTile(
                leading: Image.network(imageUrl),
                title: Text(name),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipesDetailPage(item: recipesItem[index]),),);
                },
              );
            },
          );
        },
      ),
    );
  }
}
