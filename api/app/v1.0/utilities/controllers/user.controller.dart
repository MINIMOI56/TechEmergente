import '../entities/user_entity.dart';
import '../services/user.service.dart';

class UserController {
  //Cette methode permet de recuperer tous les utilisateurs de la base de donnees
  static Future<List<User>> getData() async {
    return await UserService.getData();
  }

  //Cette methode permet d'ajouter un utilisateur dans la base de donnees
  static Future<User> postData(User user) async {
    return await UserService.postData(user);
  }

  //Cette methode permet de modifier un utilisateur dans la base de donnees
  static Future<bool> patchData(User user, String id) async {
    return await UserService.patchData(user, id);
  }

  //Cette methode permet de supprimer un utilisateur dans la base de donnees
  static Future<String> deleteData(String id) async {
    var data = await UserService.deleteData(id);
    return data.toString();
  }
}
