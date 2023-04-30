abstract class AuthRepository {
  Future<String?>? login(String email, String password);

  Future<String?>? signup(String email, String password);

  Future<String?>? resetPassword(String email);

  Future<void> logout();
}
