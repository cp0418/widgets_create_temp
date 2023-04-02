import 'package:flutter/material.dart';
import 'package:widget_test/half_circle_shape_widget.dart';

class TableFloor extends StatefulWidget {
  const TableFloor({super.key});

  @override
  State<TableFloor> createState() => _TableFloorState();
}

class _TableFloorState extends State<TableFloor> {
  Offset position = Offset(0, 0);
  bool boxInTarget = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drag Box'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _duoTable(),
          _familyTable(),
          _barTable(),
        ],
      ),
    );
  }

  Widget _duoTable() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _semiCircle(color: Colors.orange),
          _rectangle(borderColor: Colors.orange, width: 40, height: 45),
          _semiCircle(color: Colors.orange, turns: 4),
        ],
      ),
    );
  }

  Widget _familyTable() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _douSeats(),
          _rectangle(borderColor: Colors.red, width: 80, height: 45),
          _douSeats(turns: 4),
        ],
      ),
    );
  }

  Widget _barTable() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: const BorderRadius.only(
          topRight: Radius.elliptical(80, 10),
          bottomRight: Radius.elliptical(0, 0),
        ),
      ),
    );
  }

  Widget _douSeats({
    int turns = 2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _semiCircle(color: Colors.red, turns: turns),
        const SizedBox(width: 10),
        _semiCircle(color: Colors.red, turns: turns),
      ],
    );
  }

  Widget _rectangle({
    bool isActive = true,
    required double width,
    required double height,
    required Color borderColor,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          isActive
              ? Container(
                  width: 5,
                  height: height,
                  decoration: BoxDecoration(
                    color: borderColor,
                    border: Border.all(color: borderColor, width: 1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(3),
                      bottomLeft: Radius.circular(3),
                    ),
                  ),
                )
              : Container(),
          Container(
            width: isActive ? width - 6.5 : width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: borderColor, width: 1),
              borderRadius: isActive ? null : BorderRadius.circular(3),
            ),
          ),
          isActive
              ? Container(
                  width: 0.5,
                  height: height,
                  decoration: BoxDecoration(
                    color: borderColor,
                    border: Border.all(color: borderColor, width: 0.5),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(3),
                      bottomRight: Radius.circular(3),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _semiCircle({
    int turns = 2,
    double width = 20,
    double height = 7,
    required Color color,
  }) {
    return RotatedBox(
      quarterTurns: turns,
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
          )),
    );
  }
}
