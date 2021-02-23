import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_practice/features/get/core/utils/failure.dart';
import 'package:flutter_bloc_practice/features/get/core/utils/usecase.dart';
import 'package:flutter_bloc_practice/features/get/share/data/model/user_model.dart';
import 'package:flutter_bloc_practice/features/get/share/domain/repository/auth_repository.dart';

class CreateUserCase extends UseCase<UserModel, CreateUserParams> {
  final AuthRepository authRepository;

  CreateUserCase({this.authRepository});

  @override
  Future<Either<Failure, UserModel>> call(CreateUserParams params) async {
    return await authRepository.createUser(
      job: params.job,
      name: params.name,
    );
  }
}
