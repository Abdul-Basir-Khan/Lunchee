import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lunchee/screens/Home_Page/checkout_screen.dart';

import '../constant/reusable_text.dart';
import 'package:entry/entry.dart';

import 'custom_container.dart';
import 'home_page.dart';

class DateScreen extends StatefulWidget
{
  const DateScreen({super.key});

  @override
  State<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {

  final List<String> items = [
    'assets/images/Rectangle 34624215.png',
    'assets/images/Rectangle 34624215.png',
    'assets/images/Rectangle 34624215.png',
    'assets/images/Rectangle 34624215.png',
  ];

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
  ];

  int _currentInex=0;

  bool _isVisible=false;

  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    if (_count > 0) {
      setState(() {
        _count--;
      });
    }
  }

  ScrollPhysics _physics = const ScrollPhysics();

  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body:


          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
                _currentInex = page;

              });
            },
            children: [
              AnimationLimiter(
                child: ListView.builder(
                  itemCount: 1,
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.vertical,shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(seconds:1),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child:


                          SizedBox(
                            height: MediaQuery.sizeOf(context).height*0.95,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,physics: const ScrollPhysics(),
                                child:

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Entry.offset(
                                      duration: const Duration(seconds: 1),
                                      child:    SingleChildScrollView(
                                        physics: _physics,
                                        scrollDirection: Axis.horizontal,
                                        child: SizedBox(
                                          width: MediaQuery.sizeOf(context).width*1,
                                          height: MediaQuery.sizeOf(context).height*0.12,
                                          child:
                                          ListView.builder(
                                            itemCount: list1.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context, int index) {
                                              return Stack(
                                                  children:
                                                  [
                                                    InkWell(
                                                      onTap: (){
                                                        setState(() {
                                                          _currentInex=index;
                                                          _isVisible=true;
                                                        });
                                                      },
                                                      child: CustomContainer(
                                                          date: list1[index].date.toString(),
                                                          day: list1[index].day.toString(),
                                                          borderColor: _currentInex == index
                                                              ? const Color(0xffE793B6)
                                                              : const Color(0xff1E1E1E),
                                                          containerColor:  _currentInex == index
                                                              ? const Color(0xffD9117C)
                                                              : const Color(0xffFFFFFF),
                                                          dateColor:  _currentInex == index
                                                              ? const Color(0xffFFFFFF)
                                                              : const Color(0xff777777),
                                                          dayColor: _currentInex == index
                                                              ? const Color(0xffD9D9D9)
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
                                                              color: Color(0xffFFFFFF)
                                                          ),
                                                          )),
                                                    ),

                                                  ]
                                              );
                                            },
                                          ),


                                        ),
                                      ),),


                                    const SizedBox(height: 20,),


                                    SizedBox(
                                      height: MediaQuery.sizeOf(context).height*0.58,
                                      width: MediaQuery.sizeOf(context).width*1,
                                      child: SingleChildScrollView(
                                        physics: _physics,

                                        scrollDirection: Axis.vertical,

                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  onTap:(){
                                                    setState(() {
                                                      showDialog(context: context, builder: (BuildContext context) {
                                                        return



                                                          Entry.offset(
                                                              duration: const Duration(milliseconds: 800),
                                                              child:


                                                              BackdropFilter(
                                                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                                                child: Dialog(
                                                                  backgroundColor: const Color(0xFF212925),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(20),
                                                                  ),
                                                                  child: SingleChildScrollView(
                                                                    child: Container(
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        color: Colors.white,
                                                                      ),
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Stack(
                                                                            alignment: Alignment.bottomLeft,
                                                                            children: [
                                                                              const Image(
                                                                                  fit:BoxFit.cover,
                                                                                  image: AssetImage("assets/images/Rectangle 34624212.png")),
                                                                              const Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Image(
                                                                                    fit: BoxFit.fitWidth ,
                                                                                    image: AssetImage("assets/images/B.png")),
                                                                              ),

                                                                              Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(10.0),
                                                                                  child: Row(
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      const ReusableText(
                                                                                        title: 'Persian Spiced',
                                                                                        size: 16,
                                                                                        weight: FontWeight.w600,
                                                                                        color: Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const Spacer(),
                                                                                      InkWell(
                                                                                        onTap:_decrement,
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child: const Icon(
                                                                                            Icons.remove,color: Color(0xff000000),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      ReusableText(
                                                                                        title: '$_count',
                                                                                        size: 10,
                                                                                        weight: FontWeight.w600,
                                                                                        color: const Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      InkWell(
                                                                                        onTap:(){
                                                                                          setState(() {
                                                                                            _increment;
                                                                                          });
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child:  const Icon(
                                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                                        ),
                                                                                      ),

                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const Padding(
                                                                            padding: EdgeInsets.all(10.0),
                                                                            child: Column(children: [
                                                                              Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Icon(Icons.star,color: Color(0xffEBB52B),),
                                                                                  SizedBox(width: 10,),
                                                                                  ReusableText(
                                                                                    title: '4.5',
                                                                                    size: 16,
                                                                                    weight: FontWeight.w600,
                                                                                    color: Color(0xff000000),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(height: 10,),
                                                                              ReusableText(
                                                                                title: 'Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non. Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non.',
                                                                                size: 10,
                                                                                weight: FontWeight.w600,
                                                                                color: Color(0xff5C5C5C),
                                                                              ),

                                                                            ],),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ));


                                                      }, );
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 230,
                                                    width: MediaQuery.of(context).size.width*0.46,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        image: const DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage('assets/images/Rectangle 34624215.png')
                                                        )
                                                    ),
                                                    child: Stack(
                                                        children: [

                                                          const Positioned(
                                                            bottom: 0,
                                                            child: Image(
                                                                width: 189,
                                                                fit: BoxFit.fitWidth ,
                                                                image: AssetImage("assets/images/Rectangle 34624216.png")),
                                                          ),

                                                          Align(
                                                            alignment: Alignment.bottomLeft,

                                                            child: Padding(
                                                              padding: const EdgeInsets.all(10.0),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  const Image(

                                                                    image: AssetImage('assets/images/red.png'),),
                                                                  const SizedBox(height: 10,),
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      const ReusableText(
                                                                        title: 'Persian\nSpiced fish',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: Color(0xffFFFFFF),
                                                                      ),
                                                                      const Spacer(),
                                                                      InkWell(
                                                                        onTap:_decrement,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child: const Icon(
                                                                            Icons.remove,color: Color(0xff000000),

                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      ReusableText(
                                                                        title: '$_count',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: const Color(0xffFFFFFF),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      InkWell(
                                                                        onTap: _increment,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child:  const Icon(
                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),

                                                        ]
                                                    ),
                                                  ),
                                                ),
                                                const Spacer(),
                                                InkWell(
                                                  onTap:(){
                                                    setState(() {
                                                      showDialog(context: context, builder: (BuildContext context) {
                                                        return



                                                          Entry.offset(
                                                              duration: const Duration(milliseconds: 800),
                                                              child:


                                                              BackdropFilter(
                                                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                                                child: Dialog(
                                                                  backgroundColor: const Color(0xFF212925),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(20),
                                                                  ),
                                                                  child: SingleChildScrollView(
                                                                    child: Container(
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        color: Colors.white,
                                                                      ),
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Stack(
                                                                            alignment: Alignment.bottomLeft,
                                                                            children: [
                                                                              const Image(
                                                                                  fit:BoxFit.cover,
                                                                                  image: AssetImage("assets/images/Rectangle 34624212.png")),
                                                                              const Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Image(
                                                                                    fit: BoxFit.fitWidth ,
                                                                                    image: AssetImage("assets/images/B.png")),
                                                                              ),

                                                                              Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(10.0),
                                                                                  child: Row(
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      const ReusableText(
                                                                                        title: 'Persian Spiced',
                                                                                        size: 16,
                                                                                        weight: FontWeight.w600,
                                                                                        color: Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const Spacer(),
                                                                                      InkWell(
                                                                                        onTap:_decrement,
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child: const Icon(
                                                                                            Icons.remove,color: Color(0xff000000),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      ReusableText(
                                                                                        title: '$_count',
                                                                                        size: 10,
                                                                                        weight: FontWeight.w600,
                                                                                        color: const Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      InkWell(
                                                                                        onTap:(){
                                                                                          setState(() {
                                                                                            _increment;
                                                                                          });
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child:  const Icon(
                                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                                        ),
                                                                                      ),

                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const Padding(
                                                                            padding: EdgeInsets.all(10.0),
                                                                            child: Column(children: [
                                                                              Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Icon(Icons.star,color: Color(0xffEBB52B),),
                                                                                  SizedBox(width: 10,),
                                                                                  ReusableText(
                                                                                    title: '4.5',
                                                                                    size: 16,
                                                                                    weight: FontWeight.w600,
                                                                                    color: Color(0xff000000),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(height: 10,),
                                                                              ReusableText(
                                                                                title: 'Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non. Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non.',
                                                                                size: 10,
                                                                                weight: FontWeight.w600,
                                                                                color: Color(0xff5C5C5C),
                                                                              ),

                                                                            ],),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ));


                                                      }, );
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 230,
                                                    width: MediaQuery.of(context).size.width*0.46,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        image: const DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage('assets/images/Rectangle 34624215.png')
                                                        )
                                                    ),
                                                    child: Stack(
                                                        children: [

                                                          const Positioned(
                                                            bottom: 0,
                                                            child: Image(
                                                                width: 189,
                                                                fit: BoxFit.fitWidth ,
                                                                image: AssetImage("assets/images/Rectangle 34624216.png")),
                                                          ),

                                                          Align(
                                                            alignment: Alignment.bottomLeft,

                                                            child: Padding(
                                                              padding: const EdgeInsets.all(10.0),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  const Image(

                                                                    image: AssetImage('assets/images/NicePng_veg-png_2579531 1.png'),),
                                                                  const SizedBox(height: 10,),
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      const ReusableText(
                                                                        title: 'Persian\nSpiced fish',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: Color(0xffFFFFFF),
                                                                      ),
                                                                      const Spacer(),
                                                                      InkWell(
                                                                        onTap:_decrement,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child: const Icon(
                                                                            Icons.remove,color: Color(0xff000000),

                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      ReusableText(
                                                                        title: '$_count',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: const Color(0xffFFFFFF),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      InkWell(
                                                                        onTap: _increment,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child:  const Icon(
                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),

                                                        ]
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  onTap:(){
                                                    setState(() {
                                                      showDialog(context: context, builder: (BuildContext context) {
                                                        return



                                                          Entry.offset(
                                                              duration: const Duration(milliseconds: 800),
                                                              child:


                                                              BackdropFilter(
                                                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                                                child: Dialog(
                                                                  backgroundColor: const Color(0xFF212925),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(20),
                                                                  ),
                                                                  child: SingleChildScrollView(
                                                                    child: Container(
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        color: Colors.white,
                                                                      ),
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Stack(
                                                                            alignment: Alignment.bottomLeft,
                                                                            children: [
                                                                              const Image(
                                                                                  fit:BoxFit.cover,
                                                                                  image: AssetImage("assets/images/Rectangle 34624212.png")),
                                                                              const Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Image(
                                                                                    fit: BoxFit.fitWidth ,
                                                                                    image: AssetImage("assets/images/B.png")),
                                                                              ),

                                                                              Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(10.0),
                                                                                  child: Row(
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      const ReusableText(
                                                                                        title: 'Persian Spiced',
                                                                                        size: 16,
                                                                                        weight: FontWeight.w600,
                                                                                        color: Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const Spacer(),
                                                                                      InkWell(
                                                                                        onTap:_decrement,
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child: const Icon(
                                                                                            Icons.remove,color: Color(0xff000000),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      ReusableText(
                                                                                        title: '$_count',
                                                                                        size: 10,
                                                                                        weight: FontWeight.w600,
                                                                                        color: const Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      InkWell(
                                                                                        onTap:(){
                                                                                          setState(() {
                                                                                            _increment;
                                                                                          });
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child:  const Icon(
                                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                                        ),
                                                                                      ),

                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const Padding(
                                                                            padding: EdgeInsets.all(10.0),
                                                                            child: Column(children: [
                                                                              Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Icon(Icons.star,color: Color(0xffEBB52B),),
                                                                                  SizedBox(width: 10,),
                                                                                  ReusableText(
                                                                                    title: '4.5',
                                                                                    size: 16,
                                                                                    weight: FontWeight.w600,
                                                                                    color: Color(0xff000000),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(height: 10,),
                                                                              ReusableText(
                                                                                title: 'Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non. Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non.',
                                                                                size: 10,
                                                                                weight: FontWeight.w600,
                                                                                color: Color(0xff5C5C5C),
                                                                              ),

                                                                            ],),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ));


                                                      }, );
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 230,
                                                    width: MediaQuery.of(context).size.width*0.46,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        image: const DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage('assets/images/Rectangle 34624215.png')
                                                        )
                                                    ),
                                                    child: Stack(
                                                        children: [

                                                          const Positioned(
                                                            bottom: 0,
                                                            child: Image(
                                                                width: 189,
                                                                fit: BoxFit.fitWidth ,
                                                                image: AssetImage("assets/images/Rectangle 34624216.png")),
                                                          ),

                                                          Align(
                                                            alignment: Alignment.bottomLeft,

                                                            child: Padding(
                                                              padding: const EdgeInsets.all(10.0),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  const Image(

                                                                    image: AssetImage('assets/images/red.png'),),
                                                                  const SizedBox(height: 10,),
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      const ReusableText(
                                                                        title: 'Persian\nSpiced fish',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: Color(0xffFFFFFF),
                                                                      ),
                                                                      const Spacer(),
                                                                      InkWell(
                                                                        onTap:_decrement,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child: const Icon(
                                                                            Icons.remove,color: Color(0xff000000),

                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      ReusableText(
                                                                        title: '$_count',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: const Color(0xffFFFFFF),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      InkWell(
                                                                        onTap: _increment,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child:  const Icon(
                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),

                                                        ]
                                                    ),
                                                  ),
                                                ),
                                                const Spacer(),
                                                InkWell(
                                                  onTap:(){
                                                    setState(() {
                                                      showDialog(context: context, builder: (BuildContext context) {
                                                        return



                                                          Entry.offset(
                                                              duration: const Duration(milliseconds: 800),
                                                              child:


                                                              BackdropFilter(
                                                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                                                child: Dialog(
                                                                  backgroundColor: const Color(0xFF212925),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(20),
                                                                  ),
                                                                  child: SingleChildScrollView(
                                                                    child: Container(
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        color: Colors.white,
                                                                      ),
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Stack(
                                                                            alignment: Alignment.bottomLeft,
                                                                            children: [
                                                                              const Image(
                                                                                  fit:BoxFit.cover,
                                                                                  image: AssetImage("assets/images/Rectangle 34624212.png")),
                                                                              const Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Image(
                                                                                    fit: BoxFit.fitWidth ,
                                                                                    image: AssetImage("assets/images/B.png")),
                                                                              ),

                                                                              Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(10.0),
                                                                                  child: Row(
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      const ReusableText(
                                                                                        title: 'Persian Spiced',
                                                                                        size: 16,
                                                                                        weight: FontWeight.w600,
                                                                                        color: Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const Spacer(),
                                                                                      InkWell(
                                                                                        onTap:_decrement,
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child: const Icon(
                                                                                            Icons.remove,color: Color(0xff000000),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      ReusableText(
                                                                                        title: '$_count',
                                                                                        size: 10,
                                                                                        weight: FontWeight.w600,
                                                                                        color: const Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      InkWell(
                                                                                        onTap:(){
                                                                                          setState(() {
                                                                                            _increment;
                                                                                          });
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child:  const Icon(
                                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                                        ),
                                                                                      ),

                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const Padding(
                                                                            padding: EdgeInsets.all(10.0),
                                                                            child: Column(children: [
                                                                              Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Icon(Icons.star,color: Color(0xffEBB52B),),
                                                                                  SizedBox(width: 10,),
                                                                                  ReusableText(
                                                                                    title: '4.5',
                                                                                    size: 16,
                                                                                    weight: FontWeight.w600,
                                                                                    color: Color(0xff000000),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(height: 10,),
                                                                              ReusableText(
                                                                                title: 'Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non. Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non.',
                                                                                size: 10,
                                                                                weight: FontWeight.w600,
                                                                                color: Color(0xff5C5C5C),
                                                                              ),

                                                                            ],),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ));


                                                      }, );
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 230,
                                                    width: MediaQuery.of(context).size.width*0.46,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        image: const DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage('assets/images/Rectangle 34624215.png')
                                                        )
                                                    ),
                                                    child: Stack(
                                                        children: [

                                                          const Positioned(
                                                            bottom: 0,
                                                            child: Image(
                                                                width: 189,
                                                                fit: BoxFit.fitWidth ,
                                                                image: AssetImage("assets/images/Rectangle 34624216.png")),
                                                          ),

                                                          Align(
                                                            alignment: Alignment.bottomLeft,

                                                            child: Padding(
                                                              padding: const EdgeInsets.all(10.0),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  const Image(

                                                                    image: AssetImage('assets/images/NicePng_veg-png_2579531 1.png'),),
                                                                  const SizedBox(height: 10,),
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      const ReusableText(
                                                                        title: 'Persian\nSpiced fish',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: Color(0xffFFFFFF),
                                                                      ),
                                                                      const Spacer(),
                                                                      InkWell(
                                                                        onTap:_decrement,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child: const Icon(
                                                                            Icons.remove,color: Color(0xff000000),

                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      ReusableText(
                                                                        title: '$_count',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: const Color(0xffFFFFFF),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      InkWell(
                                                                        onTap: _increment,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child:  const Icon(
                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),

                                                        ]
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),



                                    const SizedBox(height: 20,),
                                    Container(
                                      height: 110,
                                      width: MediaQuery.sizeOf(context).width*1,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Color(0xffE21D6F),
                                              Color(0xff273279),
                                            ]
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              ReusableText(
                                                title: 'GRAB',
                                                size: 16,
                                                weight: FontWeight.w600,
                                                color: Color(0xffFFFFFF),
                                              ),
                                              SizedBox(width: 5,),
                                              Image(
                                                  height: 60,width: 60,
                                                  image: AssetImage("assets/images/20.png")),
                                              SizedBox(width: 5,),
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
                                            child:

                                            DottedBorder(
                                              radius: const Radius.circular(20),
                                              borderType: BorderType.RRect,
                                              color: const Color(0xffD9D9D9),
                                              strokeWidth: 2,
                                              child: Container(
                                                height: 26,
                                                width: 191,
                                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                                decoration: BoxDecoration(
                                                    borderRadius:BorderRadius.circular(20),
                                                    color: Colors.transparent
                                                ),
                                                child: const Center(child:  ReusableText(
                                                  title: 'Use code : AB000CC',
                                                  size: 12,
                                                  weight: FontWeight.w600,
                                                  color: Color(0xffFFFFFF),
                                                ),),
                                              ),


                                            ),
                                          ),
                                          const SizedBox(height: 6,)


                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 30,),

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,children: [
                                      InkWell(
                                        onTap: (){

                                        },
                                        child: Container(
                                          width: MediaQuery.sizeOf(context).width*0.46,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color: const Color(0xff273279)
                                          ),
                                          child: const Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image(image: AssetImage("assets/icons/Group (1).png")),
                                              SizedBox(width: 15,),
                                              ReusableText(
                                                title: 'Add to Cart',
                                                size: 16,
                                                weight: FontWeight.w600,
                                                color: Color(0xffFFFFFF),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: (){
                                          setState(() {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const CheckOutScreen()));
                                          });
                                        },
                                        child: Container(
                                          width: MediaQuery.sizeOf(context).width*0.46,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color: const Color(0xffD9117C)
                                          ),
                                          child: const Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image(image: AssetImage("assets/icons/Vector.png")),
                                              SizedBox(width: 15,),
                                              ReusableText(
                                                title: 'Checkout',
                                                size: 16,
                                                weight: FontWeight.w600,
                                                color: Color(0xffFFFFFF),
                                              ),
                                            ],
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

                        ),
                      ),
                    );
                  },
                ),
              ),
              AnimationLimiter(
                child: ListView.builder(
                  itemCount: 1,
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.vertical,shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(seconds:1),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child:


                          SizedBox(
                            height: MediaQuery.sizeOf(context).height*0.95,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,physics: const ScrollPhysics(),
                                child:

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Entry.offset(
                                      duration: const Duration(seconds: 1),
                                      child:    SingleChildScrollView(
                                        physics: _physics,
                                        scrollDirection: Axis.horizontal,
                                        child: SizedBox(
                                          width: MediaQuery.sizeOf(context).width*1,
                                          height: MediaQuery.sizeOf(context).height*0.12,
                                          child:
                                          ListView.builder(
                                            itemCount: list1.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context, int index) {
                                              return Stack(
                                                  children:
                                                  [
                                                    InkWell(
                                                      onTap: (){
                                                        setState(() {
                                                          _currentInex=index;
                                                          _isVisible=true;
                                                        });
                                                      },
                                                      child: CustomContainer(
                                                          date: list1[index].date.toString(),
                                                          day: list1[index].day.toString(),
                                                          borderColor: _currentInex == index
                                                              ? const Color(0xffE793B6)
                                                              : const Color(0xff1E1E1E),
                                                          containerColor:  _currentInex == index
                                                              ? const Color(0xffD9117C)
                                                              : const Color(0xffFFFFFF),
                                                          dateColor:  _currentInex == index
                                                              ? const Color(0xffFFFFFF)
                                                              : const Color(0xff777777),
                                                          dayColor: _currentInex == index
                                                              ? const Color(0xffD9D9D9)
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
                                                              color: Color(0xffFFFFFF)
                                                          ),
                                                          )),
                                                    ),

                                                  ]
                                              );
                                            },
                                          ),


                                        ),
                                      ),),


                                    const SizedBox(height: 20,),


                                    SizedBox(
                                      height: MediaQuery.sizeOf(context).height*0.58,
                                      width: MediaQuery.sizeOf(context).width*1,
                                      child: SingleChildScrollView(
                                        physics: _physics,

                                        scrollDirection: Axis.vertical,

                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  onTap:(){
                                                    setState(() {
                                                      showDialog(context: context, builder: (BuildContext context) {
                                                        return



                                                          Entry.offset(
                                                              duration: const Duration(milliseconds: 800),
                                                              child:


                                                              BackdropFilter(
                                                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                                                child: Dialog(
                                                                  backgroundColor: const Color(0xFF212925),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(20),
                                                                  ),
                                                                  child: SingleChildScrollView(
                                                                    child: Container(
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        color: Colors.white,
                                                                      ),
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Stack(
                                                                            alignment: Alignment.bottomLeft,
                                                                            children: [
                                                                              const Image(
                                                                                  fit:BoxFit.cover,
                                                                                  image: AssetImage("assets/images/Rectangle 34624212.png")),
                                                                              const Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Image(
                                                                                    fit: BoxFit.fitWidth ,
                                                                                    image: AssetImage("assets/images/B.png")),
                                                                              ),

                                                                              Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(10.0),
                                                                                  child: Row(
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      const ReusableText(
                                                                                        title: 'Persian Spiced',
                                                                                        size: 16,
                                                                                        weight: FontWeight.w600,
                                                                                        color: Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const Spacer(),
                                                                                      InkWell(
                                                                                        onTap:_decrement,
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child: const Icon(
                                                                                            Icons.remove,color: Color(0xff000000),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      ReusableText(
                                                                                        title: '$_count',
                                                                                        size: 10,
                                                                                        weight: FontWeight.w600,
                                                                                        color: const Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      InkWell(
                                                                                        onTap:(){
                                                                                          setState(() {
                                                                                            _increment;
                                                                                          });
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child:  const Icon(
                                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                                        ),
                                                                                      ),

                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const Padding(
                                                                            padding: EdgeInsets.all(10.0),
                                                                            child: Column(children: [
                                                                              Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Icon(Icons.star,color: Color(0xffEBB52B),),
                                                                                  SizedBox(width: 10,),
                                                                                  ReusableText(
                                                                                    title: '4.5',
                                                                                    size: 16,
                                                                                    weight: FontWeight.w600,
                                                                                    color: Color(0xff000000),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(height: 10,),
                                                                              ReusableText(
                                                                                title: 'Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non. Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non.',
                                                                                size: 10,
                                                                                weight: FontWeight.w600,
                                                                                color: Color(0xff5C5C5C),
                                                                              ),

                                                                            ],),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ));


                                                      }, );
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 230,
                                                    width: MediaQuery.of(context).size.width*0.46,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        image: const DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage('assets/images/Rectangle 34624215.png')
                                                        )
                                                    ),
                                                    child: Stack(
                                                        children: [

                                                          const Positioned(
                                                            bottom: 0,
                                                            child: Image(
                                                                width: 189,
                                                                fit: BoxFit.fitWidth ,
                                                                image: AssetImage("assets/images/Rectangle 34624216.png")),
                                                          ),

                                                          Align(
                                                            alignment: Alignment.bottomLeft,

                                                            child: Padding(
                                                              padding: const EdgeInsets.all(10.0),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  const Image(

                                                                    image: AssetImage('assets/images/red.png'),),
                                                                  const SizedBox(height: 10,),
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      const ReusableText(
                                                                        title: 'Persian\nSpiced fish',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: Color(0xffFFFFFF),
                                                                      ),
                                                                      const Spacer(),
                                                                      InkWell(
                                                                        onTap:_decrement,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child: const Icon(
                                                                            Icons.remove,color: Color(0xff000000),

                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      ReusableText(
                                                                        title: '$_count',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: const Color(0xffFFFFFF),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      InkWell(
                                                                        onTap: _increment,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child:  const Icon(
                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),

                                                        ]
                                                    ),
                                                  ),
                                                ),
                                                const Spacer(),
                                                InkWell(
                                                  onTap:(){
                                                    setState(() {
                                                      showDialog(context: context, builder: (BuildContext context) {
                                                        return



                                                          Entry.offset(
                                                              duration: const Duration(milliseconds: 800),
                                                              child:


                                                              BackdropFilter(
                                                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                                                child: Dialog(
                                                                  backgroundColor: const Color(0xFF212925),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(20),
                                                                  ),
                                                                  child: SingleChildScrollView(
                                                                    child: Container(
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        color: Colors.white,
                                                                      ),
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Stack(
                                                                            alignment: Alignment.bottomLeft,
                                                                            children: [
                                                                              const Image(
                                                                                  fit:BoxFit.cover,
                                                                                  image: AssetImage("assets/images/Rectangle 34624212.png")),
                                                                              const Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Image(
                                                                                    fit: BoxFit.fitWidth ,
                                                                                    image: AssetImage("assets/images/B.png")),
                                                                              ),

                                                                              Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(10.0),
                                                                                  child: Row(
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      const ReusableText(
                                                                                        title: 'Persian Spiced',
                                                                                        size: 16,
                                                                                        weight: FontWeight.w600,
                                                                                        color: Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const Spacer(),
                                                                                      InkWell(
                                                                                        onTap:_decrement,
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child: const Icon(
                                                                                            Icons.remove,color: Color(0xff000000),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      ReusableText(
                                                                                        title: '$_count',
                                                                                        size: 10,
                                                                                        weight: FontWeight.w600,
                                                                                        color: const Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      InkWell(
                                                                                        onTap:(){
                                                                                          setState(() {
                                                                                            _increment;
                                                                                          });
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child:  const Icon(
                                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                                        ),
                                                                                      ),

                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const Padding(
                                                                            padding: EdgeInsets.all(10.0),
                                                                            child: Column(children: [
                                                                              Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Icon(Icons.star,color: Color(0xffEBB52B),),
                                                                                  SizedBox(width: 10,),
                                                                                  ReusableText(
                                                                                    title: '4.5',
                                                                                    size: 16,
                                                                                    weight: FontWeight.w600,
                                                                                    color: Color(0xff000000),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(height: 10,),
                                                                              ReusableText(
                                                                                title: 'Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non. Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non.',
                                                                                size: 10,
                                                                                weight: FontWeight.w600,
                                                                                color: Color(0xff5C5C5C),
                                                                              ),

                                                                            ],),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ));


                                                      }, );
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 230,
                                                    width: MediaQuery.of(context).size.width*0.46,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        image: const DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage('assets/images/Rectangle 34624215.png')
                                                        )
                                                    ),
                                                    child: Stack(
                                                        children: [

                                                          const Positioned(
                                                            bottom: 0,
                                                            child: Image(
                                                                width: 189,
                                                                fit: BoxFit.fitWidth ,
                                                                image: AssetImage("assets/images/Rectangle 34624216.png")),
                                                          ),

                                                          Align(
                                                            alignment: Alignment.bottomLeft,

                                                            child: Padding(
                                                              padding: const EdgeInsets.all(10.0),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  const Image(

                                                                    image: AssetImage('assets/images/NicePng_veg-png_2579531 1.png'),),
                                                                  const SizedBox(height: 10,),
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      const ReusableText(
                                                                        title: 'Persian\nSpiced fish',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: Color(0xffFFFFFF),
                                                                      ),
                                                                      const Spacer(),
                                                                      InkWell(
                                                                        onTap:_decrement,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child: const Icon(
                                                                            Icons.remove,color: Color(0xff000000),

                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      ReusableText(
                                                                        title: '$_count',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: const Color(0xffFFFFFF),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      InkWell(
                                                                        onTap: _increment,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child:  const Icon(
                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),

                                                        ]
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  onTap:(){
                                                    setState(() {
                                                      showDialog(context: context, builder: (BuildContext context) {
                                                        return



                                                          Entry.offset(
                                                              duration: const Duration(milliseconds: 800),
                                                              child:


                                                              BackdropFilter(
                                                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                                                child: Dialog(
                                                                  backgroundColor: const Color(0xFF212925),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(20),
                                                                  ),
                                                                  child: SingleChildScrollView(
                                                                    child: Container(
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        color: Colors.white,
                                                                      ),
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Stack(
                                                                            alignment: Alignment.bottomLeft,
                                                                            children: [
                                                                              const Image(
                                                                                  fit:BoxFit.cover,
                                                                                  image: AssetImage("assets/images/Rectangle 34624212.png")),
                                                                              const Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Image(
                                                                                    fit: BoxFit.fitWidth ,
                                                                                    image: AssetImage("assets/images/B.png")),
                                                                              ),

                                                                              Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(10.0),
                                                                                  child: Row(
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      const ReusableText(
                                                                                        title: 'Persian Spiced',
                                                                                        size: 16,
                                                                                        weight: FontWeight.w600,
                                                                                        color: Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const Spacer(),
                                                                                      InkWell(
                                                                                        onTap:_decrement,
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child: const Icon(
                                                                                            Icons.remove,color: Color(0xff000000),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      ReusableText(
                                                                                        title: '$_count',
                                                                                        size: 10,
                                                                                        weight: FontWeight.w600,
                                                                                        color: const Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      InkWell(
                                                                                        onTap:(){
                                                                                          setState(() {
                                                                                            _increment;
                                                                                          });
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child:  const Icon(
                                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                                        ),
                                                                                      ),

                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const Padding(
                                                                            padding: EdgeInsets.all(10.0),
                                                                            child: Column(children: [
                                                                              Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Icon(Icons.star,color: Color(0xffEBB52B),),
                                                                                  SizedBox(width: 10,),
                                                                                  ReusableText(
                                                                                    title: '4.5',
                                                                                    size: 16,
                                                                                    weight: FontWeight.w600,
                                                                                    color: Color(0xff000000),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(height: 10,),
                                                                              ReusableText(
                                                                                title: 'Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non. Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non.',
                                                                                size: 10,
                                                                                weight: FontWeight.w600,
                                                                                color: Color(0xff5C5C5C),
                                                                              ),

                                                                            ],),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ));


                                                      }, );
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 230,
                                                    width: MediaQuery.of(context).size.width*0.46,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        image: const DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage('assets/images/Rectangle 34624215.png')
                                                        )
                                                    ),
                                                    child: Stack(
                                                        children: [

                                                          const Positioned(
                                                            bottom: 0,
                                                            child: Image(
                                                                width: 189,
                                                                fit: BoxFit.fitWidth ,
                                                                image: AssetImage("assets/images/Rectangle 34624216.png")),
                                                          ),

                                                          Align(
                                                            alignment: Alignment.bottomLeft,

                                                            child: Padding(
                                                              padding: const EdgeInsets.all(10.0),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  const Image(

                                                                    image: AssetImage('assets/images/red.png'),),
                                                                  const SizedBox(height: 10,),
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      const ReusableText(
                                                                        title: 'Persian\nSpiced fish',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: Color(0xffFFFFFF),
                                                                      ),
                                                                      const Spacer(),
                                                                      InkWell(
                                                                        onTap:_decrement,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child: const Icon(
                                                                            Icons.remove,color: Color(0xff000000),

                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      ReusableText(
                                                                        title: '$_count',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: const Color(0xffFFFFFF),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      InkWell(
                                                                        onTap: _increment,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child:  const Icon(
                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),

                                                        ]
                                                    ),
                                                  ),
                                                ),
                                                const Spacer(),
                                                InkWell(
                                                  onTap:(){
                                                    setState(() {
                                                      showDialog(context: context, builder: (BuildContext context) {
                                                        return



                                                          Entry.offset(
                                                              duration: const Duration(milliseconds: 800),
                                                              child:


                                                              BackdropFilter(
                                                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                                                child: Dialog(
                                                                  backgroundColor: const Color(0xFF212925),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(20),
                                                                  ),
                                                                  child: SingleChildScrollView(
                                                                    child: Container(
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        color: Colors.white,
                                                                      ),
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Stack(
                                                                            alignment: Alignment.bottomLeft,
                                                                            children: [
                                                                              const Image(
                                                                                  fit:BoxFit.cover,
                                                                                  image: AssetImage("assets/images/Rectangle 34624212.png")),
                                                                              const Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Image(
                                                                                    fit: BoxFit.fitWidth ,
                                                                                    image: AssetImage("assets/images/B.png")),
                                                                              ),

                                                                              Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(10.0),
                                                                                  child: Row(
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      const ReusableText(
                                                                                        title: 'Persian Spiced',
                                                                                        size: 16,
                                                                                        weight: FontWeight.w600,
                                                                                        color: Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const Spacer(),
                                                                                      InkWell(
                                                                                        onTap:_decrement,
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child: const Icon(
                                                                                            Icons.remove,color: Color(0xff000000),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      ReusableText(
                                                                                        title: '$_count',
                                                                                        size: 10,
                                                                                        weight: FontWeight.w600,
                                                                                        color: const Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      InkWell(
                                                                                        onTap:(){
                                                                                          setState(() {
                                                                                            _increment;
                                                                                          });
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child:  const Icon(
                                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                                        ),
                                                                                      ),

                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const Padding(
                                                                            padding: EdgeInsets.all(10.0),
                                                                            child: Column(children: [
                                                                              Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Icon(Icons.star,color: Color(0xffEBB52B),),
                                                                                  SizedBox(width: 10,),
                                                                                  ReusableText(
                                                                                    title: '4.5',
                                                                                    size: 16,
                                                                                    weight: FontWeight.w600,
                                                                                    color: Color(0xff000000),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(height: 10,),
                                                                              ReusableText(
                                                                                title: 'Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non. Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non.',
                                                                                size: 10,
                                                                                weight: FontWeight.w600,
                                                                                color: Color(0xff5C5C5C),
                                                                              ),

                                                                            ],),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ));


                                                      }, );
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 230,
                                                    width: MediaQuery.of(context).size.width*0.46,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        image: const DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage('assets/images/Rectangle 34624215.png')
                                                        )
                                                    ),
                                                    child: Stack(
                                                        children: [

                                                          const Positioned(
                                                            bottom: 0,
                                                            child: Image(
                                                                width: 189,
                                                                fit: BoxFit.fitWidth ,
                                                                image: AssetImage("assets/images/Rectangle 34624216.png")),
                                                          ),

                                                          Align(
                                                            alignment: Alignment.bottomLeft,

                                                            child: Padding(
                                                              padding: const EdgeInsets.all(10.0),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  const Image(

                                                                    image: AssetImage('assets/images/NicePng_veg-png_2579531 1.png'),),
                                                                  const SizedBox(height: 10,),
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      const ReusableText(
                                                                        title: 'Persian\nSpiced fish',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: Color(0xffFFFFFF),
                                                                      ),
                                                                      const Spacer(),
                                                                      InkWell(
                                                                        onTap:_decrement,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child: const Icon(
                                                                            Icons.remove,color: Color(0xff000000),

                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      ReusableText(
                                                                        title: '$_count',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: const Color(0xffFFFFFF),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      InkWell(
                                                                        onTap: _increment,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child:  const Icon(
                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),

                                                        ]
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),



                                    const SizedBox(height: 20,),
                                    Container(
                                      height: 110,
                                      width: MediaQuery.sizeOf(context).width*1,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Color(0xffE21D6F),
                                              Color(0xff273279),
                                            ]
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              ReusableText(
                                                title: 'GRAB',
                                                size: 16,
                                                weight: FontWeight.w600,
                                                color: Color(0xffFFFFFF),
                                              ),
                                              SizedBox(width: 5,),
                                              Image(
                                                  height: 60,width: 60,
                                                  image: AssetImage("assets/images/20.png")),
                                              SizedBox(width: 5,),
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
                                            child:

                                            DottedBorder(
                                              radius: const Radius.circular(20),
                                              borderType: BorderType.RRect,
                                              color: const Color(0xffD9D9D9),
                                              strokeWidth: 2,
                                              child: Container(
                                                height: 26,
                                                width: 191,
                                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                                decoration: BoxDecoration(
                                                    borderRadius:BorderRadius.circular(20),
                                                    color: Colors.transparent
                                                ),
                                                child: const Center(child:  ReusableText(
                                                  title: 'Use code : AB000CC',
                                                  size: 12,
                                                  weight: FontWeight.w600,
                                                  color: Color(0xffFFFFFF),
                                                ),),
                                              ),


                                            ),
                                          ),
                                          const SizedBox(height: 6,)


                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 30,),

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,children: [
                                      InkWell(
                                        onTap: (){

                                        },
                                        child: Container(
                                          width: MediaQuery.sizeOf(context).width*0.46,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color: const Color(0xff273279)
                                          ),
                                          child: const Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image(image: AssetImage("assets/icons/Group (1).png")),
                                              SizedBox(width: 15,),
                                              ReusableText(
                                                title: 'Add to Cart',
                                                size: 16,
                                                weight: FontWeight.w600,
                                                color: Color(0xffFFFFFF),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: (){
                                          setState(() {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const CheckOutScreen()));
                                          });
                                        },
                                        child: Container(
                                          width: MediaQuery.sizeOf(context).width*0.46,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color: const Color(0xffD9117C)
                                          ),
                                          child: const Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image(image: AssetImage("assets/icons/Vector.png")),
                                              SizedBox(width: 15,),
                                              ReusableText(
                                                title: 'Checkout',
                                                size: 16,
                                                weight: FontWeight.w600,
                                                color: Color(0xffFFFFFF),
                                              ),
                                            ],
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

                        ),
                      ),
                    );
                  },
                ),
              ),
              AnimationLimiter(
                child: ListView.builder(
                  itemCount: 1,
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.vertical,shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(seconds:1),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child:


                          SizedBox(
                            height: MediaQuery.sizeOf(context).height*0.95,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,physics: const ScrollPhysics(),
                                child:

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Entry.offset(
                                      duration: const Duration(seconds: 1),
                                      child:    SingleChildScrollView(
                                        physics: _physics,
                                        scrollDirection: Axis.horizontal,
                                        child: SizedBox(
                                          width: MediaQuery.sizeOf(context).width*1,
                                          height: MediaQuery.sizeOf(context).height*0.12,
                                          child:
                                          ListView.builder(
                                            itemCount: list1.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context, int index) {
                                              return Stack(
                                                  children:
                                                  [
                                                    InkWell(
                                                      onTap: (){
                                                        setState(() {
                                                          _currentInex=index;
                                                          _isVisible=true;
                                                        });
                                                      },
                                                      child: CustomContainer(
                                                          date: list1[index].date.toString(),
                                                          day: list1[index].day.toString(),
                                                          borderColor: _currentInex == index
                                                              ? const Color(0xffE793B6)
                                                              : const Color(0xff1E1E1E),
                                                          containerColor:  _currentInex == index
                                                              ? const Color(0xffD9117C)
                                                              : const Color(0xffFFFFFF),
                                                          dateColor:  _currentInex == index
                                                              ? const Color(0xffFFFFFF)
                                                              : const Color(0xff777777),
                                                          dayColor: _currentInex == index
                                                              ? const Color(0xffD9D9D9)
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
                                                              color: Color(0xffFFFFFF)
                                                          ),
                                                          )),
                                                    ),

                                                  ]
                                              );
                                            },
                                          ),


                                        ),
                                      ),),


                                    const SizedBox(height: 20,),


                                    SizedBox(
                                      height: MediaQuery.sizeOf(context).height*0.58,
                                      width: MediaQuery.sizeOf(context).width*1,
                                      child: SingleChildScrollView(
                                        physics: _physics,

                                        scrollDirection: Axis.vertical,

                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  onTap:(){
                                                    setState(() {
                                                      showDialog(context: context, builder: (BuildContext context) {
                                                        return



                                                          Entry.offset(
                                                              duration: const Duration(milliseconds: 800),
                                                              child:


                                                              BackdropFilter(
                                                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                                                child: Dialog(
                                                                  backgroundColor: const Color(0xFF212925),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(20),
                                                                  ),
                                                                  child: SingleChildScrollView(
                                                                    child: Container(
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        color: Colors.white,
                                                                      ),
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Stack(
                                                                            alignment: Alignment.bottomLeft,
                                                                            children: [
                                                                              const Image(
                                                                                  fit:BoxFit.cover,
                                                                                  image: AssetImage("assets/images/Rectangle 34624212.png")),
                                                                              const Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Image(
                                                                                    fit: BoxFit.fitWidth ,
                                                                                    image: AssetImage("assets/images/B.png")),
                                                                              ),

                                                                              Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(10.0),
                                                                                  child: Row(
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      const ReusableText(
                                                                                        title: 'Persian Spiced',
                                                                                        size: 16,
                                                                                        weight: FontWeight.w600,
                                                                                        color: Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const Spacer(),
                                                                                      InkWell(
                                                                                        onTap:_decrement,
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child: const Icon(
                                                                                            Icons.remove,color: Color(0xff000000),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      ReusableText(
                                                                                        title: '$_count',
                                                                                        size: 10,
                                                                                        weight: FontWeight.w600,
                                                                                        color: const Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      InkWell(
                                                                                        onTap:(){
                                                                                          setState(() {
                                                                                            _increment;
                                                                                          });
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child:  const Icon(
                                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                                        ),
                                                                                      ),

                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const Padding(
                                                                            padding: EdgeInsets.all(10.0),
                                                                            child: Column(children: [
                                                                              Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Icon(Icons.star,color: Color(0xffEBB52B),),
                                                                                  SizedBox(width: 10,),
                                                                                  ReusableText(
                                                                                    title: '4.5',
                                                                                    size: 16,
                                                                                    weight: FontWeight.w600,
                                                                                    color: Color(0xff000000),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(height: 10,),
                                                                              ReusableText(
                                                                                title: 'Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non. Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non.',
                                                                                size: 10,
                                                                                weight: FontWeight.w600,
                                                                                color: Color(0xff5C5C5C),
                                                                              ),

                                                                            ],),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ));


                                                      }, );
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 230,
                                                    width: MediaQuery.of(context).size.width*0.46,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        image: const DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage('assets/images/Rectangle 34624215.png')
                                                        )
                                                    ),
                                                    child: Stack(
                                                        children: [

                                                          const Positioned(
                                                            bottom: 0,
                                                            child: Image(
                                                                width: 189,
                                                                fit: BoxFit.fitWidth ,
                                                                image: AssetImage("assets/images/Rectangle 34624216.png")),
                                                          ),

                                                          Align(
                                                            alignment: Alignment.bottomLeft,

                                                            child: Padding(
                                                              padding: const EdgeInsets.all(10.0),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  const Image(

                                                                    image: AssetImage('assets/images/red.png'),),
                                                                  const SizedBox(height: 10,),
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      const ReusableText(
                                                                        title: 'Persian\nSpiced fish',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: Color(0xffFFFFFF),
                                                                      ),
                                                                      const Spacer(),
                                                                      InkWell(
                                                                        onTap:_decrement,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child: const Icon(
                                                                            Icons.remove,color: Color(0xff000000),

                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      ReusableText(
                                                                        title: '$_count',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: const Color(0xffFFFFFF),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      InkWell(
                                                                        onTap: _increment,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child:  const Icon(
                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),

                                                        ]
                                                    ),
                                                  ),
                                                ),
                                                const Spacer(),
                                                InkWell(
                                                  onTap:(){
                                                    setState(() {
                                                      showDialog(context: context, builder: (BuildContext context) {
                                                        return



                                                          Entry.offset(
                                                              duration: const Duration(milliseconds: 800),
                                                              child:


                                                              BackdropFilter(
                                                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                                                child: Dialog(
                                                                  backgroundColor: const Color(0xFF212925),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(20),
                                                                  ),
                                                                  child: SingleChildScrollView(
                                                                    child: Container(
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        color: Colors.white,
                                                                      ),
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Stack(
                                                                            alignment: Alignment.bottomLeft,
                                                                            children: [
                                                                              const Image(
                                                                                  fit:BoxFit.cover,
                                                                                  image: AssetImage("assets/images/Rectangle 34624212.png")),
                                                                              const Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Image(
                                                                                    fit: BoxFit.fitWidth ,
                                                                                    image: AssetImage("assets/images/B.png")),
                                                                              ),

                                                                              Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(10.0),
                                                                                  child: Row(
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      const ReusableText(
                                                                                        title: 'Persian Spiced',
                                                                                        size: 16,
                                                                                        weight: FontWeight.w600,
                                                                                        color: Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const Spacer(),
                                                                                      InkWell(
                                                                                        onTap:_decrement,
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child: const Icon(
                                                                                            Icons.remove,color: Color(0xff000000),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      ReusableText(
                                                                                        title: '$_count',
                                                                                        size: 10,
                                                                                        weight: FontWeight.w600,
                                                                                        color: const Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      InkWell(
                                                                                        onTap:(){
                                                                                          setState(() {
                                                                                            _increment;
                                                                                          });
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child:  const Icon(
                                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                                        ),
                                                                                      ),

                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const Padding(
                                                                            padding: EdgeInsets.all(10.0),
                                                                            child: Column(children: [
                                                                              Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Icon(Icons.star,color: Color(0xffEBB52B),),
                                                                                  SizedBox(width: 10,),
                                                                                  ReusableText(
                                                                                    title: '4.5',
                                                                                    size: 16,
                                                                                    weight: FontWeight.w600,
                                                                                    color: Color(0xff000000),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(height: 10,),
                                                                              ReusableText(
                                                                                title: 'Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non. Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non.',
                                                                                size: 10,
                                                                                weight: FontWeight.w600,
                                                                                color: Color(0xff5C5C5C),
                                                                              ),

                                                                            ],),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ));


                                                      }, );
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 230,
                                                    width: MediaQuery.of(context).size.width*0.46,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        image: const DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage('assets/images/Rectangle 34624215.png')
                                                        )
                                                    ),
                                                    child: Stack(
                                                        children: [

                                                          const Positioned(
                                                            bottom: 0,
                                                            child: Image(
                                                                width: 189,
                                                                fit: BoxFit.fitWidth ,
                                                                image: AssetImage("assets/images/Rectangle 34624216.png")),
                                                          ),

                                                          Align(
                                                            alignment: Alignment.bottomLeft,

                                                            child: Padding(
                                                              padding: const EdgeInsets.all(10.0),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  const Image(

                                                                    image: AssetImage('assets/images/NicePng_veg-png_2579531 1.png'),),
                                                                  const SizedBox(height: 10,),
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      const ReusableText(
                                                                        title: 'Persian\nSpiced fish',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: Color(0xffFFFFFF),
                                                                      ),
                                                                      const Spacer(),
                                                                      InkWell(
                                                                        onTap:_decrement,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child: const Icon(
                                                                            Icons.remove,color: Color(0xff000000),

                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      ReusableText(
                                                                        title: '$_count',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: const Color(0xffFFFFFF),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      InkWell(
                                                                        onTap: _increment,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child:  const Icon(
                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),

                                                        ]
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  onTap:(){
                                                    setState(() {
                                                      showDialog(context: context, builder: (BuildContext context) {
                                                        return



                                                          Entry.offset(
                                                              duration: const Duration(milliseconds: 800),
                                                              child:


                                                              BackdropFilter(
                                                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                                                child: Dialog(
                                                                  backgroundColor: const Color(0xFF212925),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(20),
                                                                  ),
                                                                  child: SingleChildScrollView(
                                                                    child: Container(
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        color: Colors.white,
                                                                      ),
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Stack(
                                                                            alignment: Alignment.bottomLeft,
                                                                            children: [
                                                                              const Image(
                                                                                  fit:BoxFit.cover,
                                                                                  image: AssetImage("assets/images/Rectangle 34624212.png")),
                                                                              const Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Image(
                                                                                    fit: BoxFit.fitWidth ,
                                                                                    image: AssetImage("assets/images/B.png")),
                                                                              ),

                                                                              Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(10.0),
                                                                                  child: Row(
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      const ReusableText(
                                                                                        title: 'Persian Spiced',
                                                                                        size: 16,
                                                                                        weight: FontWeight.w600,
                                                                                        color: Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const Spacer(),
                                                                                      InkWell(
                                                                                        onTap:_decrement,
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child: const Icon(
                                                                                            Icons.remove,color: Color(0xff000000),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      ReusableText(
                                                                                        title: '$_count',
                                                                                        size: 10,
                                                                                        weight: FontWeight.w600,
                                                                                        color: const Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      InkWell(
                                                                                        onTap:(){
                                                                                          setState(() {
                                                                                            _increment;
                                                                                          });
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child:  const Icon(
                                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                                        ),
                                                                                      ),

                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const Padding(
                                                                            padding: EdgeInsets.all(10.0),
                                                                            child: Column(children: [
                                                                              Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Icon(Icons.star,color: Color(0xffEBB52B),),
                                                                                  SizedBox(width: 10,),
                                                                                  ReusableText(
                                                                                    title: '4.5',
                                                                                    size: 16,
                                                                                    weight: FontWeight.w600,
                                                                                    color: Color(0xff000000),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(height: 10,),
                                                                              ReusableText(
                                                                                title: 'Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non. Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non.',
                                                                                size: 10,
                                                                                weight: FontWeight.w600,
                                                                                color: Color(0xff5C5C5C),
                                                                              ),

                                                                            ],),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ));


                                                      }, );
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 230,
                                                    width: MediaQuery.of(context).size.width*0.46,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        image: const DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage('assets/images/Rectangle 34624215.png')
                                                        )
                                                    ),
                                                    child: Stack(
                                                        children: [

                                                          const Positioned(
                                                            bottom: 0,
                                                            child: Image(
                                                                width: 189,
                                                                fit: BoxFit.fitWidth ,
                                                                image: AssetImage("assets/images/Rectangle 34624216.png")),
                                                          ),

                                                          Align(
                                                            alignment: Alignment.bottomLeft,

                                                            child: Padding(
                                                              padding: const EdgeInsets.all(10.0),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  const Image(

                                                                    image: AssetImage('assets/images/red.png'),),
                                                                  const SizedBox(height: 10,),
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      const ReusableText(
                                                                        title: 'Persian\nSpiced fish',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: Color(0xffFFFFFF),
                                                                      ),
                                                                      const Spacer(),
                                                                      InkWell(
                                                                        onTap:_decrement,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child: const Icon(
                                                                            Icons.remove,color: Color(0xff000000),

                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      ReusableText(
                                                                        title: '$_count',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: const Color(0xffFFFFFF),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      InkWell(
                                                                        onTap: _increment,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child:  const Icon(
                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),

                                                        ]
                                                    ),
                                                  ),
                                                ),
                                                const Spacer(),
                                                InkWell(
                                                  onTap:(){
                                                    setState(() {
                                                      showDialog(context: context, builder: (BuildContext context) {
                                                        return



                                                          Entry.offset(
                                                              duration: const Duration(milliseconds: 800),
                                                              child:


                                                              BackdropFilter(
                                                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                                                child: Dialog(
                                                                  backgroundColor: const Color(0xFF212925),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(20),
                                                                  ),
                                                                  child: SingleChildScrollView(
                                                                    child: Container(
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        color: Colors.white,
                                                                      ),
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Stack(
                                                                            alignment: Alignment.bottomLeft,
                                                                            children: [
                                                                              const Image(
                                                                                  fit:BoxFit.cover,
                                                                                  image: AssetImage("assets/images/Rectangle 34624212.png")),
                                                                              const Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Image(
                                                                                    fit: BoxFit.fitWidth ,
                                                                                    image: AssetImage("assets/images/B.png")),
                                                                              ),

                                                                              Align(
                                                                                alignment: Alignment.bottomLeft,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(10.0),
                                                                                  child: Row(
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      const ReusableText(
                                                                                        title: 'Persian Spiced',
                                                                                        size: 16,
                                                                                        weight: FontWeight.w600,
                                                                                        color: Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const Spacer(),
                                                                                      InkWell(
                                                                                        onTap:_decrement,
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child: const Icon(
                                                                                            Icons.remove,color: Color(0xff000000),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      ReusableText(
                                                                                        title: '$_count',
                                                                                        size: 10,
                                                                                        weight: FontWeight.w600,
                                                                                        color: const Color(0xffFFFFFF),
                                                                                      ),
                                                                                      const SizedBox(width: 10,),
                                                                                      InkWell(
                                                                                        onTap:(){
                                                                                          setState(() {
                                                                                            _increment;
                                                                                          });
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                            color: const Color(0xffDBDBDB)
                                                                                        ),
                                                                                          child:  const Icon(
                                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                                        ),
                                                                                      ),

                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const Padding(
                                                                            padding: EdgeInsets.all(10.0),
                                                                            child: Column(children: [
                                                                              Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Icon(Icons.star,color: Color(0xffEBB52B),),
                                                                                  SizedBox(width: 10,),
                                                                                  ReusableText(
                                                                                    title: '4.5',
                                                                                    size: 16,
                                                                                    weight: FontWeight.w600,
                                                                                    color: Color(0xff000000),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(height: 10,),
                                                                              ReusableText(
                                                                                title: 'Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non. Lorem ipsum dolor sit amet consectetur. Interdum malesuada hendrerit rhoncus velit est facilisis interdum tellus nulla. Duis viverra quis in ullamcorper non.',
                                                                                size: 10,
                                                                                weight: FontWeight.w600,
                                                                                color: Color(0xff5C5C5C),
                                                                              ),

                                                                            ],),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ));


                                                      }, );
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 230,
                                                    width: MediaQuery.of(context).size.width*0.46,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        image: const DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage('assets/images/Rectangle 34624215.png')
                                                        )
                                                    ),
                                                    child: Stack(
                                                        children: [

                                                          const Positioned(
                                                            bottom: 0,
                                                            child: Image(
                                                                width: 189,
                                                                fit: BoxFit.fitWidth ,
                                                                image: AssetImage("assets/images/Rectangle 34624216.png")),
                                                          ),

                                                          Align(
                                                            alignment: Alignment.bottomLeft,

                                                            child: Padding(
                                                              padding: const EdgeInsets.all(10.0),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  const Image(

                                                                    image: AssetImage('assets/images/NicePng_veg-png_2579531 1.png'),),
                                                                  const SizedBox(height: 10,),
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      const ReusableText(
                                                                        title: 'Persian\nSpiced fish',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: Color(0xffFFFFFF),
                                                                      ),
                                                                      const Spacer(),
                                                                      InkWell(
                                                                        onTap:_decrement,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child: const Icon(
                                                                            Icons.remove,color: Color(0xff000000),

                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      ReusableText(
                                                                        title: '$_count',
                                                                        size: 10,
                                                                        weight: FontWeight.w600,
                                                                        color: const Color(0xffFFFFFF),
                                                                      ),
                                                                      const SizedBox(width: 10,),
                                                                      InkWell(
                                                                        onTap: _increment,
                                                                        child: Container(
                                                                          height: 25,width: 25,decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: const Color(0xffDBDBDB)
                                                                        ),
                                                                          child:  const Icon(
                                                                            Icons.add,color: Color(0xff1A1A1A),),
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),

                                                        ]
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),



                                    const SizedBox(height: 20,),
                                    Container(
                                      height: 110,
                                      width: MediaQuery.sizeOf(context).width*1,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Color(0xffE21D6F),
                                              Color(0xff273279),
                                            ]
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              ReusableText(
                                                title: 'GRAB',
                                                size: 16,
                                                weight: FontWeight.w600,
                                                color: Color(0xffFFFFFF),
                                              ),
                                              SizedBox(width: 5,),
                                              Image(
                                                  height: 60,width: 60,
                                                  image: AssetImage("assets/images/20.png")),
                                              SizedBox(width: 5,),
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
                                            child:

                                            DottedBorder(
                                              radius: const Radius.circular(20),
                                              borderType: BorderType.RRect,
                                              color: const Color(0xffD9D9D9),
                                              strokeWidth: 2,
                                              child: Container(
                                                height: 26,
                                                width: 191,
                                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                                decoration: BoxDecoration(
                                                    borderRadius:BorderRadius.circular(20),
                                                    color: Colors.transparent
                                                ),
                                                child: const Center(child:  ReusableText(
                                                  title: 'Use code : AB000CC',
                                                  size: 12,
                                                  weight: FontWeight.w600,
                                                  color: Color(0xffFFFFFF),
                                                ),),
                                              ),


                                            ),
                                          ),
                                          const SizedBox(height: 6,)


                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 30,),

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,children: [
                                      InkWell(
                                        onTap: (){

                                        },
                                        child: Container(
                                          width: MediaQuery.sizeOf(context).width*0.46,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color: const Color(0xff273279)
                                          ),
                                          child: const Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image(image: AssetImage("assets/icons/Group (1).png")),
                                              SizedBox(width: 15,),
                                              ReusableText(
                                                title: 'Add to Cart',
                                                size: 16,
                                                weight: FontWeight.w600,
                                                color: Color(0xffFFFFFF),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: (){
                                          setState(() {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const CheckOutScreen()));
                                          });
                                        },
                                        child: Container(
                                          width: MediaQuery.sizeOf(context).width*0.46,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color: const Color(0xffD9117C)
                                          ),
                                          child: const Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image(image: AssetImage("assets/icons/Vector.png")),
                                              SizedBox(width: 15,),
                                              ReusableText(
                                                title: 'Checkout',
                                                size: 16,
                                                weight: FontWeight.w600,
                                                color: Color(0xffFFFFFF),
                                              ),
                                            ],
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

                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
    ),
    );
  }
}



