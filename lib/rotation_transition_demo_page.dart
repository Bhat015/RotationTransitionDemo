import 'package:flutter/material.dart';

class RotationTransitionDemoPage extends StatefulWidget {
  @override
  _RotationTransitionDemoPageState createState() =>
      _RotationTransitionDemoPageState();
}

class _RotationTransitionDemoPageState
    extends State<RotationTransitionDemoPage> {
  final letfBoxController = TextEditingController();
  final rightBoxController = TextEditingController();
  int leftBoxCharactersCount = 0;
  int rightBoxCharactersCount = 0;
  double angle = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Test App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type here ..."),
                        keyboardType: TextInputType.text,
                        controller: letfBoxController,
                        cursorHeight: 20,
                        cursorWidth: 2,
                        cursorColor: Colors.black,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                        enabled: true,
                        maxLines: null,
                        expands: true,
                        showCursor: true,
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.top,
                        onChanged: (value) {
                          setState(() {
                            leftBoxCharactersCount = value.length;
                            angle = -0.25 *
                                (leftBoxCharactersCount -
                                    rightBoxCharactersCount);
                          });
                        },
                      ),
                    ),
                  ),
                  VerticalDivider(
                    thickness: 2,
                    color: Colors.black,
                    indent: 4,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type here ..."),
                        keyboardType: TextInputType.text,
                        controller: rightBoxController,
                        cursorHeight: 26,
                        cursorWidth: 2,
                        cursorColor: Colors.black,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                        enabled: true,
                        maxLines: null,
                        expands: true,
                        showCursor: true,
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.top,
                        onChanged: (value) {
                          setState(() {
                            rightBoxCharactersCount = value.length;
                            angle = -0.25 *
                                (leftBoxCharactersCount -
                                    rightBoxCharactersCount);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 2,
          ),
          Expanded(
            child: Center(
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(angle / 360),
                child: Container(
                  margin: const EdgeInsets.only(left: 32, right: 32),
                  height: 50,
                  color: Colors.blueAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(left: 8),
                          color: Colors.white,
                          height: 40,
                          width: 70,
                          child: Center(
                            child: Text("$leftBoxCharactersCount"),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          color: Colors.white,
                          height: 40,
                          width: 70,
                          child: Center(
                            child: Text("$rightBoxCharactersCount"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    letfBoxController.dispose();
    rightBoxController.dispose();
    super.dispose();
  }
}
