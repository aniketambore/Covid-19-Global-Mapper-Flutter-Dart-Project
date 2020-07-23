import 'package:covid19_global_mapper/covid_map_app/model/covid.dart';
import 'package:covid19_global_mapper/covid_map_app/util/colors.dart';
import 'package:flutter/material.dart';

class MidView extends StatelessWidget {
  final AsyncSnapshot<Covid> snapshot;

  const MidView({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text("All Countries Data" , style: TextStyle(color: textColorThree , fontSize: 20),),
        ),

        Row(
          children: <Widget>[
            Expanded(child: Text("Country" , textAlign: TextAlign.center, style: TextStyle(color: textColorThree , fontSize: 18 , fontWeight: FontWeight.w900),),),
            Expanded(child:Text("Confirmed", textAlign: TextAlign.center, style: TextStyle(color: confirmedButton , fontSize: 18 , fontWeight: FontWeight.w900))),
            Expanded(child: Text("Recovered", textAlign: TextAlign.center, style: TextStyle(color: recoveredButton , fontSize: 18 , fontWeight: FontWeight.w900))),
            Expanded(child:Text("Death", textAlign: TextAlign.center, style: TextStyle(color: deathsButton , fontSize: 18 , fontWeight: FontWeight.w900)))
          ],
        ),

        dataList(context)


      ],
    );
  }

  Widget dataList(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data.data.length,
          itemBuilder: (context, int index) {
            var name = snapshot.data.data[index].name;
            var confirmed = snapshot.data.data[index].latestData.confirmed;

            if (name.length > 11) {
              name = snapshot.data.data[index].code ;
            }


            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Divider(height: 5.0, color: textColorOne,),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Expanded(child: Text(name, style: TextStyle(color: textColorFour , fontWeight: FontWeight.w700 , fontSize: 14),)) ,
                      Expanded(child: Text(snapshot.data.data[index].latestData.confirmed.toString(),textAlign: TextAlign.end , style: TextStyle(color: textColorFour , fontWeight: FontWeight.w600 , fontSize: 18))) ,
                      Expanded(child: Text(snapshot.data.data[index].latestData.recovered.toString(),textAlign: TextAlign.end , style: TextStyle(color: textColorFour , fontWeight: FontWeight.w600 , fontSize: 18))) ,
                      Expanded(child: Text(snapshot.data.data[index].latestData.deaths.toString(),textAlign: TextAlign.end , style: TextStyle(color: textColorFour , fontWeight: FontWeight.w600 , fontSize: 18))) ,
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}



