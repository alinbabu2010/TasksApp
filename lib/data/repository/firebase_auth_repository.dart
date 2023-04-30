import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasks_app/data/repository/auth_repository.dart';

class FirebaseAuthRepository extends AuthRepository {
  final authInstance = FirebaseAuth.instance;

  @override
  Future<String?>? login(String email, String password) async =>
      await _authAction(
        authInstance.signInWithEmailAndPassword(
          email: email,
          password: password,
        ),
      );

  @override
  Future<String?>? signup(String email, String password) async =>
      await _authAction(
        authInstance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ),
      );

  @override
  Future<String?>? resetPassword(String email) async =>
      await _authAction(authInstance.sendPasswordResetEmail(email: email));

  @override
  Future<void> logout() async {
    await authInstance.signOut();
  }

  Future<String?>? _authAction(Future<void> action) async {
    try {
      await action;
      return Future.value(null);
    } on FirebaseAuthException catch (exception) {
      return Future.value(exception.message);
    } on Exception catch (exception) {
      return Future.value(exception.toString());
    }
  }
}
