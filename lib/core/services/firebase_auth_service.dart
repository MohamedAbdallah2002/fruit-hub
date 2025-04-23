import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException('.كلمه السر ضعيفه جدا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('.تم التسجيل بهذا الحساب من قبل');
      }
      else {
      throw CustomException('.حدث خطأ, حاول مره اخري');
    }
    } catch (e) {
      throw CustomException('.حدث خطأ, حاول مره اخري');
    }
  }
}
