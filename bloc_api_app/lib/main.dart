import 'package:bloc_api/blocs/user_bloc.dart';
import 'package:bloc_api/repositories/api_repository.dart';
import 'package:bloc_api/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
          create: (context) => ApiRepository(),
          child: const HomeScreen(title: 'Api-bloc')),
    );
  }
}
