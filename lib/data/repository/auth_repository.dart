abstract class AuthRepository {
  Future<String?>? login(String email, String password);

  Future<String?>? signup(String email, String password);

  Future<void> logout();
}
