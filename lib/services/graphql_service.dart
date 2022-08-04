// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

class GraphQLServices {
  static String baseUrl = "https://6216-2403-6200-8870-8bf3-d141-a806-b7b1-9546.ap.ngrok.io";
  static HttpLink httpLink = HttpLink(
    baseUrl + "/graphql",
  );
  static ValueNotifier<GraphQLClient> clientToQuery() {
    return ValueNotifier(GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    ));
  }
}
