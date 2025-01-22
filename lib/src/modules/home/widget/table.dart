import 'package:flutter/material.dart';

class CustomDataTable extends StatelessWidget {
  final List<Map<String, dynamic>> rows;
  final Function(int index, String key, String value) onCellUpdate;

  const CustomDataTable({
    Key? key,
    required this.rows,
    required this.onCellUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            border: TableBorder.all(
              color: Colors.black,
              width: 1,
            ),
            columns: const [
              DataColumn(label: Text('Наименование')),
              DataColumn(label: Text('Остаток на складе')),
              DataColumn(label: Text('Количество')),
              DataColumn(label: Text('Цена')),
              DataColumn(label: Text('Сумма')),
            ],
            rows: List.generate(rows.length, (index) {
              final row = rows[index];
              return DataRow(
                cells: [
                  DataCell(
                    TextFormField(
                      initialValue: row["Наименование"],
                      onChanged: (value) =>
                          onCellUpdate(index, "Наименование", value),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(row["Остаток на складе"] ?? ""),
                  ),
                  DataCell(
                    Text(row["Количество"] ?? ""), // remains
                  ),
                  DataCell(
                    Text(row["Цена"] ?? ""), // price
                  ),
                  DataCell(Text(row["Сумма"] ?? "")),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
