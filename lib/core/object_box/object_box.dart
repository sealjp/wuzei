import 'objectbox.g.dart'; // created by `flutter pub run build_runner build`
import 'system_box.dart';
import 'user_box.dart';


/// Provides access to the ObjectBox Store throughout the app.
///
/// Create this in the apps main function.
class ObjectBox {
  /// The Store of this app.
  late final Store store;

  late final Box<SystemBox> systemBox;
  late final Box<UserBox> userBox;
  ObjectBox._create(this.store) {
    // Add any additional setup code, e.g. build queries.
    systemBox = Box<SystemBox>(store);
    userBox = Box<UserBox>(store);
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore();
    return ObjectBox._create(store);
  }
}
