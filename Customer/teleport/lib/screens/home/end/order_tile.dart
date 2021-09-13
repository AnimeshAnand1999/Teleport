import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teleport/models/order.dart';
import 'package:ntp/ntp.dart';
import 'package:teleport/models/user.dart';
import 'package:teleport/screens/home/end/order_detail.dart';
import 'package:teleport/services/database.dart';

class OrderTile extends StatefulWidget {
  final Order order;
  OrderTile({this.order});

  @override
  _OrderTileState createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {

  @override
  Widget build(BuildContext context) {
    var now = NTP.now();
    Usr usr = Provider.of<Usr>(context);

    return Container(
      // padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 8.0),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OrderDetail(futureOrders: DatabaseService(uid: usr.uid).getOrderDetails(widget.order.orderUID, widget.order.shopUID, widget.order.status))),
          );
        },
        child: FutureBuilder(
          future: now,
          builder: (context,snapshot){return Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(15.0),
            // ),
            // color: Colors.white,
            child:
            ListTile(
              title: Text(widget.order.shopName),
              trailing: Text((snapshot.hasData) ? ((snapshot.data.day==widget.order.time.day && snapshot.data.month == widget.order.time.month && snapshot.data.year == widget.order.time.year) ? widget.order.time.hour.toString()+":"+widget.order.time.minute.toString() : widget.order.time.day.toString()+"/"+widget.order.time.month.toString()+"/"+widget.order.time.year.toString()) : widget.order.time.day.toString()+"/"+widget.order.time.month.toString()+"/"+widget.order.time.year.toString()) ,
            ),
          );}
        ),
      ),
    );
  }
}
