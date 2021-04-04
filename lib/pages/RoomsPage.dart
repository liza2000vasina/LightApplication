import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liza/constants/Routes.dart';

class RoomsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  List<String> rooms = ['Kitchen', 'Bathroom'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rooms'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.pink, Colors.white])),
          ),
        ),
        body: GridView.builder(
          itemCount: rooms.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          padding: EdgeInsets.all(5),
          itemBuilder: (BuildContext context, int index) {
            return ElevatedButton(
              // style: ButtonStyle(
              //   backgroundColor: MaterialStateProperty.all<>(
              //       rooms[index]),
              // ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pink[100]),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.ROOM);
              },
              child: Center(
                child: new GridTile(
                  child: new Text(
                    rooms[index],
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
