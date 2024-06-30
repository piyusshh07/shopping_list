import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/Widgets/new_item.dart';
import 'package:shopping_list/models/groceryitem.dart';
class grocerylist extends StatefulWidget{
  grocerylist({super.key});
  @override
  State<grocerylist> createState() => _grocerylistState();
}

class _grocerylistState extends State<grocerylist> {
  final List<GroceryItem> _groceryitem=[];
  void _addItem() async
  {final _newItem=await Navigator.of(context) .push<GroceryItem>
    (MaterialPageRoute(
        builder: (ctx)=> const NewItem()
    ),
    );
    if(_newItem==null){
      return;
    }
    setState(() {
      _groceryitem.add(_newItem);
    });


}
  void _removeitem(GroceryItem item){
    setState(() {
      _groceryitem.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget maincontent =
    const Center(
      child: Text("No items available try adding some"),
    );
    if(_groceryitem.isNotEmpty){
      setState(() {
        maincontent=ListView.builder(
            itemCount: _groceryitem.length,

            itemBuilder: (ctx , index)=>Dismissible(key: ValueKey(_groceryitem[index].id), child: ListTile(
              title: Text(_groceryitem[index].name),
              leading: Container(
                height: 30,
                width: 30,
                color: _groceryitem[index]
                    .category
                    .color,
              ),
              trailing: Text(_groceryitem[index].quantity.toString()),

            ),
            onDismissed: (direction){
              _removeitem(_groceryitem[index]);
            },)


        );
      });

    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [
          IconButton(onPressed: _addItem , icon: Icon(Icons.add))
        ],
      ),
      body: maincontent
    );
  }
}