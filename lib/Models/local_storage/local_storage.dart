import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late final SharedPreferences _sharedPrefs;
  //String key for userid
  final String keyUserID = "userId";
  //String key for postcode
  final String keyPostCode = "postCode";

  //String key for userid

  //Implements the Singleton design pattern using a private constructor
  // (SharedPrefs._internal()) and a factory constructor
  // (factory SharedPrefs() => _instance;).
  // This ensures that only one instance of SharedPrefs can exist throughout
  // the application.
  static final SharedPrefs _instance = SharedPrefs._internal();

  factory SharedPrefs() => _instance;

  SharedPrefs._internal(); //
//Defines an asynchronous init method that initializes the _sharedPrefs object
// by calling SharedPreferences.getInstance().
// This method needs to be called before accessing shared preferences.
  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  String get userID => _sharedPrefs.getString(keyUserID) ?? "";

  set userID(String value) {
    _sharedPrefs.setString(keyUserID, value);
  }

  String get postCode => _sharedPrefs.getString(keyPostCode) ?? "";

  set postCode(String value) {
    _sharedPrefs.setString(keyUserID, value);
  }
}
