import 'package:alfred/alfred.dart';
import 'routes/user.dart';

//Le routeur utiliser pour les routes de l'api
class V1Router {
  V1Router(NestedRoute app) {
    var users = app.route('/users', middleware: []);

    UserRouter(users);
  }
}
