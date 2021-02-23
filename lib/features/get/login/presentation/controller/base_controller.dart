import 'package:get/get.dart';


abstract class BaseController<T> extends GetxController{
	
  RxBool _isDataLoading = false.obs;
	RxString _error = ''.obs;
	T _data;


  set setLoader(bool value) {
  		_isDataLoading.value = value;
  		//_reset();
  }
  
  set setError(String value) {
  //	_reset();
    _error.value = value;
    setError = '';
  }

  set setData(T value) {
	  _data = value;
	  //_reset();
  }

  _reset(){
    setData = null;
    setError = '';
    setLoader =false;
  }
  
  @override
  void onClose() {
	  _isDataLoading.close();
	  _error.close();
	  super.onClose();
  }

  T get data => _data;

  String get error => _error.value;

  bool get isDataLoading => _isDataLoading.value;
}