import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:onest/class/Post.dart';

import '../AppColors.dart';
import '../AuthHandler.dart';
import '../widgets/CustomSnackBar.dart';
import '../widgets/PostCard.dart';
import '../widgets/PrivateScaffold.dart';
import '../widgets/SearchCity.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const route = '/home';

  @override
  State<Home> createState() => HomeState();
}

const int CARDS_PER_PAGE = 10;

class HomeState extends State<Home> {
  List<Post> posts = [];
  int page = 0;
  bool feedEnded = false;
  bool loading = false;
  String search = "";
  final ScrollController scrollController = ScrollController();

  fetch({int take = CARDS_PER_PAGE, int skip = 0, String? search}) async {
    setState(() {
      loading = true;
      feedEnded = false;
    });

    final req = await http.get(
      Uri.parse(dotenv.env['API']! +
          "/post/feed?take=$take&skip=$skip" +
          (search != null ? "&search=" + search : "")),
    );

    print('Lazy loading page $page from $skip');

    ScaffoldMessenger.of(context).clearSnackBars();

    if (req.statusCode != 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(message: "Une erreur serveur est survenue"));

      return;
    }

    var decodedBody = jsonDecode(req.body);

    if (decodedBody.length != 0) {
      setState(() {
        if (page == 0 && search != null) {
          posts = List.from(decodedBody.map((post) => Post.fromJson(post)))
              .cast<Post>();
        } else {
          posts.addAll(List.from(decodedBody.map((post) => Post.fromJson(post)))
              .cast<Post>());
        }

        page++;
      });
    } else {
      setState(() {
        feedEnded = true;
      });
    }

    setState(() {
      loading = false;
    });

    return req;
  }

  @override
  void initState() {
    fetch();

    super.initState();
  }

  bool onNotification(ScrollEndNotification t) {
    if (loading) return true;

    if (t.metrics.pixels > 0 && t.metrics.atEdge) {
      fetch(skip: page * CARDS_PER_PAGE, search: search);
    }

    return true;
  }

  void onSearch(String v) {
    setState(() {
      page = 0;
      search = v;
    });

    scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );

    fetch(take: CARDS_PER_PAGE, skip: 0, search: v);
  }

  @override
  Widget build(BuildContext context) {
    var window = MediaQuery.of(context).size;

    return PrivateScaffold(
      title: SearchCity(onSearch: onSearch),
      useAppbar: true,
      useBackButton: false,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/wavy.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: NotificationListener<ScrollEndNotification>(
            onNotification: onNotification,
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.all(0),
              children: [
                ...posts
                    .map(
                      (post) => PostCard(post: post),
                    )
                    .toList(),
                if (!feedEnded || loading)
                  Container(
                    height: 200,
                    padding: const EdgeInsets.all(20),
                    child: LoadingIndicator(
                      indicatorType: Indicator.lineScalePulseOutRapid,
                      colors: [AppColors.orangeColor.shade900],
                      strokeWidth: 1,
                      backgroundColor: Colors.transparent,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
