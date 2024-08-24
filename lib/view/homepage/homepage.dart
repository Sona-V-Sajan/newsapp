import 'package:flutter/material.dart';
import 'package:news_application/controller/homecontroller.dart';
import 'package:news_application/view/news_details_screen/news_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> categories = [
    "Business",
    "Technology",
    "Sports",
    "Health",
    "Entertainment",
    "Trendings",
  ];
  String selectedCategory = "Business";

  @override
  void initState() {
    super.initState();
    Provider.of<HomeController>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    var homepageProvider = Provider.of<HomeController>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200.0), // Adjusted height
        child: AppBar(
          iconTheme: IconThemeData(
            color: Color.fromRGBO(243, 131, 50, 1.0),
          ),
          backgroundColor: Color.fromRGBO(243, 131, 50, 1.0),
          title: Text(
            "News APP",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white, // White color for "App"
            ),
          ),
          actions: [Icon(Icons.menu)],
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 10,
                  ),
                  child: TextField(
                    onChanged: (value) {
                      Provider.of<HomeController>(context, listen: false)
                          .getData(searchQuery: searchController.text);
                    },
                    controller: searchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: const Icon(Icons.search),
                      hintText: "Search",
                    ),
                  ),
                ),
                Container(
                  height: 50, // Height of the category list
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final isSelected = selectedCategory == categories[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ChoiceChip(
                          label: Text(categories[index]),
                          selected: selectedCategory == categories[index],
                          onSelected: (bool selected) {
                            setState(() {
                              selectedCategory = categories[index];
                            });
                            Provider.of<HomeController>(context, listen: false)
                                .getData(searchQuery: selectedCategory);
                          },
                          // backgroundColor: Color.fromRGBO(253, 210, 178, 1.0),
                          selectedColor: Color.fromRGBO(253, 210, 178, 1.0),
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: isSelected ? Colors.red : Colors.black,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: homepageProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homepageProvider.modelobj?.articles?.length ?? 0,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (homepageProvider.modelobj?.articles?[index] != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailsScreen(
                              newArticle:
                                  homepageProvider.modelobj!.articles![index],
                            ),
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black, // Border color
                            width: 1.0, // Border width
                          ),
                          // color: Color.fromRGBO(253, 210, 178, 1.0),
                        ),
                        child: ListTile(
                          trailing: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Share.share("share ",
                                      subject: homepageProvider
                                          .modelobj?.articles?[index].title);
                                },
                                icon: SizedBox(
                                  height: 40,
                                  child: Icon(
                                    Icons.share,
                                    size: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                          leading: SizedBox(
                            child: Image.network(
                              homepageProvider
                                      .modelobj?.articles?[index].urlToImage ??
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWz9tftw9qculFH1gxieWkxL6rbRk_hrXTSg&s',
                              height: 300,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          title: Text(
                            homepageProvider.modelobj?.articles?[index].title
                                    .toString() ??
                                '',
                            maxLines: 3,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            homepageProvider
                                    .modelobj?.articles?[index].description
                                    .toString() ??
                                '',
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
