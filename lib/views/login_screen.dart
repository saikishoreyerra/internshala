
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:internshala/utils/app_colors.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../repository/registration_repository.dart';
import '../viewModel/registeration_view_model.dart';
import '../viewModel/user_view_model.dart';
import 'registration/sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   WidgetsBinding.instance.addPostFrameCallback((_){

  // Add Your Code here.
  Provider.of<RegisterationViewModel>(context, listen: false).fetchPostsApi();
});
   

    
  }
  @override
  Widget build(BuildContext context) {
    
    return Consumer<RegisterationViewModel>(
              builder: (context, registraProvider, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'FarmerEats',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: "BeVietnam",
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Welcome back!',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          fontFamily: "BeVietnam"),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text(
                          'New here?',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: "BeVietnam"),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupPage1(),
                              ),
                            );
                          },
                          child: const Text(
                            ' Create account',
                            style: TextStyle(
                                color: Color.fromARGB(255, 195, 101, 14),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "BeVietnam"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: TextField(keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.alternate_email),
                              hintText: 'Email Address',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "BeVietnam")),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 22),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextField(keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 20),
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => Password(),
                                  //     ));
                                },
                                child: const Text(
                                  "Forgot ?",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 213, 113, 91),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "BeVietnam"),
                                ),
                              ),
                            ),
                            prefixIcon: const Icon(Icons.lock),
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "BeVietnam"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // print('login');
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.themeOrangeColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width * 0.37,
                              vertical: 16),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: "BeVietnam"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Center(
                    child: Text(
                      'or login with',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          fontFamily: "BeVietnam"),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              border:
                                  Border.all(color: Colors.grey.withOpacity(0.2))),
                          height: 52,
                          width: 96,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Image.asset(
                              height: 40,
                              width: 40,
                              'assets/go.png',
                              fit: BoxFit.fitHeight,
                            ),
                          )),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              border:
                                  Border.all(color: Colors.grey.withOpacity(0.2))),
                          height: 52,
                          width: 96,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Image.asset(
                              'assets/apple.png',
                              fit: BoxFit.fitHeight,
                            ),
                          )),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.2))),
                        height: 52,
                        width: 96,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Image.asset(
                            'assets/fb.png',
                            fit: BoxFit.fitHeight,
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
    );
  }
}

