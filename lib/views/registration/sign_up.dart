import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:internshala/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../viewModel/registeration_view_model.dart';
import 'sign_up2.dart';

class SignupPage1 extends StatefulWidget {
  const SignupPage1({super.key});
  @override
  State<SignupPage1> createState() => _SignupPage1State();
}

class _SignupPage1State extends State<SignupPage1> {

TextEditingController fullNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController reenterPassController = TextEditingController();


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    reenterPassController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'FarmerEats',
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: "BeVietnam"),
          ),
        ),
      ),
      body:  Consumer<RegisterationViewModel>(
              builder: (context, registraProvider, child) {
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Signup 1 of 4',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: "BeVietnam"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Welcome!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        fontFamily: "BeVietnam",
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(color: Colors.grey.withOpacity(0.5)),
                          ),
                          height: 50,
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Image.asset('assets/go.png'),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(color: Colors.grey.withOpacity(0.5)),
                          ),
                          height: 50,
                          width: 100,
                          child: Padding(
                            padding:  const EdgeInsets.symmetric(vertical: 9),
                            child: Image.asset('assets/apple.png'),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(color: Colors.grey.withOpacity(0.5)),
                          ),
                          height: 50,
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Image.asset('assets/fb.png'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Center(
                      child: Text(
                        'or signup with',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: "BeVietnam"),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    inputTxtfield('Full Name',fullNameController,Icons.person_outlined,TextInputType.name,(txtInput) {
                      registraProvider.validateFullName(fullName: txtInput);
                    },),
                    
                    const SizedBox(
                      height: 15,
                    ),
                   
                     inputTxtfield('Email Address',emailController,Icons.alternate_email,TextInputType.emailAddress,(txtInput) {
                      registraProvider.isValidEmail(txtInput);
                    },),
                    const SizedBox(
                      height: 15,
                    ),
                     inputTxtfield('Phone Number',phoneController,Icons.phone_outlined,TextInputType.number,(txtInput) {
                      registraProvider.validateMobile(txtInput);
                    },),
                    
                    const SizedBox(
                      height: 15,
                    ),
                    inputTxtfield('Password',passwordController,Icons.lock_outline,TextInputType.text,(txtInput) {
                      registraProvider.validatePassword(txtInput);
                    },),
                    const SizedBox(
                      height: 15,
                    ),
                    inputTxtfield('Re-enter Password',reenterPassController,Icons.lock_outline,TextInputType.text,(txtInput) {
                      registraProvider.validateConfirmPassword(txtInput, passwordController.text);
                    },),
                     SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: "BeVietnam"),
                          ),
                        ),
                        GestureDetector(
                          onTap:registraProvider.isContinueEnable ? () {
                            
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  SignupPage2(),
                                ),
                              );
                            }: null,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: registraProvider.isContinueEnable ? AppColors.themeOrangeColor : AppColors.finalTxtColor,
                            ),
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 52,
                            child: const Center(
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "BeVietnam"),
                              ),
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
      ),
    );
  }

  Widget inputTxtfield(String hintText,TextEditingController txtController,IconData iconName,TextInputType keyboardType, void Function(String)? callback){
    return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.txtFieldBGColor.withOpacity(0.08),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(keyboardType: keyboardType,
                      controller: txtController,
                      onChanged: callback,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon:  Icon(iconName),
                        hintText: hintText,
                        hintStyle:  TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "BeVietnam",
                            color: Colors.black.withOpacity(0.3)),
                      ),
                    ),
                  ),
                );
  }
}
