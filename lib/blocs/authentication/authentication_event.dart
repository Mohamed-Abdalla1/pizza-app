part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationChanged extends AuthenticationEvent {
 final MyUser myUser;

 const AuthenticationChanged({required this.myUser});
}
