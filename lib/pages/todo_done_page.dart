import 'package:flutter/material.dart';
import 'package:flutter_todolist_app_habiskerja/utils/network_manager.dart';
import 'package:flutter_todolist_app_habiskerja/widget/item_widget.dart';

import '../model/todo_item.dart';

class TodoDonePage extends StatefulWidget {
  const TodoDonePage({super.key});

  @override
  State<TodoDonePage> createState() => _TodoDonePageState();
}

class _TodoDonePageState extends State<TodoDonePage> {
  List<TodoItem> todos = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    NetworkManager().getTodosIsDone(true).then((value) {
      todos = value;
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List App"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Todo yang sudah anda selesaikan",
                  style: textTheme.bodyText1,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todoItem = todos[index];

                  return ItemWidget(
                    todoItem: todoItem,
                    handleRefresh: () {},
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
