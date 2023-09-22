// import 'package:shared_preferences/shared_preferences.dart';

// class StorageUtil {
//   static StorageUtil? _storageUtil;
//   static SharedPreferences? _preferences;
//   static Future<StorageUtil> getInstance() async {
//     if (_storageUtil == null) {
//       // keep local instance till it is fully initialized.
//       var secureStorage = StorageUtil._();
//       await secureStorage._init();
//       _storageUtil = secureStorage;
//     }
//     return _storageUtil!;
//   }

//   StorageUtil._();
//   Future _init() async {
//     _preferences = await SharedPreferences.getInstance();
//   }

//   // get string
//   static String getString({required String key, String defValue = ''}) {
//     if (_preferences == null) return defValue;
//     return _preferences?.getString(key) ?? defValue;
//   }

//   // get string
//   static int getInt({required String key, int defValue = 0}) {
//     if (_preferences == null) return defValue;
//     return _preferences?.getInt(key) ?? defValue;
//   }

//   // get bool

//   static bool getBool({required String key, bool defValue = false}) {
//     if (_preferences == null) return defValue;
//     return _preferences?.getBool(key) ?? defValue;
//   }

//   // put string
//   static Future<bool>? putString({required String key, required String value}) {
//     if (_preferences == null) return null;
//     return _preferences?.setString(key, value);
//   }

//   // put int
//   static Future<bool>? putInt({required String key, required int value}) {
//     if (_preferences == null) return null;
//     return _preferences?.setInt(key, value);
//   }

//   //put bool
//   static Future<bool>? putBool({required String key, required bool value}) {
//     if (_preferences == null) return null;
//     return _preferences?.setBool(key, value);
//   }

//   static Future<bool>? resetpreferencedata({required String key}) {
//     if (_preferences == null) return null;
//     // print("not null and removed");
//     return _preferences?.remove(key);
//   }
// }

// class LocalDBStrings {
//   static const String userFlowState = "userFlowState";
//   static const String token = "token";
// }
