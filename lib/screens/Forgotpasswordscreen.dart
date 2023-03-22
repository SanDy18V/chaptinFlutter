import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/google_signin.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final controller = Get.find<Firebasecontroller>();

  final TextEditingController forgotemailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        // backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(
          "Forgot Password..?",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            SizedBox(
                child: Image.asset(
                    "assets/img/forgot-password-4268397-3551744.webp")),
            SizedBox(
              height: 25,
            ),
            Text("Please Enter your registered email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            SizedBox(
              height: 5,
            ),
            Text("We will getback to you soon....",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            SizedBox(
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
                      controller: forgotemailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "Enter your registered Email",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                onPressed: () {
                  controller.forgotpassword(forgotemailcontroller.text.toString().trim());
                },
                child: const Text("Continue",style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
