import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';

class NewItem extends StatefulWidget{
  const NewItem({super.key});
  @override
  State<NewItem> createState() {
    return _NewItemState()
      ;
  }
}
 class _NewItemState extends State<NewItem>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Item"),
      ),
      body: Padding(
        padding:const EdgeInsets.all(12),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                  label: Text("Name")
                ),
                validator: (value){
                  return 'Demo..';
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text("Quantity"),
                    ),
                      initialValue: '1' ,
                    ),
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                        items: [
                          for( final category in categories.entries)
                            DropdownMenuItem(
                              value: category.value,
                              child: Row(
                              children: [
                              Container(
                                height: 16,width: 16,color: category.value.color,
                              ),
                             const SizedBox(width: 6),
                              Text(category.value.title)
                            ],
                            ),
                            ),
                            ],
                        onChanged: (value){}),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
