class AppValidator {
  static bool isPwdVisible = false;
  static String? name(String? value, {int minLength = 3}) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    } else if (value.length < minLength) {
      return 'Name cannot be less than $minLength characters';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
      //  return "Email field cannot be empty";
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // * * * * * * *  username * * * * * * *

  static String? username(String? value, {int min = 3}) {
    if (value == null || value.isEmpty) {
      return "Username field cannot be empty";
    } else if (value.length < min) {
      return "Username cannot be less than $min characters";
    } else if (value.contains(RegExp(specialChar))) {
      return "Username should not include special characters i.e /@!#\$%";
    } else if (value.contains(RegExp(emojiPattern, unicode: true))) {
      return "Username should not include emojis";
    }

    // else if (!RegExp(usernamePattern).hasMatch(value)) {
    //   return 'Please enter a valid username';
    // }
    return null;
  }

  static String? password(String? password, {int minLength = 8}) {
    if (password == null || password.isEmpty) {
      return 'Please enter a password';
      // return "password field cannot be empty";
    } else if (password.length < minLength) {
      return 'Password must be at least $minLength characters long';
      // return "Password should have min $minimumLength characters";
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
      return 'Field cannot be empty';
    } else if (confirm != pwd) {
      return "Passwords did not match";
    }
    return null;
  }

  static void togglePwd() {
    isPwdVisible = !isPwdVisible;
  }

  static String? otp({String? value, int minLength = 4}) {
    if (value == null || value.isEmpty) {
      return "Otp field cannot be empty";
    } else if (value.length < minLength) {
      return "Otp should have min $minLength characters";
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return "Otp can only be numeric";
    }
    return null;
  }

  static String? number(String? value, {int minLength = 10}) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
      // return 'Phone number field cannot be empty';
    } else if (value.length < minLength) {
      return 'Phone number should have a min $minLength characters';
    } else if (!value.contains(
        RegExp(r"^(?:\+234\s?|0)([789]\d{2})[-\s]?(\d{3})[-\s]?(\d{4})$"))) {
      return 'Phone number invalid';
    }
    return null;
  }
}

//? Regex Patterns

const specialChar = r'[!@#\$%^&*(),.?":{}|<>]';

//* This RegEx pattern only takes lowercase and digits
const usernamePattern = r'^[a-z0-9_-]{3,15}$';

const emojiPattern = r'[\u{1F600}-\u{1F64F}'
    r'\u{1F300}-\u{1F5FF}'
    r'\u{1F680}-\u{1F6FF}'
    r'\u{2600}-\u{26FF}'
    r'\u{2700}-\u{27BF}'
    r'\u{1F900}-\u{1F9FF}'
    r'\u{1F1E6}-\u{1F1FF}'
    r'\u{1F191}-\u{1F251}'
    ']+';

const numPattern = r"^\+234[789][01]\d{8}$"
    r"^(?:\+234\s?|0)([789]\d{2})[-\s]?(\d{3})[-\s]?(\d{4})$"
    r"^(?:(?:\+234)|(0)|(\+234))(?:(?:(?:(7[01])|(8[01]))\d{7})|(?:(?:(7[01])|(8[01]))[-\s]?\d{3}[-\s]?\d{4}))(?![\d-])$";

const emailPattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
    r'+/=?^_`{|}~-]+)|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
    r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])")@(?:(?:[a-z0-9](?:[a-z0-9-]'
    r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
    r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
    r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
    r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';



  // * * * * * * *  username * * * * * * *

  // static String? username(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return "Username field cannot be empty";
  //   } else if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
  //     return "Username should not include special characters i.e /@!#\$%";
  //   } else if (value.contains(' ')) {
  //     return "Username should not contain spaces";
  //   } else if (value.contains(RegExp(r'[^\w\s]'))) {
  //     return "Username should not contain emojis";
  //   }
  //   return null;
  // }
