import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
          child: Column(
            children: [

              const SizedBox(
                height: 100,
              ),

              Image.asset(
              'assets/images/White-Logo.png',
              width: 200,
            ),

              Text(
                "welcome",
                    style: GoogleFonts.acme(
                      fontSize: 34,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    )
              ),

              Text(
                  "C'est bon de vous revoir",
                  style: GoogleFonts.acme(
                    fontSize: 25,
                    color: Colors.grey,

                  )
              ),

              const SizedBox(
                height: 100,
              ),

              //email input

              //password input


            ],
          ),
          ),
        ),
    );
  }
}
