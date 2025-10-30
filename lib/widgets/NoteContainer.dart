import 'package:flutter/material.dart';

class Notecontainer extends StatelessWidget {
  const Notecontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24, bottom: 24, left: 16),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 205, 121),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ListTile(
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete, color: Colors.black, size: 40),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                "Title",
                style: TextStyle(fontSize: 26, color: Colors.black),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                "Description adakdjadkljdkasjda;djadsjdal",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "May 20,2023",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
