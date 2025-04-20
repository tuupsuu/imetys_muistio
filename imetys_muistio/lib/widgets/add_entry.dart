import 'package:flutter/material.dart';
import 'package:imetys_muistio/views/milk_page.dart';
import 'package:intl/intl.dart';

class AddEntry extends StatefulWidget {
  const AddEntry({super.key});

  @override
  State<AddEntry> createState() => _AddEntryState();
}

class _AddEntryState extends State<AddEntry> {
  DateTime selectedDate = DateTime.now();
  DateFormat f = DateFormat('dd/MM HH:mm');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Mitä lisätään?"),
      content: Column(
        children: [
          Row(
            children: [
              Text('Aika: ${f.format(selectedDate)}'),
              Spacer(),
              IconButton(
                onPressed: () => _selectDateTime(context),
                icon: Icon(Icons.edit),
              ),
            ],
          ),
          Row(
            children: [
              Text('Maito'),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MilkPage();
                      },
                    ),
                  );
                },
                color: Colors.green,
                icon: Icon(Icons.add),
              ),
            ],
          ),
          Row(
            children: [
              Text('Pumppaus'),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MilkPage()),
                  );
                },
                color: Colors.green,
                icon: Icon(Icons.add),
              ),
            ],
          ),
          Row(
            children: [
              Text('Uloste'),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MilkPage()),
                  );
                },
                color: Colors.green,
                icon: Icon(Icons.add),
              ),
            ],
          ),
          Row(
            children: [
              Text('Puhdistus'),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MilkPage()),
                  );
                },
                color: Colors.green,
                icon: Icon(Icons.add),
              ),
            ],
          ),
          Row(
            children: [
              Text('Muu'),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MilkPage()),
                  );
                },
                color: Colors.green,
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (date == null) return;

    return Future.microtask(() async {
      if (!context.mounted) return;
      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(DateTime.now()),
      );

      if (time == null) return;

      setState(() {
        selectedDate = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
      });
    });
  }
}
