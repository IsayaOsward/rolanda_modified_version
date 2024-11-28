import 'package:flutter/material.dart';

class Validator {
  // Email validation (strict format)
  static String? validateEmail(String? email, BuildContext context) {
    if (email == null || email.isEmpty) {
      return "Email is required";
    }
    // Regular expression for email validation
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(emailPattern);
    if (!regex.hasMatch(email)) {
      return "Please enter a valid email";
    }
    return null;
  }

  // Password validation for login (ensure it's not empty)
  static String? validateLoginPassword(String? password, BuildContext context) {
    if (password == null || password.isEmpty) {
      return "Password is required";
    }
    return null;
  }

  // Strong password validation for registration
  static String? validateRegisterPassword(
      String? password, BuildContext context) {
    if (password == null || password.isEmpty) {
      return "Password is required";
    }

    List<String> missingCriteria = [];

    // Check if password is at least 8 characters long
    if (password.length < 8) {
      missingCriteria.add("Password must be at least 8 characters long");
    }

    // Check if password contains at least one uppercase letter
    if (!password.contains(RegExp(r'[A-Z]'))) {
      missingCriteria
          .add("Password must contain at least one upper case character");
    }

    // Check if password contains at least one lowercase letter
    if (!password.contains(RegExp(r'[a-z]'))) {
      missingCriteria
          .add("Password must contain at least one upper case character");
    }

    // Check if password contains at least one digit
    if (!password.contains(RegExp(r'\d'))) {
      missingCriteria.add("Password must contain at least one digit");
    }

    // Check if password contains at least one special character
    if (!password.contains(RegExp(r'[@$!%*?&]'))) {
      missingCriteria.add(
          "Password must contain at least one special character"); // Use localized string
    }

    // If the missing criteria list is not empty, return the list of missing criteria
    if (missingCriteria.isNotEmpty) {
      return "Password must contain ${missingCriteria.join(', ')}";
    }

    // If all criteria are met, return null (password is valid)
    return null;
  }

  // Compare password and confirm password
  static String? validateConfirmPassword(
      String? password, String? confirmPassword, BuildContext context) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm password is requried";
    }
    if (password != confirmPassword) {
      return "Passwords does not match";
    }
    return null;
  }

  // Name validation (no null, no numbers, no special characters)
  static String? validateName(String? name, BuildContext context) {
    if (name == null || name.isEmpty) {
      return "This field is required";
    }
    // Name should only contain alphabets and spaces (no numbers or special characters)
    String namePattern = r'^[a-zA-Z ]+$';
    RegExp regex = RegExp(namePattern);
    if (!regex.hasMatch(name)) {
      return "Invalid input";
    }
    return null;
  }

  // Phone number validation (must start with 0 and be exactly 10 digits)
  static String? validatePhoneNumber(
      String? phoneNumber, BuildContext context) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return "This field is required";
    }

    // Phone number pattern: starts with 0 and has exactly 10 digits
    String phonePattern = r'^0\d{9}$';
    RegExp regex = RegExp(phonePattern);

    if (!regex.hasMatch(phoneNumber)) {
      return "Phone number must start with 0 and be exactly 10 digits";
    }

    return null;
  }

  static String? validateInternationalPhoneNumber(
      String? phoneNumber, BuildContext context) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return "This field is required";
    }

    if (phoneNumber.startsWith('0')) {
      // Must be 10 digits
      if (phoneNumber.length != 10) {
        return "Phone number must be exactly 10 digits if it starts with '0'";
      }
    } else if (phoneNumber.startsWith('+')) {
      // Must be 13 characters including '+'
      if (phoneNumber.length != 13) {
        return "Phone number must be exactly 13 characters including '+'";
      }
    } else {
      // Must be 12 digits
      if (phoneNumber.length != 12) {
        return "Phone number must be exactly 12 digits if it doesn't start with '0' or '+'";
      }
    }

    return null; // Validation passed
  }


  static String? validateAndFormatPhoneNumber(String phoneNumber) {
    if (phoneNumber.startsWith('0')) {
      // Remove the leading zero and replace it with '255'
      return '255${phoneNumber.substring(1)}';
    } else if (phoneNumber.startsWith('255')) {
      // Leave as it is
      return phoneNumber;
    } else if (phoneNumber.startsWith('+')) {
      // Remove the leading '+'
      return phoneNumber.substring(1);
    } else {
      // Return the original if no conditions are met
      return phoneNumber;
    }
  }

  // Number validation (ensure it's only digits, no strings)
  static String? validateNumber(String? number, BuildContext context) {
    if (number == null || number.isEmpty) {
      return "This field is required";
    }
    // Regular expression to ensure the input only contains digits
    String numberPattern = r'^\d+$';
    RegExp regex = RegExp(numberPattern);
    if (!regex.hasMatch(number)) {
      return "Only numbers are allowed";
    }
    return null;
  }

// Bank account number validation (8 to 17 digits)
  static String? validateBankAccountNumber(
      String? accountNumber, BuildContext context) {
    if (accountNumber == null || accountNumber.isEmpty) {
      return "This field is required";
    }
    // Regular expression to ensure the input only contains digits and length is between 8 and 17
    String accountPattern = r'^\d{8,17}$';
    RegExp regex = RegExp(accountPattern);
    if (!regex.hasMatch(accountNumber)) {
      return "Account number must be 8 to 17 digits long";
    }
    return null;
  }

  static String? validateAddress(String? address, BuildContext context) {
    if (address == null || address.isEmpty) {
      return "This field is required";
    }
    // Address can contain letters, numbers, spaces, and common address symbols
    String addressPattern = r'^[a-zA-Z0-9\s,.-]+$';
    RegExp regex = RegExp(addressPattern);
    if (!regex.hasMatch(address)) {
      return "Invalid address format";
    }
    return null;
  }

  static String? validateTextOrMessage(String? text, BuildContext context) {
    if (text == null || text.isEmpty) {
      return "This field is required";
    }
    // Text can contain alphanumeric characters, spaces, and common punctuation
    String textPattern = r"""^[a-zA-Z0-9\s.,?!\'"-]+$""";
    RegExp regex = RegExp(textPattern);
    if (!regex.hasMatch(text)) {
      return "Invalid text or message format";
    }
    return null;
  }
}
