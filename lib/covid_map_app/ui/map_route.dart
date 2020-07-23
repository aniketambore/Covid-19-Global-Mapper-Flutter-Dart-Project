import 'dart:async';

import 'package:covid19_global_mapper/covid_map_app/model/covid.dart';
import 'package:covid19_global_mapper/covid_map_app/network/network.dart';
import 'package:covid19_global_mapper/covid_map_app/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CovidMapView extends StatefulWidget {
  @override
  _CovidMapViewState createState() => _CovidMapViewState();
}

class _CovidMapViewState extends State<CovidMapView> {
  Future<Covid> _covidData ;
  Completer<GoogleMapController> _controller = Completer() ;
  List<Marker> _markerList = <Marker>[] ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _covidData = Network().getCovidData() ;
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
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //store btn
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: showVirusMap,
          onPressed: (){
        findConfirmed("Confirmed");
       },
          label: Icon(FontAwesomeIcons.viruses , color: recoveredButton,)),
    );
  }



  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        mapType: MapType.hybrid,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
        initialCameraPosition: CameraPosition(target: LatLng(20.5937,78.9629) , zoom: 4),
        markers: Set<Marker>.of(_markerList),
      ),
    );

  }

  void findConfirmed(var tappedButton) {
    setState(() {
      var dataOfResponse = tappedButton ;
      print(dataOfResponse) ;
      _markerList.clear();
      _handleResponse(dataOfResponse) ;

    });

  }

  void _handleResponse(var titleDatas) {
    setState(() {
      _covidData.then((datas) => {
        datas.data.forEach((data) {

          _markerList.add(Marker(
            flat: true,
            anchor: Offset(1,1),
            markerId: MarkerId(data.code),
           infoWindow: InfoWindow(title: "${data.name}" , snippet: "Confirmed: ${data.latestData.confirmed}" ,),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed) ,
            position: LatLng((data.coordinates.latitude), (data.coordinates.longitude)),
          ));
        })
      });
    });
  }

}

