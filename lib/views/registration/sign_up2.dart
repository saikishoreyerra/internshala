import 'package:flutter/material.dart';
import 'package:internshala/utils/app_colors.dart';

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
String stateStr = "Andhra";

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
      body: SingleChildScrollView(
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
                inputTxtfield('Business Name',fullNameController,Icons.business),
                
                const SizedBox(
                  height: 15,
                ),
               
                 inputTxtfield('Email Address',emailController,Icons.tag_faces),
                const SizedBox(
                  height: 15,
                ),
                 inputTxtfield('Phone Number',phoneController,Icons.home_outlined),
                
                const SizedBox(
                  height: 15,
                ),
                inputTxtfield('Password',passwordController,Icons.location_on_outlined),
                const SizedBox(
                  height: 15,
                ),
                //dropdown
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(height: MediaQuery.of(context).size.height*0.057,width: MediaQuery.of(context).size.width*0.35,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.txtFieldBGColor.withOpacity(0.08)),
                      child: DropdownButton<String>(
                        items: <String>['Andhra', 'Karnataka', 'Tamilnadu', 'Kerela','Maharastra','Himachal','Manipur','Punjab'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: stateStr,
                            child: Text(stateStr),
                          );
                        }).toList(),
                        onChanged: (newvalue) {
                          setState(() {
                            stateStr = newvalue!;
                          });
                        },
                      ),
                    ),

                      Container(width: MediaQuery.of(context).size.width*0.5, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:AppColors.txtFieldBGColor.withOpacity(0.08)), child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:  12.0,vertical: 2),
                        child: TextField(textAlign: TextAlign.start,decoration:InputDecoration(border: InputBorder.none,hintText: "Enter Zipcode",hintStyle: TextStyle(fontFamily: "BeVietnam",fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black.withOpacity(0.3))),),
                      )),
                    
                  ],
                ),
               SizedBox(height:  MediaQuery.of(context).size.height * 0.22,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/arrow.png',width: 25,height: 20,fit: BoxFit.fill,),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: AppColors.themeOrangeColor,
                      ),
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 52,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp3(),
                            ),
                          );
                        },
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

  Widget inputTxtfield(String hintText,TextEditingController txtController,IconData iconName){
    return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.txtFieldBGColor.withOpacity(0.08),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      controller: txtController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon:  Icon(iconName),
                        hintText: hintText,
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "BeVietnam"),
                      ),
                    ),
                  ),
                );
  }
}
