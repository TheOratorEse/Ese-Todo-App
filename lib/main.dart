import 'package:flutter/material.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<String> _todoList = [];
  String _todoInput = '';

  void _addTodo() {
    setState(() {
      _todoList.add(_todoInput);
      _todoInput = '';
    });
  }

  void _deleteTodoItem(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ese Todo App'),
        ),
        drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
             children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('My Menu',
                style: TextStyle(color: Colors.white,
                fontSize: 24,
                ),
              ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
                ListTile(
                  leading: Icon(Icons.account_circle_sharp),
                  title: Text('Profile'),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),

                
              ),
             ],
            ),),
        body: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter a task',
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 16.0,
                ),
              ),
              onChanged: (text) {
                _todoInput = text;
              },
            ),
            ElevatedButton(
              onPressed: _addTodo,
              child: Text('Add Task'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_todoList[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deleteTodoItem(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
