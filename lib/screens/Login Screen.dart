import 'package:chat/screens/Forgotpasswordscreen.dart';
import 'package:chat/screens/Register Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils.dart';
import '../controllers/google_signin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final controller = Get.find<Firebasecontroller>();
  bool passwordVisible = false;
  final myUtils = Get.put(Utils());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible = true;
    // WidgetsBinding.instance.addPostFrameCallback((_){
    //
    //    if(passwordcontroller.text.isEmpty && emailcontroller.text.isEmpty){
    //         myUtils.showInvaliedtoastMessge("Invalid Credentials");
    //        }
    //
    // });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 75,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    // height: 225,
                    // width: 225,
                    child: Image.asset(
                      "assets/img/image-asset.gif",height: 225,
                      fit: BoxFit.fill,

                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text("CHAT BOX",style: TextStyle().copyWith(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.indigo),),
              // const Image(image: AssetImage("assets/img/lll.png")),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 26),
                child: Container(
                  height: 50,
                  width: 364,
                  decoration: BoxDecoration(
                      color: const Color(0xffF1F2F6),
                      borderRadius: BorderRadius.circular(10)),
                  child: SizedBox(
                    width: 364,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: TextFormField(
                        controller: emailcontroller,
                        enableSuggestions: false,
                        autocorrect: false,
                        autofocus: false,
                        style: const TextStyle(decoration: TextDecoration.none),
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          labelText: "Email",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 26),
                child: Container(
                  height: 50,
                  width: 364,
                  decoration: BoxDecoration(
                      color: const Color(0xffF1F2F6),
                      borderRadius: BorderRadius.circular(10)),
                  child: SizedBox(
                    width: 364,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: TextFormField(
                        controller: passwordcontroller,
                        keyboardType: TextInputType.text,
                        obscureText: passwordVisible,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(
                                () {
                                  passwordVisible = !passwordVisible;
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {
                    Get.to(()=>Forgotpassword());
                  }, child: const Text("Forgot password?"))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo
                    ),
                    onPressed: () {
                      if (emailcontroller.text.isNotEmpty &&
                          passwordcontroller.text.isNotEmpty) {
                              controller.logincheck(emailcontroller.text, passwordcontroller.text);
                      } else {
                        Get.snackbar("Warning", "Invalid Credentials");
                      }

                      // Get.to(()=>MyHomePage());
                    },
                    child: const Text(
                      "Login",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 10,
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: null,
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.black))),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "OR",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 10,
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: null,
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.black))),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  const Text("Continue with "),
                  SizedBox(

                    child: IconButton(
                        onPressed: () {
                          controller.handleGoogleSignUp();
                        },
                        icon: Image.asset("assets/img/google.png",height: 30,width: 30,)),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't you have any Account ?"),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const Register());
                    },
                    child: const Text(
                      "Signup",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


