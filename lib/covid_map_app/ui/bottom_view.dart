import 'package:covid19_global_mapper/covid_map_app/model/covid.dart';
import 'package:covid19_global_mapper/covid_map_app/ui/map_route.dart';
import 'package:covid19_global_mapper/covid_map_app/util/colors.dart';
import 'package:flutter/material.dart';

class BottomView extends StatelessWidget {
  final AsyncSnapshot<Covid> snapshot;

  const BottomView({Key key, this.snapshot}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        child: InkWell(
          child: Container(
            width: 150,
            height: 50,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: backgroundColor,
              border: Border.all(color: showMapTapped , width: 1.2)
            ),
            child: Center(child: Text("SHOW MAP" , style: TextStyle(fontSize: 17.0 , color: textColorOne , fontWeight: FontWeight.w700),)),
          ),
          onTap: () => {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => CovidMapView(),
            ))
          },
        ),
      ),
    );
  }
}
