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

    final List<String> errors = [];

    if (value.length < 6) {
      errors.add('• Minimum 6 characters required');
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      errors.add('• Add at least 1 capital letter');
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      errors.add('• Add at least 1 small letter');
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      errors.add('• Add at least 1 special character');
    }

    if (errors.isEmpty) {
      return null; // ✅ valid password
    }

    return errors.join('\n'); // ✅ show all errors
  }


}
