import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/bloc/home_bloc.dart';
import 'features/home/ui/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: MaterialApp(
        theme:ThemeData(
           useMaterial3: true,
           appBarTheme: AppBarTheme(backgroundColor: Colors.lightGreen)

        ),

       
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
