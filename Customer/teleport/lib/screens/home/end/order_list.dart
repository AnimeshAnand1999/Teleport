import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teleport/models/user.dart';
import 'package:teleport/screens/home/end/order_tile.dart';
import 'package:teleport/services/database.dart';
import 'package:teleport/shared/loading.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    Usr usr = Provider.of<Usr>(context);
    Future<List<dynamic>> futureOrders =
        DatabaseService(uid: usr.uid).oldOrders();

    return FutureBuilder(
        future: futureOrders,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var orders = snapshot.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 5.0,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      return OrderTile(order: orders[index]);
                    },
                  ),
                )
              ],
            );
          }
          return Loading();
        });
  }
}
