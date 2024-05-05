import 'package:flutter/material.dart';
import 'package:time_scheduler_table/time_scheduler_table.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: TimeSchedulerTable(
        cellHeight: 64,
        cellWidth: 72,
        columnTitles: const ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"],
        currentColumnTitleIndex: DateTime.now().weekday - 1,
        rowTitles: const [
          '08:00 - 09:00',
          '09:00 - 10:00',
          '10:00 - 11:00',
          '11:00 - 12:00',
          '12:00 - 13:00',
          '13:00 - 14:00',
          '14:00 - 15:00',
          '15:00 - 16:00',
          '16:00 - 17:00',
          '17:00 - 18:00',
          '18:00 - 19:00',
          '19:00 - 20:00',
          '20:00 - 21:00',
        ],
        title: "Kid Schedule",
        titleStyle: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
        eventTitleStyle: const TextStyle(color: Colors.white, fontSize: 8),
        isBack: false,
        eventList: eventList,
        eventAlert: EventAlert(
          alertTextController: textController,
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          addAlertTitle: "Add Event",
          editAlertTitle: "Edit",
          addButtonTitle: "ADD",
          deleteButtonTitle: "DELETE",
          updateButtonTitle: "UPDATE",
          hintText: "Event Name",
          textFieldEmptyValidateMessage: "Cannot be empty!",
          addOnPressed: (event) {},
          updateOnPressed: (event) {},
          deleteOnPressed: (event) {},
        ),
      )),
    );
  }
}

List<EventModel> eventList = [
  EventModel(
    title: "Math",
    columnIndex: 0,
    rowIndex: 2,
    color: Colors.orange,
  ),
  EventModel(
    title: "histoire",
    columnIndex: 1,
    rowIndex: 5,
    color: Colors.pink,
  ),
  EventModel(
    title: "Musique",
    columnIndex: 4,
    rowIndex: 8,
    color: Colors.green,
  ),
  EventModel(
    title: "Arabe",
    columnIndex: 3,
    rowIndex: 1,
    color: Colors.deepPurple,
  ),
  EventModel(
    title: "Sport",
    columnIndex: 2,
    rowIndex: 9,
    color: Colors.blue,
  )
];
