import 'dart:developer';

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
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword : ${e.toString()} and code is : ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomException('.كلمه السر ضعيفه جدا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('.تم التسجيل بهذا الحساب من قبل');
      }
      else if(e.code== "network-request-failed"){
      throw CustomException("تأكد من اتصالك بالانترنت");

      }
      else {
      throw CustomException('.حدث خطأ, حاول مره اخري');
    }
    } catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword : ${e.toString()}");
      throw CustomException('.حدث خطأ, حاول مره اخري');
    }
  }
}
