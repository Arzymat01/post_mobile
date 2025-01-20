import 'package:flutter/material.dart';
import 'package:post_mobile/src/modules/home/widget/burger_menu.dart';

class CashExpense extends StatefulWidget {
  const CashExpense({Key? key}) : super(key: key);

  @override
  _CashExpenseState createState() => _CashExpenseState();
}

class _CashExpenseState extends State<CashExpense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Касса Расход',
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
