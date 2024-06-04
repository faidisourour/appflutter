import 'package:flutter/material.dart';

class BookingFormScreen extends StatefulWidget {
  final String roomName;

  const BookingFormScreen({Key? key, required this.roomName}) : super(key: key);

  @override
  _BookingFormScreenState createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime _startTime = DateTime.now();
  DateTime _endTime = DateTime.now().add(Duration(hours: 1));
  int _capacity = 1;

  Future<void> _selectDateTime(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStart ? _startTime : _endTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(isStart ? _startTime : _endTime),
      );
      if (time != null) {
        setState(() {
          final dateTime = DateTime(
              picked.year, picked.month, picked.day, time.hour, time.minute);
          if (isStart) {
            _startTime = dateTime;
          } else {
            _endTime = dateTime;
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reserve ${widget.roomName}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              ListTile(
                title:
                    Text("Start Time: ${_startTime.toLocal()}".split(' ')[0]),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selectDateTime(context, true),
              ),
              ListTile(
                title: Text("End Time: ${_endTime.toLocal()}".split(' ')[0]),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selectDateTime(context, false),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Capacity'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the capacity';
                  }
                  return null;
                },
                onSaved: (value) {
                  _capacity = int.parse(value!);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final booking = Booking(
                        roomName: widget.roomName,
                        startTime: _startTime,
                        endTime: _endTime,
                        capacity: _capacity,
                      );
                      // Handle booking logic here, e.g., save booking to database
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Reserve'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Booking {
  final String roomName;
  final DateTime startTime;
  final DateTime endTime;
  final int capacity;

  Booking({
    required this.roomName,
    required this.startTime,
    required this.endTime,
    required this.capacity,
  });
}
