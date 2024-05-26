part of 'get_pizzas_bloc.dart';
sealed class GetPizzasState extends Equatable {
  const GetPizzasState();

  @override
  List<Object> get props => [];
}

final class GetPizzasInitial extends GetPizzasState {}

final class GetPizzasLoading extends GetPizzasState {}

final class GetPizzasSuccess extends GetPizzasState {
  final List<PizzaModel> pizzaModel;

 const GetPizzasSuccess({required this.pizzaModel});
}

final class GetPizzasFailure extends GetPizzasState {}
