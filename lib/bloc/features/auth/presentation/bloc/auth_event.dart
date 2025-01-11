part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}
// Event -> action / aksi / tindakan yang dilakukan
// 1. AuthEventLogin -> melakukan tindakan login
// 2. AuthEventLogout -> melakukan tindakan logout
// 3. AuthEventCheck -> melakukan pengecekan user
// 4. AuthEventRegister -> melakukan registrasi user

class AuthEventLogin extends AuthEvent {
  final String email;
  final String password;

  const AuthEventLogin(this.email, this.password);
}

class AuthEventLogout extends AuthEvent {}
