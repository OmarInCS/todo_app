
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayCard extends StatefulWidget {
  const DayCard({
    super.key,
    required this.day,
    this.isSelected = false,
  });

  final DateTime day;
  final isSelected;

  @override
  State<DayCard> createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: widget.isSelected ? 8 : 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  DateFormat("MMM").format(widget.day)
              ),
              SizedBox(height: 8,),
              Text(
                  DateFormat("dd").format(widget.day)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
