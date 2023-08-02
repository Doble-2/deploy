// este archivo contiene la clase ProductRepository, que implementa la interfaz ProductRepository del dominio. Esta clase se encarga de gestionar las fuentes de datos locales y remotas, usando el patrón repository. Esta clase usa el paquete connectivity para verificar la conexión a internet y decidir qué fuente de datos usar.
import 'network/mock_network_service.dart';

class Repository {
  final MockNetworkService _mockNetworkService = MockNetworkService();

  Future<List<Map<String, dynamic>>> getMessages() async {
    return await _mockNetworkService.getMessages();
  }
}
