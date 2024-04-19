abstract class AuthRepository {
  Future<bool> loginWithEmailAndPassword(
      {required String email, required String password});

  Future<bool> signUpWithEmailAndPassowrd();
}
