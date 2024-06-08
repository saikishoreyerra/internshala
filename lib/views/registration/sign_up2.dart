import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internshala/data/response/api_response.dart';
import 'package:internshala/data/response/status.dart';
import 'package:internshala/utils/app_colors.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../viewModel/registeration_view_model.dart';
import 'sign_up3.dart';

class SignupPage2 extends StatefulWidget {
  const SignupPage2({super.key});
  @override
  State<SignupPage2> createState() => _SignupPage2State();
}

class _SignupPage2State extends State<SignupPage2> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reenterPassController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();

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
    zipCodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterationViewModel>(
              builder: (context, registraProvider, child) {
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
          body:
          registraProvider.isLoading ? const Center(child: CircularProgressIndicator()) :
          //(registraProvider.zipCodesList.status == Status.loading) ? const Center(child: CircularProgressIndicator()) :
           SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Signup 2 of 4',
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
                      'Farm Info',
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
        
                    const SizedBox(
                      height: 30,
                    ),
                    inputTxtfield(
                        'Business Name', fullNameController, Icons.business,),
        
                    const SizedBox(
                      height: 15,
                    ),
        
                    inputTxtfield(
                        'Email Address', emailController, Icons.tag_faces,keyboardType:TextInputType.emailAddress ),
                    const SizedBox(
                      height: 15,
                    ),
                    inputTxtfield(
                        'Phone Number', phoneController, Icons.home_outlined,keyboardType:TextInputType.number),
        
                    const SizedBox(
                      height: 15,
                    ),
                    inputTxtfield(
                        'Password', passwordController, Icons.location_on_outlined,),
                    const SizedBox(
                      height: 15,
                    ),
                    //dropdown
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.txtFieldBGColor.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(8)),
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 2),
                            // child: TextField(
                            //   decoration: InputDecoration(
                            //       border: InputBorder.none,
                            //       hintText: "State",
                            //       hintStyle: TextStyle(
                            //         fontFamily: "BeVietnam",
                            //         fontSize: 14,
                            //         fontWeight: FontWeight.w400,
                            //         color: Colors.black.withOpacity(0.3),
                            //       ),
                            //       suffixIcon: Icon(
                            //         Icons.arrow_drop_down_outlined,
                            //       )),
                            // ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              child: Text(registraProvider.zipCodesList.data?.first.state ?? 'State'),
                            ),
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.txtFieldBGColor.withOpacity(0.08)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 2),
                              child: TextField(
                               controller: zipCodeController,
                                onChanged: (value) {
                                  if(value.length > 5){
                                    // isFetchZipCode = true;
                                    print("===========");
                                    registraProvider.getZipInfoByCode(zipCodeNum: value, context: context);
                                  }else if(value.length == 0){
                                    registraProvider.zipCodesList.data?.first.state = null;
                                  }
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                  ,LengthLimitingTextInputFormatter(6),
                                ], // Only numbers can be entered
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Zipcode",
                                    hintStyle: TextStyle(
                                        fontFamily: "BeVietnam",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black.withOpacity(0.3))),
                              ),
                            )),
                      ],
                    ),
                     registraProvider.isFetchZipCode ? Text("Enter Valid Zipcode",style: TextStyle(color: Colors.red,),) : Text(''),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.21,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/arrow.png',
                            width: 25,
                            height: 20,
                            fit: BoxFit.fill,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUp3(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: AppColors.themeOrangeColor,
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
          ),
        );
      }
    );
  }

  Widget inputTxtfield(
      String hintText, TextEditingController txtController, IconData iconName,{TextInputType? keyboardType}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.txtFieldBGColor.withOpacity(0.08),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: TextField(keyboardType:keyboardType,
          controller: txtController,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(iconName),
            hintText: hintText,
            hintStyle: TextStyle(
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
