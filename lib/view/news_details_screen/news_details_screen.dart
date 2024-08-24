import 'package:flutter/material.dart';

import 'package:news_application/model/newsmodel.dart';

class NewsDetailsScreen extends StatefulWidget {
  NewsDetailsScreen({super.key, required this.newArticle});
  final Article newArticle;

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 210, 178, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(253, 210, 178, 1.0),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical, // Corrected to vertical scrolling
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.newArticle.title ?? "",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 9, 9, 9),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Author: "),
                  Text(
                    widget.newArticle.author ?? "",
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.newArticle.description ?? "",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 230,
              width: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(widget.newArticle.urlToImage ??
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWz9tftw9qculFH1gxieWkxL6rbRk_hrXTSg&s'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
