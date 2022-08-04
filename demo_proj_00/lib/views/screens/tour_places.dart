import 'package:demo_proj_00/utils/app_Styles.dart';
import 'package:demo_proj_00/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TourPlaces extends StatelessWidget {
  final Map<String, dynamic> tour;
  const TourPlaces({Key? key, required this.tour}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Tour place state is ${tour['state']}');
    final size = AppLayout.getSize(context);
    return Container(
      width: size.width * 0.6,
      height: AppLayout.getHeight(350),
      padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getHeight(15),
          vertical: AppLayout.getHeight(17)),
      margin: EdgeInsets.only(
        right: AppLayout.getHeight(17),
        top: AppLayout.getHeight(10),
      ),
      decoration: BoxDecoration(
        color: Styles.primaryColor,
        borderRadius: BorderRadius.circular(AppLayout.getHeight(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: AppLayout.getHeight(20),
            spreadRadius: AppLayout.getHeight(5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: AppLayout.getHeight(180),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppLayout.getHeight(22)),
              color: Styles.primaryColor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/${tour['image']}'),
              ),
            ),
          ),
          Gap(AppLayout.getHeight(10)),
          Text(
            '${tour['place']}',
            style: Styles.headLineStyle2.copyWith(color: Styles.kakiColor),
          ),
          Gap(AppLayout.getHeight(5)),
          Text(
            '${tour['destination']}',
            style: Styles.headLineStyle3.copyWith(color: Colors.white),
          ),
          Gap(AppLayout.getHeight(10)),
          Text(
            '${tour['state']}',
            style: Styles.headLineStyle1.copyWith(color: Styles.kakiColor),
          ),
        ],
      ),
    );
  }
}
