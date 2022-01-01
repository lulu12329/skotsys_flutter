import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_timetable_view/flutter_timetable_view.dart';
import 'package:kotsys_flutter/models/user.dart';
import 'package:kotsys_flutter/services/backend.dart';

import 'CustomAppBar.dart';
import 'NavigationDrawer.dart';

class CleaningPlanScreen extends StatefulWidget {
  CleaningPlanScreen({Key? key}) : super(key: key);

  @override
  _CleaningPlandState createState() => _CleaningPlandState();
}

class _CleaningPlandState extends State<CleaningPlanScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<User> cleaners = new List.empty();
  List<LaneEvents> laneEvents = new List.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar.build(_scaffoldKey, "CleaningPlan"),
      drawer: NavigationDrawer(context: context),
      body: TimetableView(
        laneEventsList: laneEvents,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    /* HttpClientHelper().getCleaningPlanData().then((data) {
      data.cleaners.forEach((cleaner) {
        List<TableEvent> tableEvents = new List.empty();
        cleaner.roomsToClean.forEach((roomToClean) {
          tableEvents.add(
            TableEvent(
              title: roomToClean.state,
              start: TableEventTime(
                  hour: roomToClean.start.hour,
                  minute: roomToClean.start.minute),
              end: TableEventTime(
                  hour: roomToClean.end.hour, minute: roomToClean.end.minute),
            ),
          );
        });
        laneEvents.add(
            LaneEvents(lane: Lane(name: cleaner.name), events: tableEvents));
      });
    }); */
  }
}
