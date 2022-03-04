import 'package:flutter/material.dart';
import 'package:kotsys_flutter/models/CleaningPlanData.dart';
import 'package:kotsys_flutter/models/CleaningPlanEntry.dart';
import 'package:kotsys_flutter/services/cleaningPlanService.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

import 'CustomAppBar.dart';
import 'NavigationDrawer.dart';
import 'TableWithDateSelector.dart';

class CleaningPlanScreen extends StatefulWidget {
  CleaningPlanScreen({Key? key}) : super(key: key);

  @override
  _CleaningPlandState createState() => _CleaningPlandState();
}

class _CleaningPlandState extends State<CleaningPlanScreen> {
  CleaningPlanService service = new CleaningPlanService();
  CleaningPlanData data = new CleaningPlanData([], [], []);
  DateTime selectedDate = DateTime.now();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  StickyHeadersTableWithDateSelector table = StickyHeadersTableWithDateSelector(
    columnsLength: 0,
    rowsLength: 0,
    selectedDate: DateTime.now(),
    columnsTitleBuilder: (i) => Text(""),
    contentCellBuilder: (i, j) => Text(""),
    rowsTitleBuilder: (i) => Text(""),
    dateCallback: (t) => {},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar.build(_scaffoldKey, "CleaningPlan"),
      drawer: NavigationDrawer(context: context),
      body: table,
    );
  }

  newDate(dateTime) {
    setState(() {
      selectedDate = dateTime;
    });
    _updateTable();
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    CleaningPlanData data = await service.getForDate(selectedDate);
    this.data = data;
    _updateTable();
  }

  TableCell _getCellFor(
      int cleanerId, int roomId, List<CleaningPlanEntry> entrys) {
    try {
      CleaningPlanEntry entry = entrys.firstWhere(
          (entry) => entry.roomID == roomId && entry.cleanerID == cleanerId);
      return TableCell.content(entry.roomID.toString());
    } on StateError catch (_) {
      return TableCell.content("");
    }
  }

  void _updateTable() {
    setState(() {
      this.table = StickyHeadersTableWithDateSelector(
        dateCallback: newDate,
        selectedDate: selectedDate,
        columnsLength: data.rooms.length,
        rowsLength: data.cleaners.length,
        columnsTitleBuilder: (i) => TableCell.stickyRow(data.rooms[i].roomName),
        rowsTitleBuilder: (i) => TableCell.stickyColumn(
            "${data.cleaners[i].fName}/n${data.cleaners[i].lName}"),
        contentCellBuilder: (i, j) => TableCell.content("content cell"),
      );
    });
  }
}

class TableCell extends StatelessWidget {
  final CellDimensions cellDimensions;

  final String text;
  final Function()? onTap;

  final double? cellWidth;
  final double? cellHeight;

  final Color colorBg;
  final Color _colorHorizontalBorder;
  final Color _colorVerticalBorder;

  final TextAlign _textAlign;
  final EdgeInsets _padding;

  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cellWidth,
        height: cellHeight,
        padding: _padding,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: Text(
                  text,
                  style: textStyle,
                  maxLines: 2,
                  textAlign: _textAlign,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 1.1,
              color: _colorVerticalBorder,
            ),
          ],
        ),
        decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: _colorHorizontalBorder),
              right: BorderSide(color: _colorHorizontalBorder),
            ),
            color: colorBg),
      ),
    );
  }

  TableCell.content(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = Colors.white,
    this.onTap,
  })  : cellWidth = cellDimensions.contentCellWidth,
        cellHeight = cellDimensions.contentCellHeight,
        _colorHorizontalBorder = Colors.amber,
        _colorVerticalBorder = Colors.black38,
        _textAlign = TextAlign.center,
        _padding = EdgeInsets.zero;

  TableCell.legend(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = Colors.amber,
    this.onTap,
  })  : cellWidth = cellDimensions.stickyLegendWidth,
        cellHeight = cellDimensions.stickyLegendHeight,
        _colorHorizontalBorder = Colors.white,
        _colorVerticalBorder = Colors.amber,
        _textAlign = TextAlign.start,
        _padding = EdgeInsets.only(left: 24.0);

  TableCell.stickyRow(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = Colors.amber,
    this.onTap,
  })  : cellWidth = cellDimensions.contentCellWidth,
        cellHeight = cellDimensions.stickyLegendHeight,
        _colorHorizontalBorder = Colors.white,
        _colorVerticalBorder = Colors.amber,
        _textAlign = TextAlign.center,
        _padding = EdgeInsets.zero;

  TableCell.stickyColumn(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = Colors.white,
    this.onTap,
  })  : cellWidth = cellDimensions.stickyLegendWidth,
        cellHeight = cellDimensions.contentCellHeight,
        _colorHorizontalBorder = Colors.amber,
        _colorVerticalBorder = Colors.black38,
        _textAlign = TextAlign.start,
        _padding = EdgeInsets.only(left: 24.0);
}
