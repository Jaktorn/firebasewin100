import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/component/my_button.dart';
import 'package:onboarding_screen/component/my_textfield.dart';

import 'package:onboarding_screen/screen/signup_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Move signInWithEmailAndPassword inside the _HomeScreenState class
  Future<void> signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: widget.emailcontroller.text,
        password: widget.passwordcontroller.text,
      );
    } on FirebaseAuthException catch (e) {
      print('Failure : ${e.code}');
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'คนที่ต้องตรวจงาน',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Form(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "สวัสดี, คุณพร้อมรึยัง?",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "กรุณาเข้าสู่ระบบด้วย Email และ Password",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.subtitle1,
                fontSize: 16,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MYTextfield(
              controller: widget.emailcontroller,
              hintText: 'กรุณากรอกอีเมล',
              obscureText: false,
              labelText: "Email",
            ),
            SizedBox(
              height: 20,
            ),
            MYTextfield(
              controller: widget.passwordcontroller,
              hintText: 'กรุณากรอกรหัสผ่าน',
              obscureText: true,
              labelText: "Password",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'ลืมรหัสผ่าน ?',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.subtitle1,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            color: const Color.fromARGB(255, 228, 6, 6),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  MyButton(
                    onTap: signInWithEmailAndPassword,
                    hinText: "Sign In",
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Color.fromARGB(255, 74, 9, 9),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'หรือ เชื่อมต่อกับ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 151, 2, 2),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Color.fromARGB(255, 151, 2, 2),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ยังไม่มีสมาชิก?',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.subtitle1,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'สมัครตอนนี้.',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.subtitle1,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            color: const Color.fromARGB(255, 151, 2, 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
