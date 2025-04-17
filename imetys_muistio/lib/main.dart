import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddDialog,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _openAddDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Mitä lisätään?"),
          content: Column(
            children: [
              TextButton(
                onPressed: () => _addMilk(),
                child: Text("Maito"),
              ),
              TextButton(
                onPressed: () => _addPoop(),
                child: Text("Pissa/kakka"),
              ),
              TextButton(
                onPressed: () => _addClean(),
                child: Text("Puhdistus"),
              ),
              TextButton(
                onPressed: () => _addCustom(),
                child: Text("Muu"),
              ),
            ],
          ),
        );
      },
    );
  }

  void _addPoop() {}

  void _addMilk() {}

  void _addClean() {}

  void _addCustom() {}
}
