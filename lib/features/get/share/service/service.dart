enum EndPoint {
  Login,
  UserList,
  CreateUser,
}

class Services {
  static final baseUrl = 'https://reqres.in/api/';

  static String getServices(EndPoint endPoint) {
    switch (endPoint) {
      case EndPoint.Login:
        return baseUrl + 'login';
      case EndPoint.UserList:
        return baseUrl + 'users?page=1';
      case EndPoint.CreateUser:
        return baseUrl + 'users';

      default:
        return '';
    }
  }
}
