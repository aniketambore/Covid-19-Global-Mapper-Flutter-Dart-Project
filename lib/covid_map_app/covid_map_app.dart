import 'package:covid19_global_mapper/covid_map_app/model/covid.dart';
import 'package:covid19_global_mapper/covid_map_app/network/network.dart';
import 'package:covid19_global_mapper/covid_map_app/ui/bottom_view.dart';
import 'package:covid19_global_mapper/covid_map_app/ui/mid_view.dart';
import 'package:covid19_global_mapper/covid_map_app/util/colors.dart';
import 'package:flutter/material.dart';

class CovidApp extends StatefulWidget {
  @override
  _CovidAppState createState() => _CovidAppState();
}

class _CovidAppState extends State<CovidApp> {
  Future<Covid> _covidData ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _covidData = Network().getCovidData() ;

    _covidData.then((value) => {
      print("Name ${value.data[96].name} , ${value.data[96].updatedAt}")
    }) ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: backgroundColor,

      appBar: AppBar(
        title: Text("Covid-19 Global Mapper"),
        centerTitle: true,
        backgroundColor: Color(0XFF000018),
      ),
      body: ListView(
        children: <Widget>[
//          Center(child: Text("Covid-19")),
          Container(
            child: FutureBuilder<Covid>(
              future: _covidData,
              builder: (BuildContext context , AsyncSnapshot<Covid> snapshot){
                if(snapshot.hasData){
//                  var update_date = snapshot.data.data[96].updatedAt ;
//                  return Center(child: Text("Last updated ${update_date.substring(0,10)}")) ;
                    return Column(
                      children: <Widget>[
                        topView(snapshot),
                        MidView(snapshot: snapshot,),
                        BottomView(snapshot: snapshot,)
                      ],
                    );
                }else{
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ) ;
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget topView(AsyncSnapshot<Covid> snapshot) {
    var update_date = snapshot.data.data[96].updatedAt ;

    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Last updated ${update_date.substring(0,10)}" , style: TextStyle(color: textColorOne , fontStyle: FontStyle.italic , fontSize: 17),),
          )
        ],
      )
    );
  }
}
