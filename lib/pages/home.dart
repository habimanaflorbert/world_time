import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  // const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data :ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    String dayImage = data['isDay'] ? 'day.png' : 'night.png';
    
    Color bgColor = data['isDay']?Colors.blue : Colors.indigo[700] as Color;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$dayImage'),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 24.0, 0.0, 0),
                child: FlatButton.icon(
                   onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/edit-location');
                    if(result != null){
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag']
                        };
                      });
                    }
                  },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[200],
                    ),
                    label: Text(
                      "edit Location",
                      style: TextStyle(color: Colors.grey[200]),
                    )),
              ),
            ),
            Center(
              child: Text(data['location'],
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0,color: Colors.grey[200])),
            ),
            Center(
              child: Text(
                data['time'],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 40 ,color: Colors.grey[200]),
              ),
            )
          ],
        ),
      )),
    );
  }
}
