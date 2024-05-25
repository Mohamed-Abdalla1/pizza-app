import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza/components/macro.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(3, 3),
                      blurRadius: 5,
                    ),
                  ],
                  image:
                      const DecorationImage(image: AssetImage('assets/5.png'))),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(3, 3), blurRadius: 5)
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                              'Truffle Temptation Extravaganeza',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "\$12.00",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent),
                                ),
                                Text(
                                  "\$16.00",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    MyMacro()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
