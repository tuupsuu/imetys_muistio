import 'package:flutter/material.dart';
import 'package:imetys_muistio/widgets/add_entry.dart';
import 'package:imetys_muistio/widgets/custom_app_bar.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imetysmuistio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: const MyHomePage(title: 'Merkinnät'),
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
      appBar: CustomAppBar('Lisää maito'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[const Text('Lisää merkintä plus näppäimestä')],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddDialog,
        tooltip: 'Lisää',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _openAddDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddEntry();
      },
    );
  }
}
