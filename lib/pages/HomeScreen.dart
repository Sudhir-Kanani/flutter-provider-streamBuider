import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/HomeProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Provider Demo",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
          child: Consumer<HomeProvider>(
            builder: (context, value, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value.eligiblityMsg.toString(),
                    style: TextStyle(
                        color: (value.isEligible == true) ? Colors.green : Colors.red),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter Your age',
                    ),
                    onChanged: (val) {
                     if (val.isNotEmpty) {
                       value.checkEligibility(int.parse(val));
                     }
                    },
                  )
                ],
              );
            },
          ),
        ),
      )),
    );
  }
}
