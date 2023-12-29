import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lunchee/screens/Home_Page/final.dart';

import '../constant/reusable_text.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int _count1 = 0;

  void _increment1() {
    setState(() {
      _count1++;
    });
  }

  void _decrement1() {
    if (_count1 > 0) {
      setState(() {
        _count1--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:AnimationLimiter(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(seconds: 1),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child:   SizedBox(
                    height: MediaQuery.sizeOf(context).height*0.95,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xf6CDCDCD),
                                ),
                                child: IconButton(
                                  icon: const Icon(  Icons.arrow_back_outlined,
                                    color: Color(0xffFFFFFF),),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              const Spacer(),
                              const ReusableText(
                                title: 'Checkout',
                                size: 18,
                                weight: FontWeight.w600,
                                color: Color(0xff1A1A1A),
                              ),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Image(
                                image:
                                AssetImage("assets/images/chop-removebg-preview 2.png"),
                              ),
                              const SizedBox(width: 15,),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/images/NicePng_veg-png_2579531 1.png"),
                                  ),
                                  SizedBox(height: 7,),
                                  ReusableText(
                                    title: 'Persian Spiced X1',
                                    size: 12,
                                    weight: FontWeight.w500,
                                    color: Color(0xff2F2F2F),
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ReusableText(
                                        title: 'QAR-',
                                        size: 11,
                                        weight: FontWeight.w600,
                                        color: Color(0xff808080),
                                      ),
                                      ReusableText(
                                        title: '  54.00',
                                        size: 11,
                                        weight: FontWeight.w600,
                                        color: Color(0xff273279),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Image(image: AssetImage("assets/icons/Trash.png")),
                                  const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: _decrement1,
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              color: const Color(0xffDBDBDB)),
                                          child: const Icon(
                                            Icons.remove,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      ReusableText(
                                        title: '$_count1',
                                        size: 10,
                                        weight: FontWeight.w600,
                                        color: const Color(0xff1A1A1A),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _increment1;
                                          });
                                        },
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              color: const Color(0xffDBDBDB)),
                                          child: const Icon(
                                            Icons.add,
                                            color: Color(0xff1A1A1A),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 25,),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Image(
                                image:
                                AssetImage("assets/images/chop-removebg-preview 2.png"),
                              ),
                              const SizedBox(width: 15,),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/images/NicePng_veg-png_2579531 1.png"),
                                  ),
                                  SizedBox(height: 7,),
                                  ReusableText(
                                    title: 'Persian Spiced X1',
                                    size: 12,
                                    weight: FontWeight.w500,
                                    color: Color(0xff2F2F2F),
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ReusableText(
                                        title: 'QAR-',
                                        size: 11,
                                        weight: FontWeight.w600,
                                        color: Color(0xff808080),
                                      ),
                                      ReusableText(
                                        title: '  54.00',
                                        size: 11,
                                        weight: FontWeight.w600,
                                        color: Color(0xff273279),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Image(image: AssetImage("assets/icons/Trash.png")),
                                  const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: _decrement1,
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              color: const Color(0xffDBDBDB)),
                                          child: const Icon(
                                            Icons.remove,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      ReusableText(
                                        title: '$_count1',
                                        size: 10,
                                        weight: FontWeight.w600,
                                        color: const Color(0xff1A1A1A),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _increment1;
                                          });
                                        },
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              color: const Color(0xffDBDBDB)),
                                          child: const Icon(
                                            Icons.add,
                                            color: Color(0xff1A1A1A),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 25,),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Image(
                                image:
                                AssetImage("assets/images/chop-removebg-preview 2.png"),
                              ),
                              const SizedBox(width: 15,),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/images/NicePng_veg-png_2579531 1.png"),
                                  ),
                                  SizedBox(height: 7,),
                                  ReusableText(
                                    title: 'Persian Spiced X1',
                                    size: 12,
                                    weight: FontWeight.w500,
                                    color: Color(0xff2F2F2F),
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ReusableText(
                                        title: 'QAR-',
                                        size: 11,
                                        weight: FontWeight.w600,
                                        color: Color(0xff808080),
                                      ),
                                      ReusableText(
                                        title: '  54.00',
                                        size: 11,
                                        weight: FontWeight.w600,
                                        color: Color(0xff273279),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Image(image: AssetImage("assets/icons/Trash.png")),
                                  const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: _decrement1,
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              color: const Color(0xffDBDBDB)),
                                          child: const Icon(
                                            Icons.remove,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      ReusableText(
                                        title: '$_count1',
                                        size: 10,
                                        weight: FontWeight.w600,
                                        color: const Color(0xff1A1A1A),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _increment1;
                                          });
                                        },
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              color: const Color(0xffDBDBDB)),
                                          child: const Icon(
                                            Icons.add,
                                            color: Color(0xff1A1A1A),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 40,),
                          DottedBorder(
                            radius: const Radius.circular(12),
                            borderType: BorderType.RRect,
                            color: const Color(0xf6CDCDCD),
                            strokeWidth: 2,
                            child:   SizedBox(
                              height: 53,
                              child: TextField(
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  suffixIcon: Container(
                                    height: 51,width: 98,decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: const Color(0xffD9117C)
                                  ),
                                    child: const Center(
                                      child: ReusableText(
                                        title: 'Apply',
                                        size: 14,
                                        weight: FontWeight.w600,
                                        color: Color(0xffFFFFFF),
                                      ),
                                    ),
                                  ),
                                  hintStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff1A1A1A)),
                                  filled: true,
                                  fillColor: const Color(0xffFFFFFF),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: "Enter voucher code",
                                ),
                              ),
                            ),


                          ),
                          const SizedBox(height: 30,),
                          const Divider(thickness: 2,height: 2,color: Color(0xffD9D9D9),),

                          const SizedBox(height: 30,),
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xffFFFFFF)
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(7),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffD9D9D9)
                                  ),
                                  child: const Icon(Icons.location_on_outlined,color: Color(0xff000000),),
                                ),
                                const SizedBox(width: 10,),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ReusableText(
                                      title: 'Lusail plaza tower 4',
                                      size: 16,
                                      weight: FontWeight.w600,
                                      color: Color(0xff3A3A3A),
                                    ),
                                    SizedBox(height: 10,),
                                    ReusableText(
                                      title: 'Westbay, Doha',
                                      size: 14,
                                      weight: FontWeight.w600,
                                      color: Color(0xff1A1A1A),
                                    ),

                                  ],
                                ),
                                const Spacer(),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ReusableText(
                                      title: 'Change',
                                      size: 12,
                                      weight: FontWeight.w600,
                                      color: Color(0xffE793B6),
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Icon(Icons.navigation,color: Color(0xff000000),),
                                        ReusableText(
                                          title: 'Westbay, Doha',
                                          size: 14,
                                          weight: FontWeight.w600,
                                          color: Color(0xff1A1A1A),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 45,),
                          InkWell(
                            onTap: (){
                              setState(() {

                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const FinallScreen()));
                              });
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width*1,
                              height: 72,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xffE21D6F),
                                      Color(0xff273279),
                                    ]
                                ),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ReusableText(
                                        title: 'Subscribe your meal',
                                        size: 16,
                                        weight: FontWeight.w600,
                                        color: Color(0xffFFFFFF),
                                      ),
                                      Icon(Icons.arrow_forward,color: Colors.white,size:36,)

                                    ],
                                  ),


                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 25,),
                          InkWell(
                            onTap: (){
                              setState(() {

                              });
                            },
                            child: Container(

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
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),



    );
  }
}
