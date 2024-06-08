import 'package:flutter/material.dart';
import 'package:internshala/utils/app_colors.dart';

import 'sign_up4.dart';

class SignUp3 extends StatefulWidget {
  const SignUp3({super.key});
  @override
  State<SignUp3> createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text(
          'FarmerEats',
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: "BeVietnam"),
        ),
      ),
      backgroundColor: Colors.white,
      body: 
      SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'Signup 3 of 4',
                  style: TextStyle(
                      color: AppColors.txtFieldBGColor.withOpacity(0.3),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "BeVietnam"),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Verification',
                  style: TextStyle(
                    color: AppColors.txtFieldBGColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    fontFamily: "BeVietnam",
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                 Text(
                  'Attached proof of Department of Agriculture registrations i.e. Florida Fresh, USDA Approved, USDA Organic',
                  style: TextStyle(
                      color: AppColors.txtFieldBGColor.withOpacity(0.3),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "BeVietnam"),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const Text(
                      "Attach proof of registration",
                      style: TextStyle(
                          color: AppColors.txtFieldBGColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: "BeVietnam"),
                    ),
                    GestureDetector(onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ,))
                    },
                      child: Container(
                        height: 53,
                        width: 53,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color.fromARGB(255, 206, 120, 89),
                        ),
                        child: const Icon(
                          Icons.photo_camera_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                 SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                ),
                // Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:  Image.asset('assets/arrow.png',width: 25,height: 20,fit: BoxFit.fill,)),
                    GestureDetector(
                      onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WorkingHours(),
                            ),
                          );
                        },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: const Color.fromARGB(255, 206, 120, 89),
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
                SizedBox(height: 50,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
