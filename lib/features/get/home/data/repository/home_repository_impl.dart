
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_practice/features/get/core/utils/failure.dart';
import 'package:flutter_bloc_practice/features/get/home/data/datasource/home_datasource.dart';
import 'package:flutter_bloc_practice/features/get/home/domain/repository/home_repository.dart';
import 'package:flutter_bloc_practice/features/get/share/model/user_list_model.dart';

class HomeRepositoryImpl extends HomeRepository{
	
	final HomeDataSource homeDataSource;
	
	
	HomeRepositoryImpl({this.homeDataSource});

  @override
  Future<Either<Failure, UserListModel>> fetchUserList() async {
    try{
    	var result = await homeDataSource.fetchUserList();
    	return Right(result);
    }catch(e){
    	return Left(e);
    }
  }
	
}