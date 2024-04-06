class FirebaseException {
  // Error Handling
  String getErrorString(String? errorCode) {
    switch (errorCode) {
      case "invalid-email":
        return "Invalid email or password.";
      case "wrong-password":
        return "Invalid email or password.";
      case "user-not-found":
        return "User with this email doesn't exist.";
      case "user-disabled":
        return "User with this email has been disabled.";
      case "too-many-requests":
        return "Too many requests. Try again later.";
      case "operation-not-allowed":
        return "Signing in with Email and Password is not enabled.";
      case "email-already-in-use":
        return "An account already exists for this email.";
      case "weak-password":
        return "Password should be at least 6 characters.";
      default:
        return errorCode ?? "Invalid";
    }
  }
}
