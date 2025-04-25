import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      log(
        "Exception in FirebaseAuthService.createUserWithEmailAndPassword : ${e.toString()} and code is : ${e.code}",
      );
      if (e.code == 'weak-password') {
        throw CustomException('.كلمه السر ضعيفه جدا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('.تم التسجيل بهذا الحساب من قبل');
      } else if (e.code == "network-request-failed") {
        throw CustomException("تأكد من اتصالك بالانترنت");
      } else {
        throw CustomException('.حدث خطأ, حاول مره اخري');
      }
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.createUserWithEmailAndPassword : ${e.toString()}",
      );
      throw CustomException('.حدث خطأ, حاول مره اخري');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "Exception in FirebaseAuthService.signInWithEmailAndPassword : ${e.toString()} and code is : ${e.code}",
      );
      if (e.code == 'user-not-found') {
        throw CustomException('.هذا الحساب غير موجود');
      } else if (e.code == 'wrong-password') {
        throw CustomException('.كلمه السر غير صحيحه');
      } else if (e.code == "network-request-failed") {
        throw CustomException("تأكد من اتصالك بالانترنت");
      } else {
        throw CustomException('.حدث خطأ, حاول مره اخري');
      }
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.signInWithEmailAndPassword : ${e.toString()}",
      );
      throw CustomException('.حدث خطأ, حاول مره اخري');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    final AccessToken accessToken = result.accessToken!;
    final credential = FacebookAuthProvider.credential(accessToken.tokenString);
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
}
