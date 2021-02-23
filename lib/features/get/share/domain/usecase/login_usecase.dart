import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_practice/features/get/core/utils/failure.dart';
import 'package:flutter_bloc_practice/features/get/core/utils/usecase.dart';
import 'package:flutter_bloc_practice/features/get/share/domain/repository/auth_repository.dart';

class LoginUseCase extends UseCase<String, LoginParams> {
  final AuthRepository authRepository;

  LoginUseCase({this.authRepository});

  @override
  Future<Either<Failure, String>> call(LoginParams params) async{
    return await authRepository.login(
      email: params.email,
      password: params.password,
    );
  }
}
