import 'package:flutter/material.dart';
import 'package:news_application/model/newsmodel.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({super.key, required this.newArticle});
  final Article newArticle;

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text(
          widget.newArticle.title ?? "",
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
        Image.network(
          widget.newArticle.urlToImage ?? "",
          fit: BoxFit.contain,
          height: 80,
          width: double.infinity,
        ),
      ],
    ));
  }
}
