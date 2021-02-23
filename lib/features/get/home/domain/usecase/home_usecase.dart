import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_practice/features/get/core/utils/failure.dart';
import 'package:flutter_bloc_practice/features/get/core/utils/usecase.dart';
import 'package:flutter_bloc_practice/features/get/home/domain/repository/home_repository.dart';
import 'package:flutter_bloc_practice/features/get/share/model/user_list_model.dart';

class HomeUseCase extends UseCase<UserListModel, NoParams> {
  final HomeRepository homeRepository;

  HomeUseCase({this.homeRepository});

  @override
  Future<Either<Failure, UserListModel>> call(NoParams params) {
  	return homeRepository.fetchUserList();
  }
}
