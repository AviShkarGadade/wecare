import 'package:flutter/material.dart';
import 'signup_screen.dart';
import '../widgets/custom_textfield.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Text("Sign In to Wecare",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                const Text("Welcome back please enter your detail",
                    style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 25),
                const CustomTextField(
                    hintText: 'Email', icon: Icons.email_outlined),
                const SizedBox(height: 15),
                const CustomTextField(
                    hintText: 'Password',
                    icon: Icons.lock_outline,
                    obscureText: true),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {}, child: const Text("Forgot password?")),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF003300),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {},
                  child: const Text("Sign In"),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("New to Wecare?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SignUpScreen()));
                        },
                        child: const Text("Sign Up"))
                  ],
                ),
                const SizedBox(height: 10),
                buildSocialButton("Continue with Google", Icons.g_mobiledata),
                const SizedBox(height: 10),
                buildSocialButton("Continue with Apple", Icons.apple),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSocialButton(String text, IconData icon) {
    return OutlinedButton.icon(
      icon: Icon(icon, color: Colors.black),
      label: Text(text, style: const TextStyle(color: Colors.black)),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.black12),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: () {},
    );
  }
}
