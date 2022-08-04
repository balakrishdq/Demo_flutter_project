import 'package:demo_proj_00/utils/app_Styles.dart';
import 'package:demo_proj_00/utils/app_layout.dart';
import 'package:demo_proj_00/utils/app_list_info.dart';
import 'package:demo_proj_00/views/screens/tour_places.dart';
import 'package:demo_proj_00/views/screens/trip_details.dart';
import 'package:demo_proj_00/widgets/double_text.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      // appBar: AppBar(
      //   backgroundColor: backgroundColor,
      //   title: Text(
      //     'Home Screen',
      //   ),
      //   actions: <Widget>[
      //     IconButton(
      //       onPressed: () async {
      //         await AuthController().signOut();
      //       },
      //       icon: Icon(
      //         Icons.logout,
      //       ),
      //     ),
      //   ],
      // ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getHeight(20),
            ),
            child: Column(
              children: [
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning',
                          style: Styles.headLineStyle3,
                        ),
                        Gap(5),
                        Text(
                          'Book A Trip',
                          style: Styles.headLineStyle1,
                        ),
                      ],
                    ),
                    Container(
                      height: AppLayout.getHeight(50),
                      width: AppLayout.getHeight(50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage("assets/images/img_1.webp"),
                        ),
                      ),
                    )
                  ],
                ),
                const Gap(25),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFF4F6FD),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.getHeight(12),
                      vertical: AppLayout.getHeight(12)),
                  child: Row(
                    children: [
                      const Icon(
                        FluentSystemIcons.ic_fluent_search_regular,
                        color: Color(0xFFBFC205),
                      ),
                      Text(
                        "Search",
                        style: Styles.headLineStyle4,
                      ),
                    ],
                  ),
                ),
                Gap(AppLayout.getHeight(40)),
                DoubleText(bigText: 'Upcoming Trips', smallText: 'View all'),
              ],
            ),
          ),
          Gap(AppLayout.getHeight(40)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(
              left: AppLayout.getHeight(20),
            ),
            child: Row(
              children: tripList
                  .map((Singletrip) => TripDetails(trip: Singletrip))
                  .toList(),
            ),
          ),
          Gap(AppLayout.getHeight(10)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20)),
            child: DoubleText(
              bigText: 'Tour Spots',
              smallText: 'View all',
            ),
          ),
          Gap(AppLayout.getHeight(15)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(
              left: AppLayout.getHeight(20),
            ),
            child: Row(
              children: tourPlaceList
                  .map((Singletour) => TourPlaces(tour: Singletour))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
