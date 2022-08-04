import 'package:demo_proj_00/const.dart';
import 'package:demo_proj_00/utils/app_Styles.dart';
import 'package:demo_proj_00/utils/app_layout.dart';
import 'package:demo_proj_00/widgets/double_text.dart';
import 'package:demo_proj_00/widgets/icon_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getHeight(20),
          vertical: AppLayout.getHeight(20),
        ),
        children: [
          Gap(AppLayout.getHeight(40)),
          Text(
            'What are you looking for?',
            style: Styles.headLineStyle1
                .copyWith(fontSize: AppLayout.getWidth(35)),
          ),
          Gap(AppLayout.getHeight(20)),
          FittedBox(
            child: Container(
              padding: EdgeInsets.all(AppLayout.getHeight(3.5)),
              child: Row(
                children: [
                  //take a trip
                  Container(
                    width: size.width * .44,
                    padding: EdgeInsets.all(AppLayout.getHeight(7)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(
                          AppLayout.getHeight(50),
                        ),
                      ),
                      color: Colors.white,
                    ),
                    child: Center(child: Text("Make a Trip")),
                  ),
                  //tour spots
                  Container(
                    width: size.width * .44,
                    padding: EdgeInsets.all(AppLayout.getHeight(7)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(
                          AppLayout.getHeight(50),
                        ),
                      ),
                      color: Colors.transparent,
                    ),
                    child: Center(child: Text("Tour Spots")),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppLayout.getHeight(50),
                ),
                color: const Color(0xFFF4F6FD),
              ),
            ),
          ),
          Gap(AppLayout.getHeight(25)),
          IconText(icon: Icons.pin_drop_outlined, text: 'Pickup'),
          Gap(AppLayout.getHeight(20)),
          IconText(icon: Icons.pin_drop_outlined, text: 'Drop'),
          Gap(AppLayout.getHeight(25)),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getWidth(15),
              vertical: AppLayout.getHeight(15),
            ),
            decoration: BoxDecoration(
                color: Color(0xFFD91130CE),
                borderRadius: BorderRadius.circular(
                  AppLayout.getWidth(10),
                )),
            child: Center(
              child: Text(
                'Find Trips',
                style: Styles.textStyle.copyWith(color: Colors.white),
              ),
            ),
          ),
          Gap(AppLayout.getHeight(30)),
          DoubleText(bigText: 'Upcoming Trips', smallText: 'View all'),
          Gap(AppLayout.getHeight(15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: AppLayout.getHeight(400),
                width: size.width * 0.42,
                padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getWidth(15),
                  vertical: AppLayout.getHeight(15),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1,
                        spreadRadius: 1,
                        color: Colors.grey.shade200)
                  ],
                  borderRadius: BorderRadius.circular(
                    AppLayout.getHeight(20),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: AppLayout.getHeight(190),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppLayout.getHeight(12),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/taxi.png'),
                        ),
                      ),
                    ),
                    Gap(AppLayout.getHeight(12)),
                    Text(
                      "40% off on early bookings for this tour spots, Don't miss it",
                      style: Styles.headLineStyle2,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.width * 0.44,
                        height: AppLayout.getHeight(190),
                        decoration: BoxDecoration(
                            color: Color(0xFF3ABBBB),
                            borderRadius:
                                BorderRadius.circular(AppLayout.getHeight(18))),
                        padding: EdgeInsets.symmetric(
                          horizontal: AppLayout.getHeight(15),
                          vertical: AppLayout.getHeight(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Discount\nfor Survey',
                              style: Styles.headLineStyle2.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Gap(AppLayout.getHeight(10)),
                            Text(
                              'Take a survey and get discount on your trip',
                              style: Styles.headLineStyle3.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: -45,
                        top: -30,
                        child: Container(
                          padding: EdgeInsets.all(AppLayout.getHeight(30)),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 18,
                              color: Color(0xFF189999),
                            ),
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(AppLayout.getHeight(15)),
                  Container(
                    width: size.width * 0.44,
                    height: AppLayout.getHeight(190),
                    padding: EdgeInsets.symmetric(
                        horizontal: AppLayout.getHeight(15),
                        vertical: AppLayout.getHeight(15)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppLayout.getHeight(18),
                      ),
                      color: Colors.orange,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Take love',
                          style: Styles.headLineStyle2.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Gap(AppLayout.getHeight(5)),
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: '😙',
                              style: TextStyle(
                                fontSize: 30,
                              )),
                          TextSpan(
                              text: '😍',
                              style: TextStyle(
                                fontSize: 50,
                              )),
                          TextSpan(
                              text: '😎',
                              style: TextStyle(
                                fontSize: 30,
                              ))
                        ]))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
