import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import '../AppColors.dart';
import '../class/AnimalType.dart';
import '../class/Post.dart';
import '../utils/Formatters.dart';
import 'CustomAppBar.dart';
import 'UserAvatar.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat("dd/MM/yyyy");

    final animalLabelStyle = GoogleFonts.balsamiqSans(
      textStyle: const TextStyle(
        color: Colors.white,
      ),
    );

    final priceLabelStyle = GoogleFonts.balsamiqSans(
      textStyle: TextStyle(
        color: AppColors.orangeColor.shade900,
      ),
    );

    final dateStyle = GoogleFonts.balsamiqSans(
      textStyle: TextStyle(
        color: AppColors.orangeColor.shade900,
        fontSize: 16,
      ),
    );

    final nameStyle = GoogleFonts.balsamiqSans(
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    );

    final cityStyle = GoogleFonts.balsamiqSans(
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
        height: 250,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor.shade700,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UserAvatar(name: post.user.fullname),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.user.fullname ?? "Anonyme",
                        style: nameStyle,
                      ),
                      Text(
                        dateFormatter.format(post.startDate) +
                            " - " +
                            dateFormatter.format(post.endDate),
                        style: dateStyle,
                      ),
                      Text(
                        post.city.name + post.id.toString(),
                        style: cityStyle,
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    formatAnimalType(post.animal.type),
                    style: animalLabelStyle,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    post.price.toString() + "€",
                    style: priceLabelStyle,
                  ),
                )
              ],
            ),
            Container(
                child: Text(
              post.description,
              maxLines: 3,
              style: GoogleFonts.balsamiqSans(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
