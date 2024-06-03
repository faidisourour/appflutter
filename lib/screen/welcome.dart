import 'package:flutter/material.dart';
import 'package:smart_home_flutter_ui/services/api_service.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key, required APIService apiService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150, // Ajustez la taille du logo selon vos besoins
              height: 150,
              child: Image.asset(
                'assets/images/tim.jpg', // Assurez-vous d'avoir cette image dans votre projet
                fit: BoxFit
                    .cover, // Ajustez le redimensionnement de l'image selon vos besoins
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200, // Ajustez la largeur du bouton selon vos besoins
              height: 50, // Ajustez la hauteur du bouton selon vos besoins
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Login'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200, // Ajustez la largeur du bouton selon vos besoins
              height: 50, // Ajustez la hauteur du bouton selon vos besoins
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 28, 57, 184),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
