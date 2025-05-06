import 'package:flutter/material.dart';

void main() {
  runApp(const TodoListApp());
}


class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoHomePage(),
    );
  }
}

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  TodoHomePageState createState() => TodoHomePageState();
}

class TodoHomePageState extends State<TodoHomePage> {
  final List<String> _todos = []; // Daftar tugas
  final TextEditingController _controller = TextEditingController(); // Untuk input teks

  void _addTodo() {
    final text = _controller.text;
    if (text.isNotEmpty) {
      setState(() {
        _todos.add(text);
        _controller.clear();
      });
    }
  }

  void _removeTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('daftar Tugas'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(_todos[index]),
                    trailing: IconButton( 
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeTodo(index),
                    ),
                    onLongPress: () => _removeTodo(index),
                  ),
                );
              },
            ),
          ),
          SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'tambahkan tugas',
                      border: OutlineInputBorder(),
                    ),
                  )),
                  const SizedBox(width: 8),
                  ElevatedButton(onPressed:_addTodo, child: const Text('Tambah')),
              ],
            ),
           ),
          ),
        ],
      ),
    );
  }
}
