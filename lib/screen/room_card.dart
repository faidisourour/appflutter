import 'package:flutter/material.dart';
import 'package:smart_home_flutter_ui/model/smart_home_model.dart';
import 'package:smart_home_flutter_ui/screen/room_control_screen.dart';
import 'package:smart_home_flutter_ui/screen/widgets/booking_form_screen.dart';
import '../constants/app_colors.dart';
//import 'booking_form_screen.dart'; // Ajoutez l'importation de BookingFormScreen

class RoomCard extends StatelessWidget {
  const RoomCard({super.key, required this.roomData});
  final SmartHomeModel roomData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RoomControlScreen(roomData: roomData)));
      },
      child: Container(
        width: size.width * 0.35,
        height: size.height * 0.5,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.fgColor,
          borderRadius: BorderRadius.circular(size.width * 0.07),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(roomData.roomImage),
            colorFilter: ColorFilter.mode(
                AppColor.black.withOpacity(0.2), BlendMode.darken),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  roomData.roomName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              roomData.isOccupied ? 'Occupied' : 'Free',
              style: TextStyle(
                color: roomData.isOccupied ? Colors.red : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: roomData.isOccupied
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BookingFormScreen(roomName: roomData.roomName),
                        ),
                      );
                    },
              child: Text('Reserve'),
            ),
          ],
        ),
      ),
    );
  }
}
