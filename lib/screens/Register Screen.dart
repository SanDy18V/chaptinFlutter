import 'package:chat/screens/Login%20Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../Utils.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final MyUtils = Get.put(Utils());
  bool passwordVisible = false;
  final TextEditingController regemailcontroller = TextEditingController();
  final TextEditingController regpasswordcontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: const Text(
          "Register",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(

          height: MediaQuery.of(context).size.height ,
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
                    height: 225,
                    width: 225,
                    child: Image.asset(
                      "assets/img/register.gif",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
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
                        controller: regemailcontroller,
                        keyboardType: TextInputType.emailAddress,

                        decoration: const InputDecoration(
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
                        controller: regpasswordcontroller,
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
              const SizedBox(height: 40,),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo

                  ),
                  onPressed: () {
                    if(regpasswordcontroller.text.isEmpty || regemailcontroller.text.isEmpty){
                      Get.snackbar("ChatBox", "Invalid Credentials",
                          snackPosition: SnackPosition.BOTTOM,
                        icon: const Icon(Icons.error, color: Colors.red),
                      );
                    }
                    if(regpasswordcontroller.text.isNotEmpty && regemailcontroller.text.isNotEmpty){
                      _register(regemailcontroller.text,regpasswordcontroller.text);
                    }else{
                      Get.snackbar("ChatBox", "Invalid Credentials",
                        snackPosition: SnackPosition.BOTTOM,
                        icon: const Icon(Icons.error, color: Colors.red),
                      );
                    }
                  },
                  child: const Text("Continue",style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
void _register(String email, String password) async {
  // final myUtils = Get.put(Utils());
  Get.put(EasyLoading.show());
  try {
    UserCredential userCredential =
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (kDebugMode) {
      print(email);
    }
    if (kDebugMode) {
      print(password);
    }
    Get.to(() => const LoginScreen());
    Get.put(EasyLoading.dismiss());
    Get.snackbar("ChatBox", "Registration Sucessful");
    // Registration successful, navigate to home screen
  } on FirebaseAuthException catch (e) {
    Get.put(EasyLoading.dismiss());
    print(e);
    Get.snackbar("ChatBox", e.code.toString(),
        snackPosition: SnackPosition.BOTTOM,
    icon: const Icon(Icons.error, color: Colors.red),);
  } catch (e) {
    Get.put(EasyLoading.dismiss());
    if (kDebugMode) {
      print(e);
    }
  }
}