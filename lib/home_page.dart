import 'package:flutter/material.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => TodoHomePageState();
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

  // void _removeTodo(int index) {
  //   setState(() {
  //     _todos.removeAt(index);
  //   });
  // }
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
                return Dismissible(key: Key(_todos[index]),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    _todos.removeAt(index);
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Tugas dihapus'),
                      ),
                    );
                  },
                child: Card(
                    child: ListTile(
                      title: Text(_todos[index]),
                    ),
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
                      labelText: 'Tambahkan tugas',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addTodo,
                  child: const Text('Tambah'),
                ),
              ],
            ),
          ),
        ),
      ],
    )
   );
  }
}