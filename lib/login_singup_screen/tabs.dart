import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_bt/models/user.dart';
import 'package:prueba_tecnica_bt/tabs/list.dart';
import 'package:prueba_tecnica_bt/tabs/precamera.dart';

class Tabs extends StatefulWidget {
  Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  late TabController controller;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedUser = UserModel();

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedUser = UserModel.fromMap(value.data());
      setState(() {});
    });

    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab ${controller.index + 1}'),
        backgroundColor: Colors.blueAccent,
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(
              text: 'Camera',
              icon: Icon(Icons.camera),
            ),
            Tab(text: 'List', icon: Icon(Icons.list)),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [preCamera(), ListTabs()],
      ),
    );
  }
}
