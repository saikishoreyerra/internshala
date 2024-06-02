import 'package:flutter/material.dart';
import 'package:internshala/utils/app_colors.dart';

// import 'Sign_up5.dart';

class WorkingHours extends StatefulWidget {
  const WorkingHours({super.key});

  @override
  State<WorkingHours> createState() => _WorkingHoursState();
}

class _WorkingHoursState extends State<WorkingHours> {
  List<String> weekDays = ["M", "T", "W", "Th", "F", "S", "Su"];
  List<String> timeSlots = [
    "8:00am - 10:00am",
    "10:00am - 1:00pm",
    "1:00pm - 4:00pm",
    "4:00pm - 7:00pm",
    "7:00pm - 10:00pm"
  ];
  bool isDaySelected = false;
  bool isTimeSlotSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text(
          "FarmerEats",
          style: TextStyle(
              fontFamily: "BeVietnam",
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SignUp 4 of 4",
                style: TextStyle(
                  fontFamily: "BeVietnam",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.txtFieldBGColor.withOpacity(0.3),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Business Hours",
                style: TextStyle(
                    color: AppColors.txtFieldBGColor,
                    fontFamily: "BeVietnam",
                    fontWeight: FontWeight.w700,
                    fontSize: 32),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Choose the hours your farm is open for pickups. This will allow customers to order deliveries.",
                style: TextStyle(
                  fontFamily: "BeVietnam",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.txtFieldBGColor.withOpacity(0.3),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 38,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: weekDays.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print(weekDays[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7.5),
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.005,
                          width: MediaQuery.of(context).size.width*0.09,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),border: Border.all(width: 1,color: AppColors.txtFieldBGColor.withOpacity(0.3)),
                            color: AppColors.txtFieldBGColor.withOpacity(0.08),
                          ),
                          child: Center(
                            child: Text(
                              weekDays[index],
                              style: TextStyle(
                                fontFamily: "BeVietnam",
                                fontWeight: FontWeight.w400, fontSize: 16,
                                color: AppColors.txtFieldBGColor.withOpacity(0.3),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 360,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: timeSlots.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 6),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          // margin: EdgeInsets.only(
                          //     left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                          decoration: const BoxDecoration(
                            color: AppColors.highligtedTimeColor,
                            borderRadius: BorderRadius.all(Radius.circular(
                                    8.0) //                 <--- border radius here
                                ),
                          ),
                          child: Center(
                            child: Text(
                              timeSlots[index],
                              style: const TextStyle(
                                color: AppColors.txtFieldBGColor,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {},
                    );
                  },
                ),
              ),
              // SizedBox(
              //   height: 300,
              //   child: GridView.builder(
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2),
              //     itemCount: timeSlots.length,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         margin: EdgeInsets.all(4),
              //         color: Colors.blue,height: 30,width: 50,);
              //       // return Container(
              //       //   // height: 50,
              //       //   // width: MediaQuery.of(context).size.width * 0.3,
              //       //   decoration: BoxDecoration(
              //       //     borderRadius: BorderRadius.circular(8),
              //       //     color: AppColors.txtFieldBGColor.withOpacity(0.3),
              //       //   ),
              //       //   child: Text(
              //       //     timeSlots[index],
              //       //     style: TextStyle(
              //       //         color: AppColors.blackTxtColor,
              //       //         fontSize: 14,
              //       //         fontWeight: FontWeight.w400,
              //       //         fontFamily: "BeVietnam"),
              //       //   ),
              //       // );
              //     },
              //   ),
              // ),
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
                      )),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: const Color.fromARGB(255, 206, 120, 89),
                    ),
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 52,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const SignUpSuccessful(),
                        //   ),
                        // );
                      },
                      child: const Center(
                        child: Text(
                          'SignUp',
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
}
