part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationSuccess extends AuthenticationState {
  final MyUser myUser;

  const AuthenticationSuccess({required this.myUser});
}

final class AuthenticationFailure extends AuthenticationState {
  final String errMessage;

 const AuthenticationFailure({required this.errMessage});
}

final class AuthenticationLoading extends AuthenticationState {}
