import '../../lib.dart';
import 'objectbox.g.dart';
import '../../main.dart';

class UserDao {
  static Future<List<UserBox>> queryAll() async {
    List<UserBox> res;
    final queryB = objectbox.userBox.query()
      ..order(UserBox_.contactTime, flags: Order.descending);
    final query = queryB.build();
    res = query.find();
    query.close();
    if (res.isEmpty) {
      await RSAUtil.generateMyKeyPair();
      queryAll();
    }
    return res;
  }

  // static UserBox queryLast() => queryAll().last;

  static UserBox queryMe() {
    final query = objectbox.userBox.query(UserBox_.id.equals(1)).build();
    final UserBox? result = query.findFirst();
    query.close();
    return result ?? _creatMe();
  }

  static UserBox _creatMe() {
    final UserBox me = UserBox(name: 'me');
    save(me);
    return me;
  }

  static removeUser(int id) => objectbox.userBox.remove(id);

  static void save(UserBox box) => objectbox.userBox.put(box);
}
