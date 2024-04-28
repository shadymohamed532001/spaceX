class MyValidatorsHelper {
  static String? displayNamevalidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return 'Display name cannot be empty';
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return 'Display name must be between 3 and 20 characters';
    }
    return null;
  }

  static String? displayProductNamevalidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return 'Display Porduct name cannot be empty';
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return 'Display Product name must be between 3 and 20 characters';
    }
    return null;
  }

  static String? displayProductPricevalidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return 'Display Porduct Price cannot be empty';
    }
    if (displayName.isEmpty || displayName.length > 5) {
      return 'Display Product price must be between 1 and 5 characters';
    }
    return null;
  }

  static String? displayProductDescribtionevalidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return 'Display Porduct Description cannot be empty';
    }

    return null;
  }

  static String? displayProductTagsvalidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return 'Display Porduct Tags cannot be empty';
    }
    if (displayName.length < 5) {
      return 'Display Product Tags must be at least 5 characters long';
    }
    return null;
  }

  static String? displayProductSallervalidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return 'Display Porduct Saller cannot be empty';
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return 'Display Product Saller must be between 3 and 20 characters';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? cityValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a City name';
    }
    if (value.length < 3) {
      return 'City must be at least 3 characters long';
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a phone number';
    }
    if (value.length < 6) {
      return 'phone number must be at least 6 numbers';
    }
    return null;
  }

  static String? repeatPasswordValidator({String? value, String? password}) {
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
