import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_pizzas_event.dart';
part 'get_pizzas_state.dart';

class GetPizzasBloc extends Bloc<GetPizzasEvent, GetPizzasState> {
  GetPizzasBloc() : super(GetPizzasInitial()) {
    on<GetPizzasEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
