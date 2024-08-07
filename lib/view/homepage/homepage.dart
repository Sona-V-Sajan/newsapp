import 'package:flutter/material.dart';
import 'package:news_application/controller/homecontroller.dart';
import 'package:news_application/view/news_details_screen/news_details_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController SearchController = TextEditingController();

  @override
  void initState() {
    Provider.of<HomeController>(context, listen: false).getData();
    super.initState();
  }

  // Future fetchData({String searchQuery = "bussiness"}) async {
  //   await homepageprovider.getData(searchQuery: searchQuery);

  // }

  @override
  Widget build(BuildContext context) {
    var homepageprovider = Provider.of<HomeController>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10),
          child: TextField(
              onChanged: (value) {
                Provider.of<HomeController>(context, listen: false)
                    .getData(searchQuery: SearchController.text);
              },
              controller: SearchController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "search")),
        ),
      ),
      body: homepageprovider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: homepageprovider.modelobj?.articles?.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (homepageprovider.modelobj?.articles?[index] != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsDetailsScreen(
                                      newArticle: homepageprovider
                                          .modelobj!.articles![index],
                                    )));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Image(
                          image: NetworkImage(homepageprovider
                                  .modelobj?.articles?[index].urlToImage ??
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWz9tftw9qculFH1gxieWkxL6rbRk_hrXTSg&s'),
                          height: 80,
                          width: 90,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          homepageprovider.modelobj?.articles?[index].title
                                  .toString() ??
                              '',
                          style: TextStyle(color: Colors.black),
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
