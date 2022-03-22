import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final String username;
  final String image;
  final String id;

  const ContentCard({
    Key? key,
    required this.username,
    required this.image,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4.0),
      width: double.infinity,
      height: 70.0,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(image)),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
            ),
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 2.0),
              Text(
                username,
                style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Text(
                '2x tuna sahimi, 3x vegetables, 1x noodle',
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black45),
              ),
              const SizedBox(height: 6.0),
              Text(
                '\$' + id,
                style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.pink),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
