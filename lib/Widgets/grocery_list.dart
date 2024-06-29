import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/Widgets/new_item.dart';
import 'package:shopping_list/data/dummy_item.dart';
import 'package:shopping_list/models/groceryitem.dart';
class grocerylist extends StatefulWidget{
  grocerylist({super.key});
  @override
  State<grocerylist> createState() => _grocerylistState();
}

class _grocerylistState extends State<grocerylist> {
  void _addItem()
  {
    Navigator
        .of(context)
        .push(MaterialPageRoute(
        builder: (ctx)=> const NewItem()
    )
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [
          IconButton(onPressed: _addItem , icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: (ctx , index)=>
              ListTile(
            title: Text(groceryItems[index].name),
                leading: Container(
                  height: 30,
                  width: 30,
                  color: groceryItems[index]
                      .category
                      .color,
                ),
                trailing: Text(groceryItems[index].quantity.toString()),
          )),
    );

      ;
  }
}