import 'package:flutter/material.dart';
import 'package:sqflite_learn/model/user_model.dart';
import 'package:sqflite_learn/view/user_add.dart';

import '../service/user_database_provider.dart';

abstract class UserAddViewModel extends State<UserAdd>{
  UserModel model = UserModel();
  UserDatabaseProvider userDatabaseProvider = UserDatabaseProvider();

  Future<void> saveModel() async{
    final result =  await userDatabaseProvider.insert(model);

  }
@override
  void initState() {
    super.initState();
  }
}