import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/src/layers/presetation/controllers/to_do_list_controller.dart';

import '../../../domain/entities/to_do_item_entity.dart';

class CustomDialogWidget extends StatelessWidget {
  final String title;
  final int currentList;
  const CustomDialogWidget(
      {Key? key, required this.title, required this.currentList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerTextFieldTitle = TextEditingController();
    TextEditingController controllerTextFieldDescription =
        TextEditingController();
    final toDoListController = context.watch<ToDoListController>();
    print(currentList.toString());
    return SimpleDialog(
      elevation: 5,
      contentPadding: const EdgeInsets.all(20),
      title: Text(title),
      children: [
        TextField(
          controller: controllerTextFieldTitle,
          decoration: const InputDecoration(
            label: Text('Titulo da tarefa'),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: controllerTextFieldDescription,
          maxLines: 5,
          decoration: const InputDecoration(
            label: Text('Descrição'),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar')),
            TextButton(
                onPressed: () {
                  toDoListController.addToDo(
                      ToDoItemEntity(
                          title: controllerTextFieldTitle.text,
                          descrition: controllerTextFieldDescription.text),
                      currentList);
                  Navigator.pop(context);
                },
                child: const Text('Adicionar'))
          ],
        ),
      ],
    );
  }
}
