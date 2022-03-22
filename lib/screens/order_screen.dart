import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zebra/models/data_model.dart';
import 'package:zebra/services/http_service.dart';
import 'package:zebra/utils/color_pallete.dart';
import 'package:zebra/widgets/export_widgets.dart';
import 'package:http/http.dart' as http;

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ButtomNavigationBar(),
      backgroundColor: AppColors.backgroundColor,
      body: Stack(children: [
        const ContainerDecoration(),
        SafeArea(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Order',
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 34.0,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'Close',
                        style:
                            TextStyle(color: AppColors.white, fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ContainerWhite(
                  height: 158.0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, top: 8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Subtotal',
                                  style: TextStyle(fontSize: 16.0)),
                              Text(
                                '\$49.50',
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black38),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Tax & Fees',
                                  style: TextStyle(fontSize: 16.0)),
                              Text(
                                '\$2.75',
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black38),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Delivery',
                                  style: TextStyle(fontSize: 16.0)),
                              Text(
                                'Free',
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black38),
                              ),
                            ]),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Total',
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87)),
                              Text(
                                '\$49.50',
                                style: TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18.0),
                ContainerWhite(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    children: [
                      FutureBuilder<List<UserDetail>>(
                        future: fetchUsers(http.Client()),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ContentCard(
                                      id: snapshot.data![index].id.toString(),
                                      username: snapshot.data![index].username,
                                      image: snapshot.data![index].imageUrl,
                                    ),
                                    Divider()
                                  ],
                                );
                              },
                            );
                            //ContentCard();

                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }

                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

