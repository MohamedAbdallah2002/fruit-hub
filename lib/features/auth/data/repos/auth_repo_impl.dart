import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failures, UserEntity>> creatUserWithEmailAndPassword(String email, String password) {
    throw UnimplementedError();
  }
  
}