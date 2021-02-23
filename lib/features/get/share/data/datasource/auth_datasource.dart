import 'package:flutter_bloc_practice/features/get/core/utils/constant_utils.dart';
import 'package:flutter_bloc_practice/features/get/share/data/model/user_model.dart';
import 'package:flutter_bloc_practice/features/get/share/service/service.dart';
import 'package:flutter_bloc_practice/features/get/share/service/web_service.dart';

abstract class AuthDataSource{
	
	Future<String> login({String email, String password});
	
	Future<UserModel> createUser({String name,String job,});
	
}

class AuthDataSourceImpl extends AuthDataSource{
	
	final WebService webService;
	
	AuthDataSourceImpl({this.webService});
	
	@override
	Future<String> login({String email, String password}) async{
		try {
			var result = await webService.requestPOST(
				url: Services.getServices(EndPoint.Login),
				body: {
					'email': email,
					'password': password,
				},
			);
			
			print(result);
			
			if(result != null){
				if(result[ConstantUtil.result_success]){
					return result[ConstantUtil.result_response]['token'];
				}else{
					throw result[ConstantUtil.result_response]['error'];
				}
			}else {
				return null;
			}
			
		} catch (e) {
			throw e.toString();
		}
	}

  @override
  Future<UserModel> createUser({String name, String job}) async{
		try{
			
			var result = await webService.requestPOST(
				url: Services.getServices(EndPoint.Login),
				body: {
					'name': name,
					'job': job,
				},
			);
			
			if(result != null){
				if(result[ConstantUtil.result_success]){
					return UserModel.fromJson(result[ConstantUtil.result_response]);
				}else{
					throw result[ConstantUtil.result_response];
				}
			}else{
				return null;
			}
			
			
		}catch(e){
			throw e.toString();
		}
  }
  
}
