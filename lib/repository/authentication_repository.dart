class AuthenticationRepository {
  final List<String> _fakeUser = [];

  Future<bool> userExist(String email) async {
    await Future.delayed(Duration(milliseconds: 500));
    return _fakeUser.contains(email);
  }

  Future<void> register(String email) async {
    await Future.delayed(Duration(milliseconds: 500));
    _fakeUser.add(email);
  }

  Future<void> login(String email) async {
    await Future.delayed(Duration(milliseconds: 300));
  }
}
