import 'package:flutter/material.dart';
import 'package:flutter_novel/common/adapt.dart';
import 'package:flutter_novel/models/article.dart';
import 'package:flutter_novel/pages/reader/reader_overlayer.dart';
import 'package:flutter_novel/pages/reader/reader_utils.dart';

import 'reader_config.dart';

class ReaderView extends StatelessWidget {
  final Article article;
  final int page;
  final double topSafeHeight;

  ReaderView({this.article, this.page, this.topSafeHeight});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Positioned(
        //     left: 0,
        //     top: 0,
        //     right: 0,
        //     bottom: 0,
        //     child: ),
        ReaderOverlayer(
            article: article, page: page, topSafeHeight: topSafeHeight),
        buildContent(article, page),
      ],
    );
  }

  buildContent(Article article, int page) {
    var content = article.stringAtPageIndex(page);

    if (content.startsWith('\n')) {
      content = content.substring(1);
    }
    return Container(
      // constraints: BoxConstraints(minHeight: Adapt.height / 2),
      color: Colors.transparent,
      margin: EdgeInsets.fromLTRB(
          ReaderUtils.leftOffset,
          ReaderUtils.topOffset,
          ReaderUtils.rightOffset,
          Adapt.paddingBottom() + ReaderUtils.bottomOffset),
      child: Text.rich(
        TextSpan(children: [
          TextSpan(
              text: content,
              style: TextStyle(
                  color: Color(ReaderConfig.color),
                  // wordSpacing: -10,
                  fontSize: (ReaderConfig.fontSize),
                  height: ReaderConfig.lineHeight))
        ]),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
