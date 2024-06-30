import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/groceryitem.dart';

class NewItem extends StatefulWidget{
  const NewItem({super.key});
  @override
  State<NewItem> createState() {
    return _NewItemState()
      ;
  }
}
 class _NewItemState extends State<NewItem>{
  final _formkey=GlobalKey<FormState>();

  var _EnteredName;
  var _EnteredQuantity =1;
  var _selectedCategory =categories[Categories.Vegetables]!;

  void _saveItems(){
   if( _formkey.currentState!.validate()){
    _formkey.currentState!.save();
    Navigator.of(context).pop(GroceryItem(
      id: DateTime.now().toString(),
      name: _EnteredName,
      category: _selectedCategory,
      quantity: _EnteredQuantity,
    )
    );
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Item"),
      ),
      body: Padding(
        padding:const EdgeInsets.all(12),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration:const  InputDecoration(
                  label: Text("Name")
                ),
                validator: (value){
                  if(value==null ||
                      value.isEmpty ||
                      value.trim().length <=1 ||
                      value.trim().length > 50)
                  {
                    return "Must be between 1-50 characters";
                  }
                    return null;
                },
                onSaved: (value){
                  _EnteredName=value!;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration:const InputDecoration(
                        label: Text("Quantity"),
                    ),
                      keyboardType: TextInputType.number,
                      initialValue: _EnteredQuantity.toString(),
                      validator: (value){
                        if(value==null ||
                            value.isEmpty ||
                            int.tryParse(value)==null ||
                            int.tryParse(value)! <= 0)
                        {
                          return "must be a valid positive number";
                        }
                        return null;
                      },
                      onSaved: (value){
                        _EnteredQuantity=int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 30,),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                        items: [
                          for( final category in categories.entries)
                            DropdownMenuItem(
                              value: category.value,
                              child: Row(
                              children: [
                              Container(
                                height: 16,width: 16,color: category.value.color,
                              ),
                             const SizedBox(width: 10),
                              Text(category.value.title)
                            ],
                            ),
                            ),
                            ],
                        onChanged: (value){
                        setState(() {
                          _selectedCategory=value!;
                        });
                        }),
                  )
                ],
              ),
              const SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed:(){
                    _formkey.currentState!.reset();
                  }, child: const Text("Reset")),
                  ElevatedButton(onPressed: _saveItems, child: const Text("Add Item"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
