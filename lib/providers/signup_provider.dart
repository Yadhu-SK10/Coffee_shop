import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  bool _isTermsAccepted = false;

  bool get isTermsAccepted => _isTermsAccepted;

  void toggleTerms() {
    _isTermsAccepted = !_isTermsAccepted;
    notifyListeners();
  }
}
