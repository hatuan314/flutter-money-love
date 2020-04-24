import 'package:moneyloveapp/services/register/regiser_service.dart';

class RegisterRepository {
  RegisterProvider _provider = RegisterProvider();

  Future googleSignInRepository() => _provider.googleSignInProvider();
}
