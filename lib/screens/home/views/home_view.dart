import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/screens/auth/blocs/sign_in/sign_in_bloc.dart';
import 'package:pizza/screens/auth/views/welcome_view.dart';
import 'package:pizza/screens/home/blocs/get_pizzas/get_pizzas_bloc.dart';
import 'package:pizza/screens/home/views/details.view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          children: [
            Image.asset(
              'assets/8.png',
              scale: 16,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'PIZZA',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.cart)),
          IconButton(
              onPressed: () {
                context.read<SignInBloc>().add(const SignOutRequired());
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const WelcomeView(),
                  ),
                );
              },
              icon: const Icon(Icons.login)),
        ],
      ),
      body:
          BlocBuilder<GetPizzasBloc, GetPizzasState>(builder: (context, state) {
        if (state is GetPizzasSuccess) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Flexible(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  childAspectRatio: 5 / 11,
                ),
                itemCount: state.pizzaModel.length,
                itemBuilder: (context, index) {
                  return Material(
                    elevation: 3,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => DetailsView(
                              pizza: state.pizzaModel[index],
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            state.pizzaModel[index].image ?? '',
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: state.pizzaModel[index].isVeg
                                        ? Colors.green
                                        : Colors.red,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4),
                                    child: Text(
                                      state.pizzaModel[index].isVeg
                                          ? 'VEG'
                                          : 'NON-VEG',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4),
                                    child: Text(
                                      state.pizzaModel[index].spicy == 1
                                          ? '🌶️ BLAND'
                                          : state.pizzaModel[index].spicy == 2
                                              ? '🌶️ BALANCE'
                                              : '🌶️ SPICY',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10,
                                          color:
                                              state.pizzaModel[index].spicy == 1
                                                  ? Colors.green
                                                  : state.pizzaModel[index]
                                                              .spicy ==
                                                          2
                                                      ? Colors.orange
                                                      : Colors.redAccent),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              state.pizzaModel[index].name!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              state.pizzaModel[index].desc!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                  color: Colors.grey.shade400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '\$ ${state.pizzaModel[index].price - (state.pizzaModel[index].price * (state.pizzaModel[index].discount) / 100)}',
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '\$ ${state.pizzaModel[index].price}',
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        CupertinoIcons.add_circled_solid))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is GetPizzasLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: Text('There Was an Error '),
          );
        }
      }),
    );
  }
}
