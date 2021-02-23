
import 'package:flutter_bloc_practice/features/get/core/utils/constant_utils.dart';
import 'package:flutter_bloc_practice/features/get/share/model/user_list_model.dart';
import 'package:flutter_bloc_practice/features/get/share/service/service.dart';
import 'package:flutter_bloc_practice/features/get/share/service/web_service.dart';

abstract class HomeDataSource{
	
	Future<UserListModel> fetchUserList();
}

class HomeDataSourceImpl extends HomeDataSource{
	
	final WebService webService;
	
	
	HomeDataSourceImpl({this.webService});

  @override
  Future<UserListModel> fetchUserList() async{
	  
  	try {
		  var result = await webService.requestGET(
			  url: Services.getServices(EndPoint.UserList),
		  );
		
		  print(result);
		
		  if(result != null){
			  if(result[ConstantUtil.result_success]){
				  return UserListModel.fromJson(result[ConstantUtil.result_response]);
			  }else{
				  throw result[ConstantUtil.result_response];
			  }
		  }else {
			  return null;
		  }
		
	  } catch (e) {
		  throw e.toString();
	  }
  }
	
}