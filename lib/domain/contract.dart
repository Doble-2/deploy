//este archivo contiene las interfaces o contratos que definen la comunicación entre el dominio y la capa de datos. En este caso, tenemos dos interfaces: ProductRepository y ProductDataSource. La primera define los métodos que debe implementar el repositorio de productos, como obtener todos los productos, obtener un producto por id o actualizar un producto. La segunda define los métodos que debe implementar cada fuente de datos de productos, como obtener todos los productos desde la API o guardar un producto en la base de datos local.
abstract class AuthenticationRepository {
  Future<void> signIn(String email, String password);
  Future<void> signUp(Map<String, dynamic> userData);
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<String?> getUser();
  Future<void> sendPasswordResetEmail(String email);
  Future<bool> verifyPasswordResetCode(String email, String code);
  Future<void> resetPassword(String email, String newPassword);
}
