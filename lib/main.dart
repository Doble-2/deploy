import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:BetSweet/data/network/authentication_repository.dart';
import 'package:BetSweet/data/network/mock_network_service.dart';
import 'package:BetSweet/domain/use_case.dart';
import 'package:BetSweet/ui/authentication_bloc.dart';
import 'my_app.dart';

void main() {
  final mockNetworkService = MockNetworkService();
  final authenticationRepository =
      AuthenticationRepositoryImpl(mockNetworkService);
  final authenticationUseCase = AuthenticationUseCase(authenticationRepository);
  final authenticationBloc = AuthenticationBloc(authenticationUseCase);

  runApp(
    BlocProvider(
      create: (context) => authenticationBloc,
      child: MyApp(authenticationUseCase: authenticationUseCase),
    ),
  );
}
