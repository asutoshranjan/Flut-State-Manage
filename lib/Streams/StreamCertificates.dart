import 'dart:async';

import 'package:flutter/material.dart';

class StreamCertificate extends StatefulWidget {
  const StreamCertificate({Key? key}) : super(key: key);

  @override
  _StreamCertificateState createState() => _StreamCertificateState();
}

class _StreamCertificateState extends State<StreamCertificate> {

  String input = "";
  final nameController = TextEditingController();
  StreamController nameDataController = StreamController();

  @override
  void initState() {
    super.initState();
    nameController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Certificates"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 80),
                TextField(
                  onChanged: (value) => setState(() {
                    input = value;
                  }),
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'MR. ASUTOSH RANJAN',
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.text_fields),
                    suffixIcon: nameController.text.isEmpty
                        ? Container(width: 0)
                        : IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              nameController.clear();
                            },
                          ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 10),
                RaisedButton(
                  onPressed: () {
                    nameDataController.sink.add(input);
                  },
                  color: Colors.blueAccent[100],
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Text(
                      " GENERATE ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Card(
                  elevation: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.yellowAccent[100],
                  child: Container(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Certificate of Excellence",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(height: 20),
                          Text("This is to certify the excellence of"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StreamBuilder(
                                stream: nameDataController.stream,
                                builder: (context, snapshot) {
                                  if(snapshot.hasData) {
                                    return Text(snapshot.data.toString(), style: TextStyle(fontWeight: FontWeight.bold),);
                                  }
                                  else {
                                    return Text("");
                                  }
                                },
                              ),
                              Text(" for the extraordinary skills. "),
                            ],
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sing. President"),
                              Text("Sign. Vice-President"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
