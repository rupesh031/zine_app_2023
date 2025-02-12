import 'package:flutter/material.dart';

import '../../../theme/color.dart';

class TeamTile extends StatelessWidget {
  final String year;
  final String name;
  final String id;
  final String image;

  const TeamTile({
    Key? key,
    required this.year,
    required this.image,
    required this.name,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 13.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0), //or 15.0
                child: Image.asset(
                  'assets/images/$year/$image.webp',
                  height: 75.0,
                  width: 75.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 18.0,
                          color: textDarkBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      id,
                      style: const TextStyle(
                          fontSize: 12.0,
                          color: textColor,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
