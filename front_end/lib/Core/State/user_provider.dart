import 'package:flutter/foundation.dart';
import 'user_model.dart';

class UserProvider extends ChangeNotifier {
  User? _loggedInUser;

  User? get loggedInUser => _loggedInUser;

  void setLoggedInUser(User user) {
    _loggedInUser = user;
    notifyListeners();
  }
}
