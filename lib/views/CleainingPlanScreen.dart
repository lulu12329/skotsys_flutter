import 'package:flutter/material.dart';
import 'package:kotsys_flutter/models/CleaningPlanData.dart';
import 'package:kotsys_flutter/models/CleaningPlanEntry.dart';
import 'package:kotsys_flutter/models/Room.dart';
import 'package:kotsys_flutter/services/cleaningPlanService.dart';
import 'package:lazy_data_table/lazy_data_table.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

import 'CustomAppBar.dart';
import 'NavigationDrawer.dart';

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
  final ScrollControllers myScrollControllers = ScrollControllers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar.build(_scaffoldKey, "CleaningPlan"),
      drawer: NavigationDrawer(context: context),
      body: _buildStickTable(),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    CleaningPlanData data = await service.getForDate(selectedDate);
    setState(() {
      this.data = data;
    });
  }

  Widget _buildStickTable() {
    return StickyHeadersTable(
      columnsLength: data.rooms.length,
      rowsLength: data.cleaners.length,
      columnsTitleBuilder: (i) => Text(data.rooms[i].roomName),
      rowsTitleBuilder: (i) => Text(data.cleaners[i].fName),
      contentCellBuilder: (i, j) => Text("content cell"),
      legendCell: Text('stickyLegend'),
      //scrollControllers: myScrollControllers,
    );
  }

  Widget _buildLazyTable() {
    return LazyDataTable(
      columns: data.rooms.length,
      rows: data.cleaners.length,
      topHeaderBuilder: (i) => Text(data.rooms[i].roomName),
      leftHeaderBuilder: (i) => Text(data.cleaners[i].fName),
      dataCellBuilder: (i, j) => Text("content cell"),
      topLeftCornerWidget: Text('stickyLegend'),
      tableTheme: LazyDataTableTheme(
        cellColor: Colors.white,
        cornerColor: Colors.white,
      ),
    );
  }

  Widget _buildTable() {
    List<DataColumn> columns = _getColumns(data.rooms);
    List<DataRow> rows = _getRows(data);

    return DataTable(
      columns: columns,
      rows: rows,
    );
  }

  List<DataColumn> _getColumns(List<Room> rooms) {
    List<DataColumn> ret = [DataColumn(label: Text(""))];
    ret.addAll(rooms
        .map((Room room) => DataColumn(
              label: Text(room.roomName),
            ))
        .toList());
    return ret;
  }

  List<DataRow> _getRows(CleaningPlanData data) {
    List<DataRow> ret = [];
    data.cleaners.forEach((cleaner) {
      DataRow row = DataRow(
          cells: [DataCell(Text("${cleaner.fName}\n${cleaner.lName}"))]);
      row.cells.addAll(data.rooms.map(
          (room) => _getCellFor(cleaner.id, room.roomid, data.listPoints)));
      return ret.add(row);
    });
    return ret;
  }

  DataCell _getCellFor(
      int cleanerId, int roomId, List<CleaningPlanEntry> entrys) {
    try {
      CleaningPlanEntry entry = entrys.firstWhere(
          (entry) => entry.roomID == roomId && entry.cleanerID == cleanerId);
      return DataCell(Text(entry.roomID.toString()));
    } on StateError catch (_) {
      return DataCell.empty;
    }
  }
}
