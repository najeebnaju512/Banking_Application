class AppConfig {
  //baseurl is set here
  static String baseurl = "http://10.11.0.170:8000/";

  //key to store data from api function in LoginController in json format used in AppUtils to get accesskey&userid
  static const String loginData = 'logInData';
  //key to store data from api function in LoginController in json format used in AppUtils to get userdetails only
  static const String userData = 'userdata';
  //key to store username which user entered used in registration page controller, login page controller
  static const String userName = "username";

  //key to check whether the user is already registered  or not and navigate to login page on every other startup since registering.
  static const String status = "status";
}
