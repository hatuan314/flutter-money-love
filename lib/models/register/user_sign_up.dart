class UserSignUp {
  String _fullName;
  String _phone;
  String _email;
  String _password;

  UserSignUp(this._fullName, this._phone, this._email, this._password);

  String get password => _password;

  String get email => _email;

  String get phone => _phone;

  String get fullName => _fullName;


}