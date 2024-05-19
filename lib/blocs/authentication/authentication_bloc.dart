import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  late final StreamSubscription<MyUser?> _userSubscription;
  AuthenticationBloc({required this.userRepository})
      : super(AuthenticationLoading()) {
    _userSubscription = userRepository.user.listen(
      (event) {
        add(AuthenticationChanged(myUser: event));
      },
    );
    on<AuthenticationChanged>((event, emit) {
      if (event.myUser != MyUser.empty) {
        emit(AuthenticationSuccess(myUser: event.myUser!));
      } else {
        emit(const AuthenticationFailure(errMessage: 'there was an Error'));
      }
    });
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
