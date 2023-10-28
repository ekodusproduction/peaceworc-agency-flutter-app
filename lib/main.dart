import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peaceworc_agency/bloc/job_bloc.dart';
import 'package:peaceworc_agency/ui/SplashScreen.dart';

void main() {
  runApp(
      
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => JobBloc())
      ],
      child: MaterialApp(
        title: 'Peaceworc Agency',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
          debugShowCheckedModeBanner: false,
          home: SplashScreen()
      ),
    );
  }
}
