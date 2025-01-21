import 'package:flutter/material.dart';
import 'package:post_mobile/src/modules/home/widget/burger_menu.dart';
import 'package:post_mobile/src/modules/home/widget/table.dart';

class Transfer extends StatefulWidget {
  const Transfer({Key? key}) : super(key: key);

  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
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
          title: const Text("Касса Перевод"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: "Касса"),
                  items: ["Касса сейф", "Касса 2"]
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                  onChanged: (value) {},
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: "Тип оплаты"),
                  items: ["Наличка", "Карта"]
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                  onChanged: (value) {},
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: "Сумма"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(labelText: "Валюта"),
                        items: ["COM", "USD", "EUR"]
                            .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                ))
                            .toList(),
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      labelText: "Категория расхода или прихода"),
                  items: ["Категория 1", "Категория 2"]
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                  onChanged: (value) {},
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Описание"),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("ОК"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Закрыть"),
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
          'Под Отчет',
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
                  onPressed: _showAddDialog,
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
