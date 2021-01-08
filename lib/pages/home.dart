import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data: ModalRoute.of(context).settings.arguments;
    print(data);

    //setbackground
    Color appbarcolor =  data['isDaytime'] ? Colors.blue[600]: Colors.indigo[500];
    String bg = data['isDaytime'] ? 'day.png' : 'night.png';

    return Scaffold(
      backgroundColor: appbarcolor,
//      appBar: AppBar(
//        backgroundColor: appbarcolor,
//        title: Text('Choose a Location'),
//        centerTitle: true,
//        elevation: 0,
//      ),
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bg'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
        child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                    dynamic result= await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location': result['location'],
                        'isDaytime' : result['isDaytime'],
                        'flag' : result['flag'],

                      };
                    });




                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],

                  ),
                  label: Text(

                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),

                  )),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                data['time'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 65.0,
                ),
              )
            ],
        ),
      ),
          )),
    );
  }
}
