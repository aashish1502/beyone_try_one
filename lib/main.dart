import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _state = false;
  Timer? _timer;

  void _changeState() {
    setState(() {
      _state = !_state;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      print("The Counter value is: $_counter");
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      print("The Counter value is: $_counter");
    });
  }

  void _startIncrementing() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      // Update every 100ms
      setState(() {
        _counter++;
      });
    });
  }

  void _stopIncrementing() {
    _timer
        ?.cancel(); // Stop the timer and thereby stop incrementing the counter
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("The Light is"),
            Text(
              _state ? "OFF" : "ON",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            GestureDetector(
              onTapDown: (details) {
                print("Calling this");
                _changeState();
              },
              onTapUp: (details) {
                _changeState();
                print("Sending Off Signal");
              },
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTapDown: (details) {
                    print("Blind up lez go");
                    _changeState();
                  },

                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        borderRadius: BorderRadius.circular(0.0)),
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
                GestureDetector(
                  onTapDown: (details) {
                    print("Blind down lez go");
                    _changeState();
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: _incrementCounter, icon: const Icon(Icons.add)),
                IconButton(
                    onPressed: _decrementCounter,
                    icon: const Icon(Icons.remove)),
                Text(
                    style: const TextStyle(
                      fontSize: 28,
                    ),
                    "$_counter")
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
