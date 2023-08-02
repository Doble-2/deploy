import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:BetSweet/domain/use_case.dart';

enum AuthenticationStatus { authenticated, unauthenticated }

class AuthenticationState {
  final AuthenticationStatus status;
  final String? user;
  AuthenticationState({required this.status, this.user});
}

abstract class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {}

class UserLoggedIn extends AuthenticationEvent {
  final String email;
  final String password;
  UserLoggedIn({required this.email, required this.password});
}

class UserSignedUp extends AuthenticationEvent {
  final Map<String, dynamic> userData;
  UserSignedUp({required this.userData});
}

class UserLoggedOut extends AuthenticationEvent {}

class PasswordResetRequested extends AuthenticationEvent {
  final String email;
  PasswordResetRequested({required this.email});
}

// Define el evento PasswordResetVerified
class PasswordResetVerified extends AuthenticationEvent {
  final String email;
  final String verificationCode;
  PasswordResetVerified({required this.email, required this.verificationCode});
}

class PasswordReset extends AuthenticationEvent {
  final String email;
  final String newPassword;
  PasswordReset({required this.email, required this.newPassword});
}

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationUseCase _authenticationUseCase;
  AuthenticationBloc(this._authenticationUseCase)
      : super(
            AuthenticationState(status: AuthenticationStatus.unauthenticated)) {
    on<UserLoggedIn>((event, emit) async {
      try {
        await _authenticationUseCase.signIn(event.email, event.password);
        final user = await _authenticationUseCase.getUser();
        print('user logged in: $user');
        emit(AuthenticationState(
            status: AuthenticationStatus.authenticated, user: user));
      } catch (error) {
        print('Error logging in user: $error');
      }
    });
    on<UserSignedUp>((event, emit) async {
      try {
        await _authenticationUseCase.signUp(event.userData);
        await _authenticationUseCase.signIn(
            event.userData['email'], event.userData['password']);
        final user = await _authenticationUseCase.getUser();
        print('user signed up and logged in: $user');
        emit(AuthenticationState(
            status: AuthenticationStatus.authenticated, user: user));
      } catch (error) {
        print('Error signing up user: $error');
      }
    });
    on<UserLoggedOut>((event, emit) async {
      try {
        await _authenticationUseCase.signOut();
        print('user logged out');
        emit(AuthenticationState(status: AuthenticationStatus.unauthenticated));
      } catch (error) {
        print('Error logging out user: $error');
      }
    });
    on<PasswordResetRequested>((event, emit) async {
      try {
        await _authenticationUseCase.sendPasswordResetEmail(event.email);
      } catch (error) {}
    });

    on<PasswordResetVerified>((event, emit) async {
      try {
        final isCodeValid = await _authenticationUseCase
            .verifyPasswordResetCode(event.email, event.verificationCode);
        if (isCodeValid) {
        } else {}
      } catch (error) {}
    });
    on<PasswordReset>((event, emit) async {
      try {
        await _authenticationUseCase.resetPassword(
            event.email, event.newPassword);
      } catch (error) {}
    });
  }
  Future<void> sendPasswordResetEmail(String email) async {
    return _authenticationUseCase.sendPasswordResetEmail(email);
  }

  Future<bool> verifyPasswordResetCode(
      String email, String verificationCode) async {
    return _authenticationUseCase.verifyPasswordResetCode(
        email, verificationCode);
  }

  Future<void> resetPassword(String email, String newPassword) async {
    return _authenticationUseCase.resetPassword(email, newPassword);
  }

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      print('AppStarted event received');
      yield* _mapAppStartedToState();
    } else if (event is UserLoggedOut) {
      print('UserLoggedOut event received');
      yield* _mapUserLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await _authenticationUseCase.isSignedIn();
      print('isSignedIn: $isSignedIn');
      if (isSignedIn) {
        final user = await _authenticationUseCase.getUser();
        print('user: $user');
        yield AuthenticationState(
            status: AuthenticationStatus.authenticated, user: user);
      } else {
        yield AuthenticationState(status: AuthenticationStatus.unauthenticated);
      }
    } catch (_) {
      yield AuthenticationState(status: AuthenticationStatus.unauthenticated);
    }
  }

  Stream<AuthenticationState> _mapUserLoggedOutToState() async* {}
}
