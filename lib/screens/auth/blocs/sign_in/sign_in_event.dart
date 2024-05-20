part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}


class SigninRequred  extends SignInEvent{
   final String email;
  final String password;

 const  SigninRequred({required this.email, required this.password});


   @override
  List<Object> get props => [];
}
class SignOutRequired extends SignInEvent {}