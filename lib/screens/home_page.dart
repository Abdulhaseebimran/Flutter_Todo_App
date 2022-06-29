import 'package:flutter/material.dart';
class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  TextEditingController addTodoController = TextEditingController();
  TextEditingController editTodoController = TextEditingController();
  // var output = "";
  List<dynamic> _addtodo=[];
  // List<String> _addtodo = [];
   addTodof() {
    setState(() {
      _addtodo.add(addTodoController.text);
      addTodoController.clear();
    });
  }

  removeNotes(i) {
  _addtodo.removeAt(i);
    // list.removeAt(index);
  }
  
   editTodo(i) {
    _addtodo[i] = editTodoController.text;
    editTodoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TODO APP", style: TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold, 
      ), 
      ), leading: const Icon(Icons.check_box_outlined, size: 30, ), 
      actions: [
        Icon(Icons.logout_sharp)],
      ), body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: Column(
          children: [
             TextField(
              controller: addTodoController,
               style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,),
                decoration: const InputDecoration(
                hintText: "Enter Todo",
                 enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.blue, width: 2),
               ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
	             ),), const SizedBox(height: 10,),
            Column(
              children: [
                ElevatedButton(onPressed: (){addTodof();}, child: const Text("Enter todo"))
              ], 
            ), const SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
                  itemCount: _addtodo.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      height: 65,
                      margin: const EdgeInsets.only(top: 20 , left: 5),
                      child: ListTile(
                        tileColor:const Color.fromARGB(255, 118, 189, 246),
                        trailing: SizedBox(width:  MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(onPressed: (){
                              showDialog(context: context, builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Edit Todo items"),
                                  content: TextField(
                                    decoration: const InputDecoration(
                                      hintText: "Edit Your Todo",
                                    ), controller:  editTodoController,
                                  ), 
                                  actions: [
                                    TextButton(onPressed: (){
                                     setState(() {
                                       editTodo(index);
                                       Navigator.pop(context, "Edit");
                                     });
                                    }, child: const Text("Edit")),
                                    TextButton(onPressed: (){
                                    Navigator.pop(context,"Cancel");
                                    }, child: const Text("Cancel"))
                                  ], 
                                );
                              });
                            }, icon: const Icon(Icons.edit_note,color: Color.fromARGB(255, 255, 90, 78),)),
                            IconButton(onPressed: (){
                              setState(){
                                removeNotes(index);
                              }
                            }, icon: const Icon(Icons.delete, color: Color.fromARGB(255, 255, 90, 78),))
                          ],
                        ),), 
                        title: Container(
                        margin: const EdgeInsets.symmetric(vertical: 18),
                        child: Text("${_addtodo[index]} "), 
                      )),
                    );
                  } )))
          ], 
        ), 
      ), 
    );
  }
}
             