import 'package:flutter/material.dart';
import 'package:teleport/screens/home/end/finalize_order.dart';
import 'package:teleport/shared/loading.dart';

//accept quantities so that you can display it here
class OrderDetail extends StatefulWidget {
  final Future<Map> futureOrders;
  OrderDetail({this.futureOrders});
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: widget.futureOrders,
        builder: (context,snapshot){
          if(snapshot.hasData){
            var orders = snapshot.data;
            var name = orders['shopName'];

            orders.remove('name');
            orders.remove('time');
            orders.remove('shopUID');
            orders.remove('shopAddress');
            orders.remove('customerUID');
            orders.remove('customerAddress');
            orders.remove('phoneNumber');
            orders.remove('shopName');
            orders.remove('state');
            orders.remove('cost');


            List<TableRow> tableRows = [];
            double total = 0;
            tableRows.add(TableRow(
              children: [
                Text(
                  'Name',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Quantity',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Cost',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ));
            tableRows.add(TableRow(children: [
              Text(''),
              Text(''),
              Text(''),
            ]));

// final filteredMap = new Map.fromIterable(orders.keys.where((k)=>(orders[k].value!=0)));

            orders.forEach((key, value) {
// if(value.value==0){
//   orders.remove(key);
// }
              if (!(key.length > 8 && key.substring(key.length - 8) == '___Price') &&
                  value != 0) {
                var x = orders[key + '___Price'];
                tableRows.add(TableRow(
                  children: [
                    Text(
                      key,
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      value.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      x.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ));
                tableRows.add(TableRow(children: [
                  Text(''),
                  Text(''),
                  Text(''),
                ]));
                total += x;
              }
            });
            tableRows.add(TableRow(
              children: [
                Text(''),
                Text(
                  'Total:',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  total.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ));
            return MaterialApp(
              home: Scaffold(
                appBar: AppBar(
                  title: Text(name),
                  backgroundColor: Colors.blueAccent[700],
                ),
                backgroundColor: Colors.black,
                body: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: MediaQuery.of(context).size.height * 0.02),
                            child: Table(
                              children: tableRows,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            );
          }
          return Loading();
        },
      ),
    );
  }
}


////////////////////////////
