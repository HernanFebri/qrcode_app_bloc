import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthStateLogout()) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    on<AuthEventLogin>((event, emit) async {
      try {
        emit(AuthStateLoading());
        // fungsi login
        await auth.signInWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(AuthStateLogin());
      } on FirebaseAuthException catch (e) {
        // error firebase
        emit(AuthStateError(e.message.toString()));
      } catch (e) {
        // error general
        emit(AuthStateError(e.toString()));
      }
    });

    on<AuthEventLogout>((event, emit) async {
      // fungsi logout
      try {
        emit(AuthStateLoading());
        await auth.signOut();
        emit(AuthStateLogout());
      } on FirebaseAuthException catch (e) {
        emit(AuthStateError(e.message.toString()));
      } catch (e) {
        emit(AuthStateError(e.toString()));
      }
    });
  }
}
