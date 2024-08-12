bool isValidEmail(String email) {
  final RegExp regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  return regex.hasMatch(email);
}

bool isValidPassword(String password) {
  return password.length >= 6;
}
