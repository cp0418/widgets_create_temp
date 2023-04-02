import 'package:flutter/material.dart';

class TextWithKeyboardIcon extends StatefulWidget {
  const TextWithKeyboardIcon({super.key, required this.title});

  final String title;

  @override
  State<TextWithKeyboardIcon> createState() => _TextWithKeyboardIconState();
}

class _TextWithKeyboardIconState extends State<TextWithKeyboardIcon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _containerDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                minLines: 3,
                maxLines: 3,
                decoration: InputDecoration(
                  constraints: BoxConstraints(maxHeight: 100),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  suffixIcon: Container(
                    alignment: Alignment.topRight,
                    height: 80,
                    child: IconButton(
                      icon: Icon(Icons.keyboard),
                      onPressed: () {
                        debugPrint('BTN PRESSED');
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _containerDrawer() {
    return Container(
      width: 200,
      height: double.infinity,
      color: Colors.yellow,
      child: _textField(),
    );
  }

  Widget _textField() {
    return TextFormField(
      minLines: 3,
      maxLines: 3,
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxHeight: 100),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: Container(
          alignment: Alignment.topRight,
          height: 80,
          child: IconButton(
            icon: Icon(Icons.keyboard),
            onPressed: () {
              debugPrint('BTN PRESSED');
            },
          ),
        ),
      ),
    );
  }
}
