import 'package:flutter/material.dart';
import 'package:post_mobile/src/modules/home/widget/burger_menu.dart';
import 'package:post_mobile/src/modules/home/widget/table.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({Key? key}) : super(key: key);

  @override
  _PurchaseScreenState createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  final List<Map<String, dynamic>> _rows = [
    {
      "Наименование": "",
      "Остаток на складе": "",
      "Количество": "",
      "Цена": "",
      "Сумма": "",
    }
  ];

  bool _isRowFilled(Map<String, dynamic> row) {
    return row.values
        .every((value) => value != null && value.toString().isNotEmpty);
  }

  void _updateCell(int index, String key, String value) {
    setState(() {
      _rows[index][key] = value;

      if (key == "Количество" || key == "Цена") {
        final quantity = double.tryParse(_rows[index]["Количество"]) ?? 0.0;
        final price = double.tryParse(_rows[index]["Цена"]) ?? 0.0;
        _rows[index]["Сумма"] = (quantity * price).toStringAsFixed(2);
      }

      if (index == _rows.length - 1 && _isRowFilled(_rows[index])) {
        _rows.add({
          "Наименование": "",
          "Остаток на складе": "",
          "Количество": "",
          "Цена": "",
          "Сумма": "",
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Покупка',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.red),
      ),
      body: Column(
        children: [
          CustomDataTable(
            rows: _rows,
            onCellUpdate: _updateCell,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print(_rows);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Border radius
                    ),
                  ),
                  child: const Text(
                    "СОХРАНИТЬ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: BurgerMenu(),
    );
  }
}
