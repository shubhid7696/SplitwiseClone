extension StringExtension on String {
  bool get isValidEmail {
    final RegExp emailRegExp = RegExp(r'^$|^([a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*)$');
    print("${emailRegExp.hasMatch(this)}");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    // Consider a more robust name validation for real-world scenarios
    final RegExp nameRegExp = RegExp(r'^[a-zA-Z ]*$');
    print("${nameRegExp.hasMatch(this)}");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    // This is a basic password validation example. Consider using a more secure validation strategy in production.
    final RegExp passwordRegExp = RegExp(r'^(?:(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])|.{0})?$', multiLine: true);
    print("${passwordRegExp.hasMatch(this)}");
    return passwordRegExp.hasMatch(this);
  }
}