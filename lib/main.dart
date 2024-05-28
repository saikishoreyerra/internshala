import 'package:flutter/material.dart';
import 'package:internshala/utils/app_colors.dart';
import 'package:internshala/views/login_screen.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 late int selectedPage;
  late final PageController _pageController;

List<OnBoardData> screensData = [OnBoardData(description: 'Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain.',imgName: 'assets/page1.png',title: 'Quality'),
OnBoardData(description: 'Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers.',imgName: 'assets/page2.png',title: 'Convenient'),
OnBoardData(description: 'We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time.' ,imgName: 'assets/paeg3.png',title: 'Local'),];

  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    // const pageCount = 2;

    return MaterialApp(
      title: 'Page view dot indicator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: pageBgColor(selectedPage),
        body: Column(
          children: [
            SizedBox(
              // color: pageBgColor(selectedPage),
              height: MediaQuery.of(context).size.height/2,
              child: PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    selectedPage = page;
                  });
                },
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Image.asset(screensData[0].imgName,fit: BoxFit.fitWidth,),
                  ),
                  Image.asset(screensData[1].imgName,fit: BoxFit.fitWidth,),
                  Image.asset(screensData[2].imgName,fit: BoxFit.fitWidth,),
                ]),
              
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)
                    ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03 ),
                     Text(screensData[selectedPage].title,style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w700,fontFamily: 'BeVietnam'),),
                     SizedBox(height: MediaQuery.of(context).size.height * 0.03 ),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 15),
                       child: Text(screensData[selectedPage].description,
                       textAlign: TextAlign.center
                       ,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'BeVietnam'),),
                     ),
                     SizedBox(height: MediaQuery.of(context).size.height * 0.035 ),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: PageViewDotIndicator(
                        currentItem: selectedPage,
                        count: screensData.length,
                        unselectedColor: Colors.black26,
                        selectedColor: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        duration: const Duration(milliseconds: 200),
                        boxShape: BoxShape.rectangle,
                        size: Size(30, 10),
                        unselectedSize: Size(10, 10),
                        onItemClicked: (index) {
                          _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ),
                    
                     SizedBox(height: MediaQuery.of(context).size.height * 0.05 ),
                     Container(decoration: BoxDecoration(
                      color: pageBgColor(selectedPage),
                      borderRadius: BorderRadius.circular(25)),child: const Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20,vertical:12 ),
                       child: Text('Join the movement',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,fontFamily: 'BeVietnam',color: Colors.white ),),
                     ),),
                     SizedBox(height: MediaQuery.of(context).size.height * 0.03 ),
                     GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                       child: const Text("Login",style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 14,fontWeight: FontWeight.w500,fontFamily: 'BeVietnam',color: AppColors.txtFieldBGColor),),
                     )
                  ],
                ),
              ),
            ),
            // const SizedBox(
            //   height: 16,
            // ),
          ],
        ),
      ),
    );
  }

  Color pageBgColor(int pageNumber){
    if(pageNumber == 0){
      return Color(0xff00CB14);
    }else if(pageNumber == 1){
      return Color(0xffD5715B);
    }else{
      return Color(0xffF8C569);
    }
     
  }
}



class OnBoardData{
  final String title;
  final String description;
  final String imgName;

  OnBoardData({required this.title, required this.description, required this.imgName});
  
}