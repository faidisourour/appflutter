import 'package:flutter/material.dart';

class SmartHomeModel {
  String roomName;
  String roomImage;
  String roomTemperature;
  int userAccess;
  bool roomStatus;
  List<DeviceInRoom>? devices;
  Sensor? sensor;

  SmartHomeModel({
    required this.roomName,
    required this.roomImage,
    required this.roomTemperature,
    required this.userAccess,
    this.roomStatus = false,
    this.devices,
    this.sensor,
  });
}

class Sensor {
  String temperatureSensor;
  String humiditySensor;
  String gasSensor;
  bool presenceDetector;

  Sensor({
    required this.temperatureSensor,
    required this.humiditySensor,
    required this.gasSensor,
    required this.presenceDetector,
  });
}

class DeviceInRoom {
  String deviceName;
  IconData iconOn;
  IconData iconOff;
  bool deviceStatus;

  DeviceInRoom({
    required this.deviceName,
    required this.iconOn,
    required this.iconOff,
    this.deviceStatus = false,
  });
}

List<SmartHomeModel> smartHomeData = [
  SmartHomeModel(
    roomName: "Public Room",
    roomImage: "assets/images/salle1.png",
    roomTemperature: "25°",
    userAccess: 4,
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: "WiFi",
        iconOn: Icons.wifi,
        iconOff: Icons.wifi_off,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Light",
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_outline_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Fan",
        iconOn: Icons.air,
        iconOff: Icons.mode_fan_off_outlined,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "TV",
        iconOn: Icons.tv,
        iconOff: Icons.tv_off,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "AC",
        iconOn: Icons.ac_unit,
        iconOff: Icons.thermostat,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Home Theater",
        iconOn: Icons.speaker_outlined,
        iconOff: Icons.volume_off_outlined,
        deviceStatus: false,
      ),
    ],
    sensor: Sensor(
      temperatureSensor: "25°C",
      humiditySensor: "60%",
      gasSensor: "Safe",
      presenceDetector: true,
    ),
  ),
  SmartHomeModel(
    roomName: "Double Room",
    roomImage: "assets/images/salle2.png",
    roomTemperature: "25°",
    userAccess: 1,
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: "WiFi",
        iconOn: Icons.wifi,
        iconOff: Icons.wifi_off,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Light",
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_outline_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Fan",
        iconOn: Icons.air,
        iconOff: Icons.mode_fan_off_outlined,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "TV",
        iconOn: Icons.tv,
        iconOff: Icons.tv_off,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "Home Theater",
        iconOn: Icons.speaker_outlined,
        iconOff: Icons.volume_off_outlined,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "AC",
        iconOn: Icons.ac_unit,
        iconOff: Icons.thermostat,
        deviceStatus: true,
      ),
    ],
  ),
  SmartHomeModel(
    roomName: "Private Room",
    roomImage: "assets/images/salle3.png",
    roomTemperature: "25°",
    userAccess: 4,
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: "WiFi",
        iconOn: Icons.wifi,
        iconOff: Icons.wifi_off,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Light",
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_outline_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Fan",
        iconOn: Icons.air,
        iconOff: Icons.mode_fan_off_outlined,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "AC",
        iconOn: Icons.ac_unit,
        iconOff: Icons.thermostat,
        deviceStatus: true,
      ),
    ],
  ),
  SmartHomeModel(
    roomName: "Server Room",
    roomImage: "assets/images/kitchen_room.jpg",
    roomTemperature: "25°",
    userAccess: 2,
    roomStatus: true,
    devices: [
      DeviceInRoom(
        deviceName: "WiFi",
        iconOn: Icons.wifi,
        iconOff: Icons.wifi_off,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Light",
        iconOn: Icons.lightbulb_rounded,
        iconOff: Icons.lightbulb_outline_rounded,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Chimney",
        iconOn: Icons.air,
        iconOff: Icons.power_off_outlined,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Fridge",
        iconOn: Icons.kitchen,
        iconOff: Icons.power_off_outlined,
        deviceStatus: true,
      ),
      DeviceInRoom(
        deviceName: "Microwave",
        iconOn: Icons.microwave,
        iconOff: Icons.power_off_outlined,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "Grinder",
        iconOn: Icons.power,
        iconOff: Icons.power_off_outlined,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "Induction",
        iconOn: Icons.power,
        iconOff: Icons.power_off_outlined,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "Coffee Maker",
        iconOn: Icons.coffee_maker_outlined,
        iconOff: Icons.power_off_outlined,
        deviceStatus: false,
      ),
      DeviceInRoom(
        deviceName: "AC",
        iconOn: Icons.ac_unit,
        iconOff: Icons.thermostat,
        deviceStatus: true,
      ),
    ],
  ),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Smart Home')),
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: smartHomeData.length,
          itemBuilder: (context, index) {
            return RoomWidget(room: smartHomeData[index]);
          },
        ),
      ),
    );
  }
}

class RoomWidget extends StatelessWidget {
  final SmartHomeModel room;

  const RoomWidget({required this.room});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              room.roomImage,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  room.roomName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  room.userAccess > 2 ? 'Public' : 'Private',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                if (room.sensor != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    "Temperature: ${room.sensor!.temperatureSensor}",
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    "Humidity: ${room.sensor!.humiditySensor}",
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    "Gas: ${room.sensor!.gasSensor}",
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    "Presence: ${room.sensor!.presenceDetector ? "Detected" : "Not Detected"}",
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
