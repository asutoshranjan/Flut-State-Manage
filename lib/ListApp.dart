import 'package:flutter/material.dart';

class ListApp extends StatefulWidget {
  const ListApp({Key? key}) : super(key: key);

  @override
  _ListAppState createState() => _ListAppState();
}

class _ListAppState extends State<ListApp> {
  final textController = TextEditingController();
  List<String> Data = [];
  String task = '';

  @override
  void initState() {
    super.initState();
    textController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 40),

              // Input through a text field
              TextField(
                controller: textController,
                onSubmitted: (data) => setState(() {
                  this.task = data;
                }),
                decoration: InputDecoration(
                  hintText: 'Add a task here...',
                  labelText: 'New Task',
                  prefixIcon: Icon(Icons.text_fields),
                  suffixIcon: textController.text.isEmpty
                      ? Container(width: 0)
                      : IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            textController.clear();
                          },
                        ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 15),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    Data.add(task);
                  });
                },
                shape: StadiumBorder(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Text(
                    "  Add  ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 440,
                child: ListView(
                  children: [
                    for (int i = 0; i < Data.length; i++)
                      Text(
                        Data[i],
                        style: TextStyle(
                          fontSize: 24,
                          height: 1.5,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.4,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
