/*import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:teste/splash/splash_screen.dart';

import 'pages/index.dart';

*/
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:teste/google_map.dart';
import 'package:teste/util/theme.dart';

import 'pages/index.dart';
import 'splash/splash_screen.dart';


void main() => runApp(MyApp());

final ThemeData _AppTheme = CustomAppTheme().data;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
//      theme: _AppTheme,
      home:  MSplashScreen(),
      routes: {
        '/index': (context) => IndexPage(),
      },
    );
  }
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _marcadores = {};
  Set<Polygon> _polygons  = {};
  Set<Polyline> _polylines  = {};

  _onMapCreated( GoogleMapController googleMapController ){
    _controller.complete( googleMapController );
  }

  _movimentarCamera() async {

    GoogleMapController googleMapController = await _controller.future;
    googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(-23.562436, -46.655005),
                zoom: 16,
                tilt: 0,
                bearing: 270
            )
        )
    );

  }

  _carregarMarcadores(){

    /*
    Set<Marker> marcadoresLocal = {};

    Marker marcadorShopping = Marker(
        markerId: MarkerId("marcador-shopping"),
        position: LatLng(-23.563370, -46.652923),
      infoWindow: InfoWindow(
        title: "Shopping Cidade São Paulo"
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueMagenta
      ),
      onTap: (){
        print("Shopping clicado!!");
      }
      //rotation: 45
    );

    Marker marcadorCartorio = Marker(
        markerId: MarkerId("marcador-cartorio"),
        position: LatLng(-23.562868, -46.655874),
      infoWindow: InfoWindow(
          title: "12 Cartório de notas"
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueBlue
      ),
        onTap: (){
          print("Cartório clicado!!");
        }
    );

    marcadoresLocal.add( marcadorShopping );
    marcadoresLocal.add( marcadorCartorio );

    setState(() {
      _marcadores = marcadoresLocal;
    });
    */
    /*
    Set<Polygon> listaPolygons = {};
    Polygon polygon1 = Polygon(
        polygonId: PolygonId("polygon1"),
      fillColor: Colors.green,
      strokeColor: Colors.red,
      strokeWidth: 20,
      points: [
        LatLng(-23.561816, -46.652044),
        LatLng(-23.563625, -46.653642),
        LatLng(-23.564786, -46.652226),
        LatLng(-23.563085, -46.650531),
      ],
      consumeTapEvents: true,
      onTap: (){
        print("clicado na área");
      },
      zIndex: 1
    );

    Polygon polygon2 = Polygon(
        polygonId: PolygonId("polygon2"),
        fillColor: Colors.purple,
        strokeColor: Colors.orange,
        strokeWidth: 20,
        points: [
          LatLng(-23.561629, -46.653031),
          LatLng(-23.565189, -46.651872),
          LatLng(-23.562032, -46.650831),
        ],
        consumeTapEvents: true,
        onTap: (){
          print("clicado na área");
        },
      zIndex: 0
    );

    listaPolygons.add( polygon1 );
    listaPolygons.add( polygon2 );

    setState(() {
      _polygons = listaPolygons;
    });
    */

    Set<Polyline> listaPolylines = {};
    Polyline polyline = Polyline(
        polylineId: PolylineId("polyline"),
        color: Colors.red,
        width: 40,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        jointType: JointType.round,
        points: [
          LatLng(-23.563645, -46.653642),
          LatLng(-23.565160, -46.651797),
          LatLng(-23.563232, -46.648020),
        ],
        consumeTapEvents: true,
        onTap: (){
          print("clicado na área");
        }
    );

    listaPolylines.add( polyline );
    setState(() {
      _polylines = listaPolylines;
    });

  }

  double lat = 0, long = 0;
  _recuperarLocalizacaoAtual() async {

    Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
    );

    print("localizacao atual: " + position.toString() );

    setState(() {
      long = position.longitude;
      lat = position.latitude;
    });
  }

  @override
  void initState() {
    super.initState();
    //_carregarMarcadores();
    _recuperarLocalizacaoAtual();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mapas e geolocalização"),),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.done),
          onPressed: _movimentarCamera
      ),
      body: Container(
        child: GoogleMap(
          mapType: MapType.normal,
          //mapType: MapType.hybrid,
          //mapType: MapType.none,
          //mapType: MapType.satellite,
          //mapType: MapType.terrain,
          //-23.562436, -46.655005
          initialCameraPosition: CameraPosition(
              target: LatLng(lat, long),
              zoom: 19
          ),
          onMapCreated: _onMapCreated,
          markers: _marcadores,
          polygons: _polygons,
          polylines: _polylines,
        ),
      ),
    );
  }
}
