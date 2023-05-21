import 'package:flutter/material.dart';
import 'package:grow_simplee_intern_assignment/model/rider.dart';
import 'package:grow_simplee_intern_assignment/styles.dart';
import 'package:grow_simplee_intern_assignment/view/rider_view.dart';

class RiderTile extends StatefulWidget {
  const RiderTile({Key? key, required this.rider}) : super(key: key);
  final Rider rider;

  @override
  State<RiderTile> createState() => _RiderTileState();
}

class _RiderTileState extends State<RiderTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(RiderView.id, arguments: widget.rider);
      },
      leading: widget.rider.photo == null
          ? const CircleAvatar(backgroundImage: AssetImage('assets/rider.png'))
          : CircleAvatar(
              backgroundImage: FileImage(widget.rider.photo!),
            ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2)),
          side: BorderSide(color: Colors.grey)),
      title: Text(widget.rider.name, style: bodyTextStyle1),
      subtitle: Text(widget.rider.phone),
    );
  }
}
