import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_practice/features/get/core/utils/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({this.email, this.password});
}

class CreateUserParams {
  final String name;
  final String job;

  CreateUserParams({this.name, this.job});
}

class NoParams {}
