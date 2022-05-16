import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lalu/resources/custom_theme.dart';
import 'package:lalu/view/login_register_view/login_register_screen.dart';
import 'package:lalu/view/music_player_view/music_player_screen.dart';

void main() {
  final graphQlCLient = connectAPI();
  runApp(
    GraphQLProvider(
      client: graphQlCLient,
      child: const MyApp(),
    ),
  );
}

ValueNotifier<GraphQLClient> connectAPI() {
  final HttpLink link = HttpLink(
    'http://10.0.2.2:3000/graphql',
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(),
    ),
  );

  return client;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      initialRoute: MusicPlayerScreen.route,
      routes: {
        LoginRegisterScreen.route: (_) => const LoginRegisterScreen(),
        MusicPlayerScreen.route: (_) => const MusicPlayerScreen(),
      },
    );
  }
}
