// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

class GraphQLServices {
  static String baseUrl = "https://9df2-171-6-230-222.ap.ngrok.io";
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
