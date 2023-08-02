import 'package:BetSweet/domain/contract.dart';
import 'package:BetSweet/data/network/mock_network_service.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final MockNetworkService _mockNetworkService;

  AuthenticationRepositoryImpl(this._mockNetworkService);

  @override
  Future<void> signIn(String email, String password) async {
    // Implement sign in using mock network service
    await _mockNetworkService.signIn(email, password);
  }

  @override
  Future<void> signUp(Map<String, dynamic> userData) async {
    // Implement sign up using mock network service
    await _mockNetworkService.signUp(userData);
  }

  @override
  Future<void> signOut() async {
    // Implement sign out using mock network service
    await _mockNetworkService.signOut();
  }

  @override
  Future<bool> isSignedIn() async {
    // Implement is signed in using mock network service
    return await _mockNetworkService.isSignedIn();
  }

  @override
  Future<String?> getUser() async {
    // Implement get user using mock network service
    return await _mockNetworkService.getUser();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    // Implement send password reset email using mock network service
    await _mockNetworkService.sendPasswordResetEmail(email);
  }

  @override
  Future<bool> verifyPasswordResetCode(String email, String code) async {
    // Implement verify password reset code using mock network service
    return await _mockNetworkService.verifyPasswordResetCode(email, code);
  }

  @override
  Future<void> resetPassword(String email, String newPassword) async {
    // Implement reset password using mock network service
    await _mockNetworkService.resetPassword(email, newPassword);
  }
}
