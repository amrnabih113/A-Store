import 'package:a_store/generated/l10n.dart';
import 'package:flutter/material.dart';

class MyValidator {
  static String? validateEmptyText(String? fieldName, String? text) {
    if (text == null || text.isEmpty) {
      return '$fieldName ${S.current.fieldRequired}';
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return S.current.emailRequired;
    }

    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return S.current.invalidEmail;
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return S.current.passwordRequired;
    }

    if (password.length < 6) {
      return S.current.passwordTooShort;
    }

    return null;
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return S.current.phoneNumberRequired;
    }

    final RegExp phoneNumberRegex = RegExp(r'^\d{11}$');
    if (!phoneNumberRegex.hasMatch(phoneNumber)) {
      return S.current.invalidPhoneNumber;
    }

    return null;
  }

  static String? validateConfirmPassword(
      String? password, String? confirmPassword, BuildContext context) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return S.current.confirmPasswordRequired;
    }
    if (password != confirmPassword) {
      return S.current.passwordsDoNotMatch;
    }

    return null;
  }
}
