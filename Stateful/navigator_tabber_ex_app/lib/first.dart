import 'package:flutter/material.dart';
import 'package:navigator_tabber_ex_app/model/animal_list.dart';

class First extends StatefulWidget {
  final List<Animal> list;    
  const First({super.key, required this.list});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 90,
          child: Card(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    widget.list[index].imagePath,
                    width: 70,
                  ),
                ),
                Text(
                  widget.list[index].animalName,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}