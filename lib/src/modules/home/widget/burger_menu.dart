import 'package:flutter/material.dart';
import 'package:post_mobile/src/modules/home/home.dart';
import 'package:post_mobile/src/modules/home/screen/audit.dart';
import 'package:post_mobile/src/modules/home/screen/cash_expense.dart';
import 'package:post_mobile/src/modules/home/screen/cash_income.dart';
import 'package:post_mobile/src/modules/home/screen/purchase.dart';
import 'package:post_mobile/src/modules/home/screen/resorting.dart';
import 'package:post_mobile/src/modules/home/screen/separation_act.dart';
import 'package:post_mobile/src/modules/home/screen/transfer.dart';
import 'package:post_mobile/src/modules/home/screen/under_report.dart';
import 'package:post_mobile/src/modules/home/screen/write_of.dart';

class BurgerMenu extends StatelessWidget {
  const BurgerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('User'),
            accountEmail: Text('user@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 50, color: Colors.blue),
            ),
            decoration: BoxDecoration(
              color: Colors.black,

              // ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Главная'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.web),
            title: Text('Web-версия'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Покупка'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PurchaseScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Касса Расход'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CashExpense(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('Касса Приход'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CashIncome(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Под Отчет'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UnderReport(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.check_circle),
            title: Text('Ревизия'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Audit(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.remove_circle),
            title: Text('Списание'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WriteOf(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.move_to_inbox),
            title: Text('Перемещение'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Transfer(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Акт расделки'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeparationAct(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Пресорт'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Resorting(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
