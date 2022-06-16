import 'package:flutter/material.dart';
import 'package:flutter_16_bloc/home_bloc.dart';
import 'package:flutter_16_bloc/home_event.dart';
import 'package:flutter_16_bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // void _incrementCounter() {
  //   homeBloc.increasement();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            BlocListener<HomeBloc, HomeState>(
              listener: (_, state) {
                // tuy vao trang thai, se show dialog, toast/ snackbar, chuyen man
                // if (state.counter == 5) {
                //   showDialog(
                //     context: context,
                //     builder: (_) {
                //       return const AlertDialog(
                //         content: Text('Dialog example'),
                //       );
                //     },
                //   );
                // }
              },
              child: Text(''),
            ),

            SizedBox(
              height: 30,
            ),

            // BlocConsumer(builder: builder, listener: listener),

            Text('counter: '),
            BlocConsumer<HomeBloc, HomeState>(builder: (_, state) {
              return Text('${state.counter}');
            }, listener: (_, state) {
              if (state.counter == 5) {
                showDialog(
                  context: context,
                  builder: (_) {
                    return const AlertDialog(
                      content: Text('Dialog example'),
                    );
                  },
                );
              }
            }),

            // BlocSelector<HomeBloc, HomeState, int>(
            //   selector: (state) => state.counter,
            //   builder: (_, counter) {
            //     return Text('$counter');
            //   },
            // ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    // xu ly su kien thanh cong hay that bai
                    BlocProvider.of<HomeBloc>(context).add(IncrementCounter());

                    // provider
                    // final result = await Controller.increment();
                    // chuyen man
                  },
                  child: Text('Increment counter'),
                ),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context).add(DecrementCounter());
                  },
                  child: Text('Decrement counter'),
                ),
              ],
            ),
            Text('number: '),
            BlocSelector<HomeBloc, HomeState, int>(
              selector: (state) => state.number,
              builder: (_, number) {
                return Text('$number');
              },
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context).add(IncrementNumber());
                  },
                  child: Text('Increment number'),
                ),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context).add(DecrementNumber());
                  },
                  child: Text('Decrement number'),
                ),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
