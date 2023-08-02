import 'dart:math';

class MockNetworkService {
  bool _isSignedIn = true;
  String? _currentUserEmail;
  String _verificationCode = '';
  Future<List<Map<String, dynamic>>> getMessages() async {
    return [
      {
        'name': 'Jessie15',
        'text': '¡Buena suerte para todos! 🍀',
        'avatar': 'assets/users/user1.png',
      },
      {
        'name': 'userAlgo',
        'text': 'Lorem ipsum texto en español',
        'avatar': 'assets/users/user5.png',
      },
      {
        'name': 'John',
        'text': 'Hola, ¿cómo estás hoy?',
        'avatar': 'assets/users/user2.png',
      },
      {
        'name': 'Emily',
        'text': '¡Gané la apuesta ayer! 🥳',
        'avatar': 'assets/users/user3.png',
      },
    ];
  }

  List<Map<String, dynamic>> _users = [
    {
      "firstname": "paul",
      "lastname": "joens",
      "address": "12721 beckford road",
      "city": "manchester",
      "zip": 95031,
      "country": "angola",
      "birth_date": "1932-02-12",
      "email": "paul@mongibello.tech",
      "password": "1q2w3e4r5t",
      "sec_answer": "whoami?",
      "sec_question": "god",
      "language": "en_GB",
      "currency": "EUR",
      "taxcode": "SPPTYB67C56R456E",
      "document_id": "AT31767382",
      "document_type": "CI",
      "mobile": "+393334567289"
    },
  ];

  Future<void> signIn(String email, String password) async {
    // Simular inicio de sesión
    await Future.delayed(Duration(seconds: 1));

    // Verificar si el correo electrónico y la contraseña coinciden con un usuario en la lista
    bool isValidUser = _users
        .any((user) => user['email'] == email && user['password'] == password);

    if (isValidUser) {
      _isSignedIn = true;
      _currentUserEmail = email;
    } else {
      throw Exception('Invalid email or password');
    }
  }

  Future<void> signOut() async {
    // Simulate sign out
    await Future.delayed(Duration(seconds: 1));
    _isSignedIn = false;
    _currentUserEmail = null;
  }

  Future<String?> getUser() async {
    // Simulate get user
    await Future.delayed(Duration(seconds: 1));
    return _currentUserEmail;
  }

  Future<void> signUp(Map<String, dynamic> userData) async {
    // Simular registro
    await Future.delayed(Duration(seconds: 1));

    // Verificar que se hayan proporcionado todos los campos obligatorios
    List<String> requiredFields = [
      "firstName",
      "lastName",
      "email",
      "password",
      "country",
    ];
    for (String field in requiredFields) {
      if (!userData.containsKey(field)) {
        throw Exception('Missing required field: $field');
      }
    }
    throw Exception(userData);
    // Agregar nuevo usuario a la lista
    _users.add(userData);
  }

  Future<bool> isSignedIn() async {
    // Simulate is signed in
    await Future.delayed(Duration(seconds: 1));
    return _isSignedIn;
  }

  Future<void> sendPasswordResetEmail(String email) async {
    // Simulate send password reset email
    await Future.delayed(Duration(seconds: 1));

    // Generate a random 5-digit verification code
    _verificationCode = (Random().nextInt(90000) + 10000).toString();

    // Show verification code in a SnackBar
    print('Verification code: $_verificationCode');
  }

  Future<bool> verifyPasswordResetCode(String email, String code) async {
    // Simulate verify password reset code
    await Future.delayed(Duration(seconds: 1));

    // Return true if the code is valid, false otherwise
    return code == _verificationCode;
  }

  Future<void> resetPassword(String email, String newPassword) async {
    // Simulate reset password
    await Future.delayed(Duration(seconds: 1));
    // Update user's password in the list of users
    _users.firstWhere((user) => user['email'] == email)['password'] =
        newPassword;
  }
}
