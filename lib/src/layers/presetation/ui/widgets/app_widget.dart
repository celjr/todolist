import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/module_to_do_list_controller.dart';
import '../pages/to_do_list_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...toDoListControllerModule,
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ToDo List",
        theme: ThemeData.dark(),
        home: const ToDoListPage(),
      ),
    );
  }
}
