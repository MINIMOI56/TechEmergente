import 'package:alfred/alfred.dart';
import 'package:mongo_dart/mongo_dart.dart';
import '../entities/user_entity.dart';
import 'database/mongo.dart';

/*
* Ceci est un service qui permet de faire des requêtes à la base de données
* Il permet de récupérer, ajouter, modifier et supprimer des données
*/
class UserService {
  static Future<DbCollection> collection() async =>
      await MongoService.collection('user');
  
  // Récupérer les user dans la bd
  static Future<List<User>> getData() async {
    var result = await (await collection()).find().toList();
    return result.map((e) => User.fromMap(e)).toList();
  }

  // Ajouter un user dans la bd
  static Future<User> postData(User user) async {
    var result = await (await collection()).insert(user.toMap());
    return user;
  }

  // Modifier un user dans la bd
  static Future<bool> patchData(User user, String id) async {
    var result = await (await collection()).replaceOne(
        {"_id": ObjectId.fromHexString(id)}, user.toMap(withId: false),
        upsert: true);
    if (result.isFailure) {
      throw AlfredException(500, user.id);
    }
    return true;
  }

  // Supprimer un user dans la bd
  static Future<bool> deleteData(String id) async {
    var result =
        await (await collection()).remove(where.id(ObjectId.parse(id)));
    if (result.isEmpty) {
      throw AlfredException(500, id);
    }
    return true;
  }
}
