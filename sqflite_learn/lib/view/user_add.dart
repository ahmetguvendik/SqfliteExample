import 'package:flutter/material.dart';
import 'package:sqflite_learn/constant/project_text.dart';
import 'package:sqflite_learn/model/user_model.dart';
import 'package:sqflite_learn/viewmodel/user_add_view_model.dart';

class UserAdd extends StatefulWidget {
  const UserAdd({Key? key}) : super(key: key);

  @override
  State<UserAdd> createState() => _UserAddState();
}

class _UserAddState extends UserAddViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            UserNameTextFieldWidget(model: model),
            AgeTextFieldWidget(model: model),
            SaveButton()
          ],
        ),
      ),
    );
  }

  ElevatedButton SaveButton() =>
      ElevatedButton(onPressed: saveModel, child: Text(ProjectText.save));
}

class UserNameTextFieldWidget extends StatelessWidget {
  const UserNameTextFieldWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final UserModel model;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        model.username = value;
      },
    );
  }
}

class AgeTextFieldWidget extends StatelessWidget {
  const AgeTextFieldWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final UserModel model;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        model.age = value;
      },
    );
  }
}

/*
enum modelName{
  age,username
}

extension modelNameExtension on modelName{
  String get ModelName{
    switch(this){
      case modelName.age:
        return "age";
      case modelName.username:
        return "username";
    }
  }
}*/
