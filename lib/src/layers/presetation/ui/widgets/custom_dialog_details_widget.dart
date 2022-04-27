import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/src/layers/presetation/controllers/to_do_list_controller.dart';

class CustomDialogDetailsWidget extends StatelessWidget {
  const CustomDialogDetailsWidget(
      {Key? key, required this.currentList, required this.itemIndex})
      : super(key: key);
  final int currentList;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    final toDoListController = context.watch<ToDoListController>();
    return SimpleDialog(
        elevation: 5,
        contentPadding: const EdgeInsets.all(20),
        title: Text(
            toDoListController.toDoLists[currentList].list[itemIndex].title),
        children: [
          const Text('Description:'),
          const SizedBox(height: 20),
          Text(
            toDoListController
                .toDoLists[currentList].list[itemIndex].descrition,
          ),
          const SizedBox(height: 20),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Excluir tarefa'),
                      content: const Text(
                          'Tem certeza que deseja excluir essa tarefa?'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancelar')),
                        TextButton(
                            onPressed: () {
                              toDoListController.removeToDo(
                                  currentList, itemIndex);
                              Navigator.pop(context);
                            },
                            child: const Text('Sim'))
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ]);
  }
}
