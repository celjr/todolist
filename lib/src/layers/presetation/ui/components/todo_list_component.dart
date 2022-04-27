import 'package:flutter/material.dart';
import 'package:todolist/src/layers/presetation/controllers/to_do_list_controller.dart';
import 'package:todolist/src/layers/presetation/ui/widgets/custom_card_widget.dart';

class ToDoListComponent extends StatelessWidget {
  final ToDoListController listController;
  final int currentList;
  const ToDoListComponent(
      {Key? key, required this.listController, required this.currentList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        flex: 2,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black,
                  blurRadius: 0.5,
                  spreadRadius: 0.5,
                  offset: Offset(0, 2)),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                listController.toDoLists[currentList].name,
                style: const TextStyle(fontSize: 26, color: Colors.black),
              ),
              Text(
                '${listController.toDoLists[currentList].list.isNotEmpty ? listController.toDoLists[currentList].completedPerCent().toStringAsFixed(1) : 0}%',
                style: const TextStyle(fontSize: 26, color: Colors.black),
              )
            ],
          ),
        ),
      ),
      Expanded(
        flex: 10,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: listController.toDoLists[currentList].list.length,
          itemBuilder: (context, index) {
            return CustomCardWidget(
              itemIndex: index,
              currentList: currentList,
            );
          },
        ),
      ),
    ]);
  }
}
