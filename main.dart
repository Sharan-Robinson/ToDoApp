import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
    items: List<String>.generate(10000, (i) => 'Item $i'),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required List<String> items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        backgroundColor: Colors.black,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('ToDoApp'),
      ),
      body: Center(
        child: ListView(children: [
          ElevatedButton.icon(
              onPressed: () {}, icon: Icon(Icons.add), label: Text('Test'))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const addToDo()));
          },
          backgroundColor: Colors.red,
          child: const Icon(Icons.add)),
    );
  }
}

class addToDo extends StatefulWidget {
  const addToDo({Key? key}) : super(key: key);

  @override
  State<addToDo> createState() => _addToDoState();
}

class _addToDoState extends State<addToDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDoApp'),
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, true);
        },
        child: const Icon(Icons.keyboard_return),
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'Add your ToDo here:'),
        ),
      ),
    );
  }
}
