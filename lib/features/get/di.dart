import 'package:flutter_bloc_practice/features/get/share/data/datasource/auth_datasource.dart';
import 'package:flutter_bloc_practice/features/get/share/data/repository/auth_repository_impl.dart';
import 'package:flutter_bloc_practice/features/get/share/domain/repository/auth_repository.dart';
import 'package:flutter_bloc_practice/features/get/share/domain/usecase/create_user_usecase.dart';
import 'package:flutter_bloc_practice/features/get/share/domain/usecase/login_usecase.dart';
import 'package:flutter_bloc_practice/features/get/login/presentation/controller/login_controller.dart';
import 'package:flutter_bloc_practice/features/get/share/service/web_service.dart';
import 'package:get/get.dart';

Future setUpDi() async {

	///External
	Get.put(WebService());
	
	///DataSource
	Get.lazyPut<AuthDataSource>(() => AuthDataSourceImpl(webService: Get.find()));
	
	///Repository
	Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(authDataSource: Get.find()));
	
	///UseCase
	Get.lazyPut(() => LoginUseCase(authRepository: Get.find()));
	Get.lazyPut(() => CreateUserCase(authRepository: Get.find()));
	
	///Controller
	Get.lazyPut(() => LoginController(loginUseCase: Get.find()));
	
}
