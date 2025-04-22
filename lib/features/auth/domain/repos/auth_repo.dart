import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity> creatUserWithEmailAndPassword(String email, String password);
}