import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository userRepository;
  SignUpBloc({required this.userRepository}) : super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) async {
      emit(SignUpLoading());
      try {
        MyUser myUser =
            await userRepository.signUp(event.myUser, event.password);
        await userRepository.setUserData(myUser);
        emit(SignUpsuccess());
      } catch (e) {
        emit(SignUpFailure());
      }
    });
  }
}
