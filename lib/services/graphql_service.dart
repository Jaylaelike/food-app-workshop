// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

class GraphQLServices {
  static String baseUrl = "https://d481-2403-6200-8870-a9c5-e443-e79f-b9a8-b1c8.ap.ngrok.io";
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
