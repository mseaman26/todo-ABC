import 'package:flutter/material.dart';

const List<Map<String, dynamic>> todoTabs = [
  {
    'label': 'Todos(A)',
    'icon': Icons.task,
  },
  {
    'label': 'Todos(B)',
    'icon': Icons.task,
  },
  {
    'label': 'Todos(C)',
    'icon': Icons.task,
  },
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Separate todo lists for A, B, C tabs
  final List<String> _todosA = [];
  final List<String> _todosB = [];
  final List<String> _todosC = [];

  // Track which todos are completed
  final Set<String> _completed = {};

  // Helper to show an add-todo dialog
  void _addTodoDialog(List<String> targetList) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Todo'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Enter todo'),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                setState(() => targetList.add(controller.text.trim()));
              }
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  // Widget builder for one tab’s todo list
  Widget _buildTodoList(List<String> todos) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              final isDone = _completed.contains(todo);
              return CheckboxListTile(
                title: Text(
                  todo,
                  style: TextStyle(
                    decoration: isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
                value: isDone,
                onChanged: (checked) {
                  setState(() {
                    if (checked == true) {
                      _completed.add(todo);
                    } else {
                      _completed.remove(todo);
                    }
                  });
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: FloatingActionButton.extended(
            onPressed: () => _addTodoDialog(todos),
            label: const Text('Add Todo'),
            icon: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: todoTabs.length,
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          title: const Text(
            'TodoABC',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            labelColor: Color.fromARGB(255, 9, 56, 244),
            unselectedLabelColor: Color.fromARGB(255, 90, 90, 90),
            tabs: todoTabs
                .map(
                  (tab) => Tab(
                    text: tab['label'] as String,
                    icon: Icon(tab['icon'] as IconData),
                  ),
                )
                .toList(),
          ),
        ),
        body: TabBarView(
          children: [
            _buildTodoList(_todosA),
            _buildTodoList(_todosB),
            _buildTodoList(_todosC),
          ],
        ),
      ),
    );
  }
}
