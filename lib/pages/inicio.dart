import 'package:cobras_e_escadas/pages/game.dart';
import 'package:flutter/material.dart';

class InicioPage extends StatefulWidget {
  InicioPage({Key? key}) : super(key: key);

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xffffe9c4)),
        child: Center(
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://cdn.dribbble.com/users/10575911/screenshots/17416622/media/78a0fb70893341b6e9fd5d84a546fd65.gif',
                height: 250,
              ),
              Image.network(
                  'https://cdn.dribbble.com/users/10575911/screenshots/17416431/media/adff9c096b4e0af93978c230e9775192.gif'),
              SizedBox(height: 40),
              MaterialButton(
                color: Color(0xffab72db),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) {
                    return GamePage();
                  }), (route) => false);
                },
                child: SizedBox(
                  height: 60,
                  width: 300,
                  child: Center(
                    child: Text(
                      'JOGAR',
                      style: TextStyle(
                          letterSpacing: 5,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Heebo',
                          fontSize: 40),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
