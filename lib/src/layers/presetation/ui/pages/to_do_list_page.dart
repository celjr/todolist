import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/src/layers/presetation/controllers/to_do_list_controller.dart';
import 'package:todolist/src/layers/presetation/ui/components/todo_list_component.dart';
import 'package:todolist/src/layers/presetation/ui/widgets/custom_dialog_add_list_widget.dart';
import 'package:todolist/src/layers/presetation/ui/widgets/custom_dialog_widget.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  late ToDoListController toDoListController;
  final PageController pageController = PageController();
  @override
  void initState() {
    super.initState();
    toDoListController = context.read();
    toDoListController.getAllToDoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Para Fazer'),
          actions: [
            TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const CustomDialogAddListWidget();
                      });
                },
                child: const Text('Adicionar lista')),
            Consumer<ToDoListController>(builder: (context, listController, _) {
              return IconButton(
                  onPressed: toDoListController.toDoLists.isNotEmpty
                      ? () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Excluir Lista'),
                                  content: const Text(
                                      'Tem certeza que deseja excluir essa lista?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Cancelar')),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          toDoListController.removeList(
                                              toDoListController.toDoLists[
                                                  pageController.page!
                                                      .round()]);
                                        },
                                        child: const Text('Sim'))
                                  ],
                                );
                              });
                        }
                      : null,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ));
            })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 60),
          child: Consumer<ToDoListController>(
              builder: (context, listController, _) {
            return listController.toDoLists.isNotEmpty
                ? PageView(
                    controller: pageController,
                    children: [
                      for (int i = 0; i < listController.toDoLists.length; i++)
                        ToDoListComponent(
                          listController: listController,
                          currentList: i,
                        )
                    ],
                  )
                : const Center(
                    child: Text(
                    'Sem lista de tarefas no momento!',
                    style: TextStyle(fontSize: 20),
                  ));
          }),
        ),
        floatingActionButton: Consumer<ToDoListController>(
          builder: (context, listController, _) {
            return FloatingActionButton(
              onPressed: toDoListController.toDoLists.isNotEmpty
                  ? () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CustomDialogWidget(
                              title: 'Adicionar Tarefa',
                              currentList: pageController.page!.round(),
                            );
                          });
                    }
                  : () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Adicione uma lista primeiro!')));
                    },
              child: const Icon(Icons.add),
            );
          },
        ));
  }
}
