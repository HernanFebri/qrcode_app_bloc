part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

// State -> kondisi saat ini
// 1. AuthStateLogin -> user sedang login
// 2. AuthStateLogout -> user sedang logout
// 3. AuthStateLoading -> sedang loading
// 4. AuthStateError -> terjadi error

class AuthStateLogin extends AuthState {}

class AuthStateLogout extends AuthState {}

class AuthStateLoading extends AuthState {}

class AuthStateError extends AuthState {
  final String message;

  const AuthStateError(this.message);
}
