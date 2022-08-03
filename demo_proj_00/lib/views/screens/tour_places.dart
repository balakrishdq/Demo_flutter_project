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
      height: 350,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      margin: const EdgeInsets.only(right: 17, top: 10),
      decoration: BoxDecoration(
        color: Styles.primaryColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 20,
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Styles.primaryColor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/${tour['image']}'),
              ),
            ),
          ),
          const Gap(10),
          Text(
            '${tour['place']}',
            style: Styles.headLineStyle2.copyWith(color: Styles.kakiColor),
          ),
          const Gap(5),
          Text(
            '${tour['destination']}',
            style: Styles.headLineStyle3.copyWith(color: Colors.white),
          ),
          const Gap(10),
          Text(
            '${tour['state']}',
            style: Styles.headLineStyle1.copyWith(color: Styles.kakiColor),
          ),
        ],
      ),
    );
  }
}
