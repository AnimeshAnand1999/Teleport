import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teleport/models/item.dart';
import 'package:teleport/screens/home/root/item_tile.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {

    final items = Provider.of<List<Item>>(context) ?? [];
    
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index){
        return ItemTile(item: items[index]);
      },
    );
  }
}
