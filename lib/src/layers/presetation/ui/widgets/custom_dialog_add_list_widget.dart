import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/to_do_list_entity.dart';
import '../../controllers/to_do_list_controller.dart';

class CustomDialogAddListWidget extends StatelessWidget {
  const CustomDialogAddListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerTextFieldTitle = TextEditingController();
    final toDoListController = context.watch<ToDoListController>();
    return SimpleDialog(
      elevation: 5,
      contentPadding: const EdgeInsets.all(20),
      title: const Text('Adicionar lista'),
      children: [
        TextField(
          controller: controllerTextFieldTitle,
          decoration: const InputDecoration(
            label: Text('Nome da lista'),
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
                onPressed: () async {
                  if (await toDoListController.saveToDoList(ToDoListEntity(
                    name: controllerTextFieldTitle.text,
                  ))) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Lista salva com sucesso')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Lista não foi salva')));
                  }
                  Navigator.pop(context);
                },
                child: const Text('Adicionar'))
          ],
        ),
      ],
    );
  }
}
