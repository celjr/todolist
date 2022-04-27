import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/src/layers/presetation/controllers/to_do_list_controller.dart';

import 'custom_dialog_details_widget.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget(
      {Key? key, required this.itemIndex, required this.currentList})
      : super(key: key);
  final int itemIndex;
  final int currentList;

  @override
  Widget build(BuildContext context) {
    final toDoListController = context.watch<ToDoListController>();
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return CustomDialogDetailsWidget(
              itemIndex: itemIndex,
              currentList: currentList,
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 70,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: toDoListController
                        .toDoLists[currentList].list[itemIndex].isComplete
                    ? Colors.green
                    : Colors.white,
                style: BorderStyle.solid)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(toDoListController.toDoLists[currentList].list[itemIndex].title),
          Checkbox(
              value: toDoListController
                  .toDoLists[currentList].list[itemIndex].isCompleted,
              onChanged: (value) {
                toDoListController.completeToDo(currentList, itemIndex);
              })
        ]),
      ),
    );
  }
}
