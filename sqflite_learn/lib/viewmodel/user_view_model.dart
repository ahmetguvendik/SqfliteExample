import 'package:flutter/material.dart';
import 'package:sqflite_learn/service/user_database_provider.dart';
import 'package:sqflite_learn/view/user_view.dart';

import '../model/user_model.dart';

abstract class UserViewModel extends State<UserView> {
  UserDatabaseProvider? userDatabaseProvider;
  List<UserModel> model = [];
  UserModel? userModel;

  Future getUserList() async {
    print(model);
    model = await userDatabaseProvider!.getUser();
    setState(() {

    });
  }

  void getUser() async{
    await getUserList();
  }

  Future deleteUser(int id) async{
     await userDatabaseProvider!.delete(id);
     setState(() {

     });
  }

  @override
  void initState() {
    super.initState();
    userDatabaseProvider = UserDatabaseProvider();
    userDatabaseProvider!.open();
  }
}