import 'package:flutter/material.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  Object? parameters;

  @override
  Widget build(BuildContext context) {

    parameters = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments;
    data = jsonDecode(jsonEncode(parameters));
    // print(data);

    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[800];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: <Widget>[
                  TextButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/chooselocation');
                        if(result != null){
                          setState(() {
                            data = {
                              'time': result['time'],
                              'location': result['location'],
                              'flag': result['flag'],
                              'isDayTime': result['isDayTime']
                            };
                          });
                        }
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                      ),
                      label: Text(
                          'Edit location',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey[300],
                          ),
                      ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          data['location'],
                          style: TextStyle(
                            fontSize: 35.0,
                            letterSpacing: 2.0,
                            color: Colors.white,
                          ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 66.0,
                        color: Colors.white,
                      ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
