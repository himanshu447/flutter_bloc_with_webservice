import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_practice/features/get/core/utils/failure.dart';
import 'package:flutter_bloc_practice/features/get/share/data/datasource/auth_datasource.dart';
import 'package:flutter_bloc_practice/features/get/share/data/model/user_model.dart';
import 'package:flutter_bloc_practice/features/get/share/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{
	
	final AuthDataSource authDataSource;
	
	AuthRepositoryImpl({this.authDataSource});
	
	@override
	Future<Either<Failure, String>> login({String email, String password}) async{
		
		try{
			var result = await authDataSource.login(email: email,password: password);
			return Right(result);
		}catch(e){
			return Left(Error(errorMessage: e));
		}
	}

  @override
  Future<Either<Failure, UserModel>> createUser({String name, String job}) async{
	  try{
		  var result = await authDataSource.createUser(name: name,job: job);
		  return Right(result);
	  }catch(e){
		  return Left(Error(errorMessage: e));
	  }
  }
	
}