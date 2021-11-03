import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:news/module/web_view.dart';

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 10),
      child: Container(
        height: 1,
        color: Colors.grey,
      ),
    );

Widget buildNewsItem({required Map articles, required context}) => InkWell(
      onTap: () {
        navigateTo(context: context, widget: WebViewScreen(articles['url']));
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.all(20),
        child: AnimationConfiguration.staggeredList(
          position: 1, 
           duration: const Duration(milliseconds: 300),
          child: SlideAnimation(
            horizontalOffset: 50.0,
            child: FadeInAnimation(
              duration: const Duration(milliseconds: 50),
              curve: Curves.fastLinearToSlowEaseIn,
              child: Row(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          articles['urlToImage'] == null ? 'https://us.123rf.com/450wm/pavelstasevich/pavelstasevich1811/pavelstasevich181101028/112815904-no-image-available-icon-flat-vector-illustration.jpg?ver=6' : '${articles['urlToImage']}',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Text(
                              '${articles['title']}',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                              maxLines: 3,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Expanded(
                            child: Text(
                              '${articles['publishedAt']}',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

void navigateTo({required context, required widget}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}
