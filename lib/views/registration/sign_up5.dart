import 'package:flutter/material.dart';
import 'package:internshala/utils/app_colors.dart';

class SignUpSuccessful extends StatefulWidget {
  const SignUpSuccessful({super.key});

  @override
  State<SignUpSuccessful> createState() => _SignUpSuccessfulState();
}

class _SignUpSuccessfulState extends State<SignUpSuccessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset(
                "assets/Vector@1x.png",
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "You're all done!",
                style: TextStyle(
                    fontFamily: "BeVietnam",
                    fontSize: 32,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Hang tight!  We are currently reviewing your account and will follow up with you in 2-3 business days. In the meantime, you can setup your inventory.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "BeVietnam",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.finalTxtColor),
              ),Spacer(),Spacer(),
              Container(
                height: 52,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(117),
                  color: AppColors.themeOrangeColor,
                ),
                child: Center(
                    child: Text(
                  "Got it",
                  style: TextStyle(
                      fontFamily: "BeVietnam",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
              )
            ],
          )),
    );
  }
}
