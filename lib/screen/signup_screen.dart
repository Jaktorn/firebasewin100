import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/component/my_button.dart';
import 'package:onboarding_screen/component/my_textfield.dart';
import 'package:onboarding_screen/screen/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();

  get createUserWithEmailAndPassword => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome to our community.",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
            Text(
              "\nTo get started, please provide your information and create an account.\n",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displaySmall,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
            MYTextfield(
              controller: fullnameController,
              labelText: "ชื่อ",
              obscureText: false,
              hintText: "Enter your name.",
            ),
            const SizedBox(height: 20),
            MYTextfield(
              controller: emailController,
              labelText: "Email",
              obscureText: false,
              hintText: "กรอก Email.",
            ),
            const SizedBox(height: 20),
            MYTextfield(
              controller: passwordController,
              labelText: "รหัสผ่าน",
              obscureText: true,
              hintText: "Enter your password.",
            ),
            const SizedBox(height: 20),
            MYTextfield(
              controller: repasswordController,
              labelText: "ยืนยันรหัสผ่าน",
              obscureText: true,
              hintText: "Enter your password again.",
            ),
            const SizedBox(height: 20),
            MyButton(
              onTap: createUserWithEmailAndPassword,
              hinText: "สมัครสมาชิก",
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'เป็นสมาชิกแล้ว?',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(width: 1),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign in.',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displaySmall,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: const Color.fromARGB(255, 228, 6, 6),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    
  }
}
