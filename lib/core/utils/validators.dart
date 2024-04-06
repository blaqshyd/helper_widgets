import 'regex.dart';

class AppValidator {
  static bool isPwdVisible = false;
  static String? name(String? value, String? name, {int minLength = 3}) {
    if (value == null || value.isEmpty) {
      return '$name cannot be empty';
    } else if (value.length < minLength) {
      return '$name cannot be less than $minLength characters';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return "Email cannot be empty";
    } else if (!RegExp(emailPattern2).hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? username(String? value, {int min = 3}) {
    if (value == null || value.isEmpty) {
      return "Username cannot be empty";
    } else if (value.length < min) {
      return "Username cannot be less than $min characters";
    } else if (value.contains(RegExp(specialChar))) {
      return "Username should not include special characters i.e /@!#\$%";
    } else if (value.contains(RegExp(emojiPattern, unicode: true))) {
      return "Username should not include emojis";
    } else if (!RegExp(usernamePattern).hasMatch(value)) {
      return 'Please enter a valid username';
    }
    return null;
  }

  static String? password(String? password, {int minLength = 8}) {
    if (password == null || password.isEmpty) {
      return "Password cannot be empty";
    } else if (password.length < minLength) {
      return "Password should have min $minLength characters";
    } else if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    } else if (!password.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    } else if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit';
    } else if (!password.contains(RegExp(specialChar))) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  static String? confirmPwd({String? pwd, String? confirm}) {
    if (pwd == null || pwd.isEmpty) {
      // return '$name cannot be empty';
      return 'Re-enter the password';
    } else if (confirm != pwd) {
      return "Passwords did not match";
    }
    return null;
  }

  static void togglePwd() {
    isPwdVisible = !isPwdVisible;
  }

  static String? otp(String? value, {int minLength = 4}) {
    if (value == null || value.isEmpty) {
      return "Otp cannot be empty";
    } else if (value.length < minLength) {
      return "Otp should have min $minLength characters";
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return "Otp can only be numeric";
    }
    return null;
  }

  static String? number(String? value, {int minLength = 10}) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    } else if (value.length < minLength) {
      return 'Phone number should have a min $minLength characters';
    } else if (!value.contains(RegExp(numPattern))) {
      return 'Phone number invalid';
    }
    return null;
  }
}
