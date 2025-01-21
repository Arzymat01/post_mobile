import 'package:flutter/material.dart';
import 'package:post_mobile/src/modules/home/widget/burger_menu.dart';
import 'package:post_mobile/src/modules/home/widget/table.dart';

class CashIncome extends StatefulWidget {
  const CashIncome({Key? key}) : super(key: key);

  @override
  _CashIncomeState createState() => _CashIncomeState();
}

class _CashIncomeState extends State<CashIncome> {
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

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Касса Перевод'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Касса'),
                    items: const [
                      DropdownMenuItem(
                        value: 'Касса сейф',
                        child: Text('Касса сейф'),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Тип оплаты'),
                    items: const [
                      DropdownMenuItem(
                        value: 'Наличка',
                        child: Text('Наличка'),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Сумма'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Валюта'),
                    items: const [
                      DropdownMenuItem(
                        value: 'COM',
                        child: Text('COM'),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Описание',
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () {
                // Logic for saving the input can be added here
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Касса Приход',
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
                ElevatedButton(
                  onPressed: () {
                    _showAddDialog(); // Triggering the AlertDialog
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Border radius
                    ),
                  ),
                  child: const Text(
                    "ДОБАВИТЬ",
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
