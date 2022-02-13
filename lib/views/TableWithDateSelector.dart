import 'package:flutter/material.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

class StickyheadersTableWithDateSelector extends StatelessWidget {
  DateTime selectedDate = DateTime.now();
  void Function(DateTime date) dateCallback;
  final Widget Function(int columnIndex) columnsTitleBuilder;
  final Widget Function(int rowIndex) rowsTitleBuilder;
  final Widget Function(int columnIndex, int rowIndex) contentCellBuilder;
  final int columnsLength;
  final int rowsLength;

  StickyheadersTableWithDateSelector({
    required this.columnsTitleBuilder,
    required this.rowsTitleBuilder,
    required this.contentCellBuilder,
    required this.columnsLength,
    required this.rowsLength,
    required this.dateCallback,
    selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return StickyHeadersTable(
      columnsLength: columnsLength,
      rowsLength: rowsLength,
      columnsTitleBuilder: columnsTitleBuilder,
      rowsTitleBuilder: rowsTitleBuilder,
      contentCellBuilder: contentCellBuilder,
      legendCell: Text(""),
    );
  }
}
