import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as intl;

import '../models/summary.dart';
import '../widgets/card_item.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  // formatted number will be: 1,234
  late Summary dataSummary;
  final f = intl.NumberFormat.decimalPattern();

  Future getSummary() async {
    var response = await http.get(Uri.parse('https://covid19.mathdro.id/api'));
    Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    dataSummary = Summary.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 30,
              left: 40,
              right: 40,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'COVID-19',
                            style: GoogleFonts.asap(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Cases Update',
                            style: GoogleFonts.asap(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/more.png',
                          width: 20,
                        ),
                      ],
                    )
                  ],
                ),
                FutureBuilder(
                    future: getSummary(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        Text('Loading...');
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CardItem(
                              'Confirmed',
                              '${f.format(dataSummary.confirmed.value)}',
                              'assets/confirmed_icon.png',
                              false),
                          CardItem(
                              'Deaths',
                              '${f.format(dataSummary.deaths.value)}',
                              'assets/death_icon.png',
                              true),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
