import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_web_performance/model/coffee.dart';
import 'package:flutter_web_performance/model/data.dart';

const listItemKey = ValueKey('listItemKey');

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _coffeeCount = 0;
  List<Coffee> coffeeList;

  @override
  void initState() {
    super.initState();
    parseJsonData();
  }

  parseJsonData() async {
    var parsedJson = json.decode(jsonData);

    CoffeeTypes coffeeTypes = CoffeeTypes.fromJson(parsedJson);
    coffeeList = coffeeTypes.coffee;
  }

  void _incrementCoffee() {
    setState(() {
      _coffeeCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.brown[50],
        title: Text(
          'Coffee Brewery',
          style: TextStyle(color: Colors.brown),
        ),
        centerTitle: true,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                '$_coffeeCount',
                style: TextStyle(color: Colors.brown[300], fontSize: 22),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCoffee,
        child: Icon(Icons.add_shopping_cart),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: ListView.builder(
          itemCount: coffeeList.length,
          itemBuilder: (context, index) {
            return InkWell(
              key: index == 0 ? listItemKey : null,
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/description',
                  arguments: coffeeList[index],
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    coffeeList[index].name,
                    style:
                        TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    coffeeList[index].description,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Ratio: ',
                      style: TextStyle(
                          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: coffeeList[index].ratio,
                          style: TextStyle(
                            color: Colors.green[800],
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      text: 'Cup: ',
                      style: TextStyle(
                          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: coffeeList[index].cup,
                          style: TextStyle(
                            color: Colors.green[800],
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
