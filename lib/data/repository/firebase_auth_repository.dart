import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasks_app/data/repository/auth_repository.dart';

class FirebaseAuthRepository extends AuthRepository {
  final authInstance = FirebaseAuth.instance;

  @override
  Future<String?>? login(String email, String password) async {
    try {
      await authInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Future.value(null);
    } on FirebaseAuthException catch (exception) {
      return Future.value(exception.message);
    } on Exception catch (exception) {
      return Future.value(exception.toString());
    }
  }

  @override
  Future<String?>? signup(String email, String password) async {
    try {
      await authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Future.value(null);
    } on FirebaseAuthException catch (exception) {
      return Future.value(exception.message);
    } on Exception catch (exception) {
      return Future.value(exception.toString());
    }
  }

  @override
  Future<void> logout() async {
    await authInstance.signOut();
  }
}
