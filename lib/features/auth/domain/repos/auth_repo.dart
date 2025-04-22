import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> creatUserWithEmailAndPassword(
    String email,
    String password,
  );
}
