import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_practice/features/get/core/utils/failure.dart';
import 'package:flutter_bloc_practice/features/get/share/data/model/user_model.dart';

abstract class AuthRepository{
	
	Future<Either<Failure,String>> login({String email,String password});
	
	Future<Either<Failure,UserModel>> createUser({String name,String job});
}