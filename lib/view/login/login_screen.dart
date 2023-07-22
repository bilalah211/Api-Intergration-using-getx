import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_a/resources/components/rounded_button.dart';
import '../../view_model/controller/login/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.emailC,
              decoration: const InputDecoration(
                  labelText: 'Email', prefixIcon: Icon(Icons.email_outlined)),
            ),
            TextFormField(
              controller: controller.passC,
              decoration: const InputDecoration(
                  labelText: 'Password',
                  suffixIcon: Icon(Icons.visibility_off),
                  prefixIcon: Icon(Icons.lock_outlined)),
            ),
            const SizedBox(height: 40),
            Obx(() => RoundedButton(
                  loading: controller.loading.value,
                  width: 250,
                  title: 'Login',
                  onPressed: () {
                    controller.isLogin();
                  },
                  colors: Colors.green.shade900,
                ))
          ],
        ),
      ),
    );
  }
}
