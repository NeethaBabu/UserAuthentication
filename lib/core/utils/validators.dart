class Validators {
  static String? email(String value) {
    if (!value.contains('@')) return 'Invalid email';
    return null;
  }

  static String? password(String value) {
    if (value.length < 6) return 'Password too short';
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Minimum 6 characters required';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Add at least 1 capital letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Add at least 1 small letter';
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Add at least 1 special character';
    }

    return null;
  }

}
