import 'package:flutter/material.dart';

class TODO extends StatefulWidget {
  @override
  _TODOState createState() => _TODOState();
}

class _TODOState extends State<TODO> {
  var output = "";
  List<dynamic> lt = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  List<dynamic> lst = [
    "Water plants",
    "Change lens solution",
    "Make assignments",
    "Mids preparation",
    "Skin care"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "To Do List",
          ),
          backgroundColor: Colors.black),
      body: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: 40,
                  width: 250,
                  color: Colors.black54,
                  child: ListTile(
                    title: Text(
                      "${lt[index]}.    ${lst[index]}",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    trailing: Container(
                      width: 50,
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Edit  Item"),
                                        content: TextField(
                                          onChanged: (value) {
                                            output = value;
                                          },
                                        ),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  lst.replaceRange(index,
                                                      index + 1, {output});
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Done"))
                                        ],
                                      );
                                    });
                              },
                              child: Icon(Icons.edit)),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                lst.removeAt(index);
                              });
                            },
                            child: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add Item"),
                  content: TextField(
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            lst.add(output);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text("Add"))
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
