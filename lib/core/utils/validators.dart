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

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final List<String> errors = [];

    if (!value.contains('@')) {
      errors.add('• Missing @ symbol');
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      errors.add('• Invalid email format');
    }

    return errors.isEmpty ? null : errors.join('\n');
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }

    if (value.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }

    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
      return 'Only letters allowed';
    }

    return null;
  }

  static String? validateConfirmPassword(
      String? confirmValue,
      String originalPassword,
      ) {
    if (confirmValue == null || confirmValue.isEmpty) {
      return 'Confirm password is required';
    }

    if (confirmValue != originalPassword) {
      return 'Passwords do not match';
    }

    return null;
  }

}
