import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lalu/providers/music_player_provider.dart';
import 'package:lalu/providers/session_provider.dart';
import 'package:lalu/resources/custom_theme.dart';
import 'package:lalu/view/login_register_view/login_register_screen.dart';
import 'package:lalu/view/music_player_view/music_player_screen.dart';
import 'package:lalu/view/playlist_view/playlist_screen.dart';
import 'package:provider/provider.dart';

import 'providers/music_player_state_provider.dart';
import 'view/library_view/library_screen.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Colors.black, // status bar color
  ));

  final graphQlCLient = connectAPI();
  runApp(
    GraphQLProvider(
      client: graphQlCLient,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => MusicPlayerProvider(),
            lazy: false,
          ),
          ChangeNotifierProvider(
            create: (_) => MusicPlayerStateProvider(),
            lazy: false,
          ),
          Provider(
            create: (_) => SessionProvider(),
            lazy: false,
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

ValueNotifier<GraphQLClient> connectAPI() {
  final HttpLink link = HttpLink(
    'https://35.226.199.77.nip.io/graphql',
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
      initialRoute: LoginRegisterScreen.route,
      routes: {
        LoginRegisterScreen.route: (_) => const LoginRegisterScreen(),
        MusicPlayerScreen.route: (_) => const MusicPlayerScreen(),
        LibraryScreen.route: (_) => const LibraryScreen(),
        PlaylistScreen.route: (_) => const PlaylistScreen(),
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
