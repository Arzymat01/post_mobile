import 'package:flutter/material.dart';
import 'package:post_mobile/src/modules/home/widget/burger_menu.dart';

class CashIncome extends StatefulWidget {
  const CashIncome({Key? key}) : super(key: key);

  @override
  _CashIncomeState createState() => _CashIncomeState();
}

class _CashIncomeState extends State<CashIncome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Касса Приход',
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
