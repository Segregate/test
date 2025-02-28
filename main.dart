import 'package:e_commerce_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter teemo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter tt Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have enter the button this many times:'),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                SnackBar snackBar;
                if (state.hasIncremnted) {
                  snackBar = const SnackBar(
                    content: Text('Incremnted'),
                    duration: Duration(milliseconds: 200),
                  );
                } else {
                  snackBar = const SnackBar(
                    content: Text('Decremnted'),
                    duration: Duration(milliseconds: 200),
                  );
                }
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              builder: (context, state) {
                return Text(
                  '${state.value}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: BlocProvider.of<CounterCubit>(context).increment,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: 16,
                ),
                FloatingActionButton(
                  onPressed: BlocProvider.of<CounterCubit>(context).decrement,
                  tooltip: 'Increment',
                  child: const Icon(Icons.remove),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
