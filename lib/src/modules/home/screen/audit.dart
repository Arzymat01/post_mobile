import 'package:flutter/material.dart';
import 'package:post_mobile/src/modules/home/widget/burger_menu.dart';

class Audit extends StatefulWidget {
  const Audit({Key? key}) : super(key: key);

  @override
  _AuditState createState() => _AuditState();
}

class _AuditState extends State<Audit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Ревизия',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: BurgerMenu(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              50.0), // Ensures the button is perfectly circular
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
