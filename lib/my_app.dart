import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:BetSweet/domain/use_case.dart';
import 'package:BetSweet/ui/authentication_bloc.dart';
import 'package:BetSweet/ui/pages/home/home.dart';
import 'package:BetSweet/ui/pages/login/login.dart';
import 'package:BetSweet/ui/widgets/constants.dart';

class MyApp extends StatelessWidget {
  final AuthenticationUseCase authenticationUseCase;

  MyApp({required this.authenticationUseCase});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor,
        ),
        useMaterial3: true,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          print(state.status == AuthenticationStatus.authenticated);
          //      if (state.status == AuthenticationStatus.authenticated) {
          return MyHomePage();
          /*  } else {
            return LoginPage();
          }*/
        },
      ),
    );
  }
}
