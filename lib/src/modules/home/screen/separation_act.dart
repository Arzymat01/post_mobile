import 'package:flutter/material.dart';
import 'package:post_mobile/src/modules/home/widget/burger_menu.dart';

class SeparationAct extends StatefulWidget {
  const SeparationAct({Key? key}) : super(key: key);

  @override
  _SeparationActState createState() => _SeparationActState();
}

class _SeparationActState extends State<SeparationAct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Акт распеделки',
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
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              50.0), // Ensures the button is perfectly circular
        ),
      ),
    );
  }
}
