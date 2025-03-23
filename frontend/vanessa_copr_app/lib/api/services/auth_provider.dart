import 'package:flutter/material.dart';
import 'package:vanessa_copr_app/models/models.dart';

class AuthProvider extends ChangeNotifier {
  Employee? _currentUser;
  
  Employee? get currentUser => _currentUser;
  
  void setUser(Employee user) {
    _currentUser = user;
    notifyListeners();
  }
  
  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}