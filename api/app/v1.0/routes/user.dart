import 'package:alfred/alfred.dart';

import '../utilities/controllers/user.controller.dart';
import '../utilities/entities/user_entity.dart';

// Cette classe permet de définir les routes de l'API pour les utilisateurs
class UserRouter {
  UserRouter(NestedRoute app) {
    // La route pour faire le get pour récupérer les utilisateurs
    app.get('/', (req, res) async {
      return UserController.getData();
    });

    // La route pour faire le post pour ajouter un utilisateur
    app.post('/', (req, res) async {
      var body = await req.body as Map<String, dynamic>;
      var livre = User.fromMap(body);

      return await UserController.postData(livre);
    });

    // La route pour faire le patch pour modifier un utilisateur par son id
    app.patch('/:id', (req, res) async {
      var body = await req.body as Map<String, dynamic>;
      var livre = User.fromMap(body);
      return await UserController.patchData(livre, req.params['id']);
    });

    // La route pour faire le delete pour supprimer un utilisateur par son id
    app.delete('/:id', (req, res) async {
      var id = req.params['id'];
      return await UserController.deleteData(id);
    });
  }
}
