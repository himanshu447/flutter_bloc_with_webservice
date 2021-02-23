import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_practice/features/get/core/utils/failure.dart';
import 'package:flutter_bloc_practice/features/get/share/model/user_list_model.dart';

abstract class HomeRepository{
	Future<Either<Failure,UserListModel>> fetchUserList();
}