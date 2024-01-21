part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {
}

class LoginLoading extends LoginState {
}

class LoginLoaded extends LoginState {
}

class LoginError extends LoginState {
}
