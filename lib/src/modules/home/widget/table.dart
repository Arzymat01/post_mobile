import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                    TextFormField(
                      initialValue: row["Остаток на складе"],
                      onChanged: (value) =>
                          onCellUpdate(index, "Остаток на складе", value),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      initialValue: row["Количество"],
                      onChanged: (value) =>
                          onCellUpdate(index, "Количество", value),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      initialValue: row["Цена"],
                      onChanged: (value) => onCellUpdate(index, "Цена", value),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d*'),
                        )
                      ],
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
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
