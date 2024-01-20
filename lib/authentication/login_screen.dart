import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rsf/authentication/registration_screen.dart';
import 'package:rsf/widgets/input_text_widget.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {

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
                        "Don't have an account ? ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          //send user to signup screen;
                          //Get.to(const RegistrationScreen());
                          Get.to(() => const RegistrationScreen());
                        },
                        child: const Text(
                          "Signup now",
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
              ): const SimpleCircularProgressBar(
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


            ],
          ),
          ),
        ),
    );
  }
}
