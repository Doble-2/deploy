//este archivo contiene las clases que implementan los casos de uso o reglas de negocio de la aplicación. En este caso, tenemos tres clases: GetAllProductsUseCase, GetProductByIdUseCase y UpdateProductUseCase. Cada una de estas clases recibe una instancia del repositorio de productos y tiene un método execute que realiza la lógica del negocio y devuelve un resultado o una excepción.import 'package:my_app/domain/contract.dart';
import 'package:BetSweet/domain/contract.dart';

class AuthenticationUseCase {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationUseCase(this._authenticationRepository);

  Future<void> signIn(String email, String password) =>
      _authenticationRepository.signIn(email, password);

  Future<void> signOut() => _authenticationRepository.signOut();

  Future<bool> isSignedIn() => _authenticationRepository.isSignedIn();

  Future<String?> getUser() => _authenticationRepository.getUser();

  Future<void> signUp(Map<String, dynamic> userData) =>
      _authenticationRepository.signUp(userData);

  Future<void> sendPasswordResetEmail(String email) =>
      _authenticationRepository.sendPasswordResetEmail(email);

  Future<bool> verifyPasswordResetCode(String email, String code) =>
      _authenticationRepository.verifyPasswordResetCode(email, code);

  Future<void> resetPassword(String email, String newPassword) =>
      _authenticationRepository.resetPassword(email, newPassword);
}
