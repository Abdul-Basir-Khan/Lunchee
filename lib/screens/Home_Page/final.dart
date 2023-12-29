import 'package:flutter/material.dart';

import '../constant/reusable_text.dart';
import 'package:entry/entry.dart';

class FinallScreen extends StatefulWidget {
  const FinallScreen({super.key});

  @override
  State<FinallScreen> createState() => _FinallScreenState();
}

class _FinallScreenState extends State<FinallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Entry.scale(child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [



              const Spacer(),
              const Row(
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage("assets/images/Group 1000004228 (1).png")),
                      SizedBox(height: 15,),
                      ReusableText(
                        title: 'You order successfully\nplaced!',
                        size: 18,
                        weight: FontWeight.w600,
                        color: Color(0xff1A1A1A),
                        alignment: TextAlign.center,
                      ),

                    ],
                  ),

                ],
              ),
              const Spacer(),
              InkWell(
                onTap: (){
                  setState(() {

                  });
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width*1,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffD9117C)
                  ),
                  child: const Center(
                    child: ReusableText(
                      title: 'View my orders',
                      size: 16,
                      weight: FontWeight.w600,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),

            ],
          ),
        ),
        )


    );
  }
}

