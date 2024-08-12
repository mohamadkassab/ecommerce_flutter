import '../models/user.dart';

class AuthService {
  User? _user;

  Future<User?> login(String email, String password) async {
    // Mock login logic
    if (email == 'test@example.com' && password == 'password') {
      _user = User(id: '1', email: email, password: password);
      return _user;
    }
    return null;
  }

  Future<User?> signup(String email, String password) async {
    // Mock signup logic
    _user = User(id: '2', email: email, password: password);
    return _user;
  }
}
