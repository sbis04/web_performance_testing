import 'package:flutter/material.dart';
import 'package:flutter_web_performance/model/coffee.dart';

const backKey = ValueKey('backKey');

class DescriptionPage extends StatelessWidget {
  final Coffee coffee;

  DescriptionPage(this.coffee);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.brown[50],
        title: Text(
          coffee.name,
          style: TextStyle(color: Colors.brown),
        ),
        leading: BackButton(key: backKey, color: Colors.brown),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coffee.description,
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'Ratio: ',
                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: coffee.ratio,
                      style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Cup: ',
                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: coffee.cup,
                      style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
