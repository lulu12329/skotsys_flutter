import 'Cleaner.dart';

class CleaningPlanData{
  List<Cleaner> cleaners;

  CleaningPlanData(this.cleaners);
}

class Room{
  int number;
  String state;

  Room(this.number,this.state);
}