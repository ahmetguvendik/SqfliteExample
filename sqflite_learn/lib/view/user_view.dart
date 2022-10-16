import 'package:flutter/material.dart';
import 'package:sqflite_learn/constant/project_text.dart';
import 'package:sqflite_learn/view/user_add.dart';
import 'package:sqflite_learn/viewmodel/user_view_model.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends UserViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: AddFloatingActionButton(context),
      body: Column(
        children: [GetUserButton(), Expanded(child: buildListView())],
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
        itemCount: model.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(model[index].username.toString()),
            subtitle: Text(model[index].age.toString()),
            onTap: () async {
              await deleteUser(model[index].id ?? 0);
            },
          );
        });
  }

  FloatingActionButton AddFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => UserAdd()));
        },
        child: Text(ProjectText.add));
  }

  ElevatedButton GetUserButton() {
    return ElevatedButton(onPressed: getUser, child: Text(ProjectText.get));
  }
}
