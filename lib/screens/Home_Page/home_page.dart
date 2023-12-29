import 'package:flutter/material.dart';
import 'package:lunchee/screens/Home_Page/custom_container.dart';
import 'package:lunchee/screens/Home_Page/date_Screen.dart';

import '../constant/reusable_text.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:dotted_border/dotted_border.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  List<dateWeekModel> list1 = [
    dateWeekModel(date: '01', day: 'Mon',),
    dateWeekModel(date: '02', day: 'Tue',),
    dateWeekModel(date: '02', day: 'Wed'),
    dateWeekModel(date: '02', day: 'Thu',),
    dateWeekModel(date: '02', day: 'Fri'),
    dateWeekModel(date: '02', day: 'Sat',),
    dateWeekModel(date: '02', day: 'Mon',),
    dateWeekModel(date: '02', day: 'Tue',),
    dateWeekModel(date: '02', day: 'Wed',),
    dateWeekModel(date: '02', day: 'Thu',),
    dateWeekModel(date: '02', day: 'Fri',),
    dateWeekModel(date: '02', day: 'Sat',),
    dateWeekModel(date: '02', day: 'Mon',),
    dateWeekModel(date: '02', day: 'Tue',),
    dateWeekModel(date: '02', day: 'Wed',),
  ];

  int _currentInex=1;

  bool _isVisible=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 234,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                        image: AssetImage(
                            "assets/icons/image-removebg-preview (1) 1.png")),
                    const Spacer(),
                    const ReusableText(
                      title: 'Ilyas',
                      size: 14,
                      weight: FontWeight.w600,
                      color: Color(0xff343434),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xff7F7AAD)),
                      ),
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundImage:
                        AssetImage("assets/images/Ellipse 1976.png"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Deliver to ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xff808080)),
                          ),
                          TextSpan(
                              text: "Lusail..",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Color(0xff3A3A3A))),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Color(0xff666666),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      title: 'Hey, Alan..',
                      size: 16,
                      weight: FontWeight.w600,
                      color: Color(0xff273279),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Image(
                        height: 30,
                        width: 30,
                        image: AssetImage("assets/icons/hand.png"))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const ReusableText(
                  title: 'Welcome to Lunchee',
                  size: 22,
                  weight: FontWeight.w600,
                  color: Color(0xff242424),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  title: 'Note:',
                  size: 14,
                  weight: FontWeight.w600,
                  color: Color(0xff7F7AAD),
                ),
                SizedBox(
                  height: 10,
                ),
                ReusableText(
                  title:
                  'Lorem ipsum dolor sit amet consectetur. Amet in\nlorem ac dignissim est.',
                  size: 12,
                  weight: FontWeight.w600,
                  color: Color(0xff808080),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          // here

          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.38,
            child:



            GridView.builder(
              itemCount: 15,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 0.79),
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children:
                  [
                  InkWell(
                    onTap: (){
                      setState(() {
                        _currentInex=index;
                        _isVisible=true;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DateScreen()));
                      });
                    },
                    child: CustomContainer(
                        date: list1[index].date.toString(),
                        day: list1[index].day.toString(),
                        borderColor: _currentInex == index
                            ? const Color(0xff099E7A)
                            : const Color(0xff1E1E1E),
                        containerColor:  _currentInex == index
                            ? const Color(0xff11D9A9)
                            : const Color(0xffFFFFFF),
                        dateColor:  _currentInex == index
                            ? const Color(0xff273279)
                            : const Color(0xff777777),
                        dayColor: _currentInex == index
                            ? const Color(0xff343434)
                            : const Color(0xff4F4F4F)),
                  ),
                    Positioned(
                      top:10,
                      left:36,
                      child: Visibility(
                          visible:_isVisible,
                          child: Container(
                        height: 8,width: 8,decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                      )),
                    ),

                  ]
                );
              },
            ),
          ),

          Container(
            height: 110,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(colors: [
                Color(0xffE21D6F),
                Color(0xff273279),
              ]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReusableText(
                      title: 'GRAB',
                      size: 16,
                      weight: FontWeight.w600,
                      color: Color(0xffFFFFFF),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Image(
                        height: 60,
                        width: 60,
                        image: AssetImage("assets/images/20.png")),
                    SizedBox(
                      width: 5,
                    ),
                    ReusableText(
                      title: 'OFF MEAL PLANS',
                      size: 16,
                      weight: FontWeight.w600,
                      color: Color(0xffFFFFFF),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DottedBorder(
                    radius: const Radius.circular(20),
                    borderType: BorderType.RRect,
                    color: const Color(0xffD9D9D9),
                    strokeWidth: 2,
                    child: Container(
                      height: 26,
                      width: 191,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.transparent),
                      child: const Center(
                        child: ReusableText(
                          title: 'Use code : AB000CC',
                          size: 12,
                          weight: FontWeight.w600,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class dateWeekModel {
  String? date;
  String? day;


  dateWeekModel({this.date, this.day,});
}
