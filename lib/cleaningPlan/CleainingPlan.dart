import 'package:flutter/material.dart';
import 'package:flutter_timetable_view/flutter_timetable_view.dart';
import 'package:kotsys_flutter/NavigationDrawer.dart';
import 'package:kotsys_flutter/services/backend.dart';

import '../CustomAppBar.dart';
import '../User.dart';
import 'Cleaner.dart';

class CleaningPlan extends StatefulWidget {
  CleaningPlan({Key? key}) : super(key: key);

  @override
  _CleaningPlandState createState() => _CleaningPlandState();
}

class _CleaningPlandState extends State<CleaningPlan> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Cleaner> cleaners = new List.empty();
  List<LaneEvents> laneEvents = new List.empty();

  @override
  Widget build(BuildContext context) {
    User user = User();
    user.toJson();

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

    HttpClientHelper().getCleaningPlanData().then((data) {
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
    });
  }
}
