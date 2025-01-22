import 'package:flutter/material.dart';
import 'package:post_mobile/service/product_service.dart';
import 'package:post_mobile/src/modules/home/widget/burger_menu.dart';
import 'package:post_mobile/src/modules/home/widget/table.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  void _updateCell(int index, String key, String value) async {
    setState(() {
      _rows[index][key] = value;
    });

    if (key == "Наименование" && value.isNotEmpty) {
      try {
        final products = await ApiService.searchProducts(value);

        // Лог: API Жоопту көрүү
        print("API Жооп: $products");

        if (products.isNotEmpty) {
          final product = products.first;

          setState(() {
            // Туура маалыматтарды орнотуу
            _rows[index]["Остаток на складе"] = product.code.toString();
            _rows[index]["Количество"] = product.remains.toString();
            _rows[index]["Цена"] = product.price.toString();
            _rows[index]["Сумма"] =
                (product.remains * product.price).toStringAsFixed(2);
          });
        } else {
          setState(() {
            _rows[index]["Остаток на складе"] = "0";
            _rows[index]["Количество"] = "0";
            _rows[index]["Цена"] = "0";
            _rows[index]["Сумма"] = "0.00";
          });
        }
      } catch (e) {
        print("Error fetching product: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Ката кетти: $e")),
        );
      }
    }

    if (key == "Количество" || key == "Цена") {
      final quantity = double.tryParse(_rows[index]["Количество"]) ?? 0.0;
      final price = double.tryParse(_rows[index]["Цена"]) ?? 0.0;

      setState(() {
        _rows[index]["Сумма"] = (quantity * price).toStringAsFixed(2);
      });
    }

    if (index == _rows.length - 1 && _isRowFilled(_rows[index])) {
      setState(() {
        _rows.add({
          "Наименование": "",
          "Остаток на складе": "",
          "Количество": "",
          "Цена": "",
          "Сумма": "",
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Главная',
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
                      borderRadius: BorderRadius.circular(10),
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
                    print(_rows);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
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
