import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rsf/authentication/login_screen.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../widgets/input_text_widget.dart';


class RegistrationScreen extends StatefulWidget {
  //const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}



class _RegistrationScreenState extends State<RegistrationScreen> {

  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool showProgressBar = false;



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
                'assets/images/RSF.png',
                width: 200,
              ),

              Text(
                  "Bonne arrivee",
                  style: GoogleFonts.acme(
                    fontSize: 34,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  )
              ),

              Text(
                  "Veuillez creer un compte",
                  style: GoogleFonts.acme(
                    fontSize: 25,
                    color: Colors.grey,

                  )
              ),


              const SizedBox(
                height: 30,
              ),

              //profile avatar
              GestureDetector(
                onTap: (){

                },
                child: const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(
                    "assets/images/profil_avatar.jpg"
                  ),
                  backgroundColor: Colors.black,
                ),
              ),


              const SizedBox(
                height: 30,
              ),

              //username input
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),

                child: InputTextWidget(
                  textEditingController: emailTextEditingController,
                  labelString: "User name",
                  iconData: Icons.person_2_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 30,
              ),


              //email input
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),

                child: InputTextWidget(
                  textEditingController: emailTextEditingController,
                  labelString: "Email",
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              //password input

              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),

                child: InputTextWidget(
                  textEditingController: passwordTextEditingController,
                  labelString: "Password",
                  iconData: Icons.lock_outlined,
                  isObscure: true,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              //Login button

              //no account yet
              showProgressBar == false ?
              Column(
                children: [
                  //login button
                  Container(
                    width: MediaQuery.of(context).size.width - 38,
                    height: 54,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          showProgressBar = true;
                        });

                        //loading...

                      },
                      child: const Center(
                        child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,

                            )
                        ),

                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  //no account yet, signup now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account ? ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          //send user to signup screen;
                          Get.to(LoginScreen());
                        },
                        child: const Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      )
                    ],

                  ),

                ],
              ): Container(
                //show animations
                child: const SimpleCircularProgressBar(
                  progressColors: [
                    Colors.lightBlue,
                    Colors.green,
                    Colors.amber,
                    Colors.red,
                    Colors.white,
                  ],
                  animationDuration: 3,
                  backColor: Colors.white38,
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
