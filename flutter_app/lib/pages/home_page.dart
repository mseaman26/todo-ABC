import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: const Text('TodoABC',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            labelColor: Color.fromARGB(255, 9, 56, 244),
            unselectedLabelColor: Color.fromARGB(255, 90, 90, 90),
            tabs: [
              Tab(icon: Icon(Icons.task), text: 'Todos(A)'),
              Tab(icon: Icon(Icons.task), text: 'Todos(B)'),
              Tab(icon: Icon(Icons.task), text: 'Todos(C)'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Todos(A) Page')),
            Center(child: Text('Todos(B) Page')),
            Center(child: Text('Todos(C) Page')),
          ],
        ),
      ),
    );
  }
}