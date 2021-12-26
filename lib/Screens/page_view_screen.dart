import 'package:azkarapp/models/zekrtype.dart';
import 'package:azkarapp/my_widgets/common_widget/circle_number.dart';
import 'package:azkarapp/my_widgets/common_widget/linear_percent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../dummy_data.dart';

class PageViewScreen extends StatefulWidget {
  static const routeName = 'PageViewScreen';
  final int? indexText;
  PageViewScreen({this.indexText});
  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  int pageIndex = 0;
  int start = 0;
  double progress = 0.0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // This is Variabls
    final routeArgu = ModalRoute.of(context)!.settings.arguments as Map;
    final categoryId = routeArgu['id'];
    final categoryTitle = routeArgu['title'];
    List<ZekrType> _displayZekr = DUMMY_ZEKR.where(
      (zekr) {
        return zekr.categories.contains(categoryId);
      },
    ).toList();

// This is root widgets
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title:
            Text(categoryTitle, style: Theme.of(context).textTheme.headline1),
      ),
      body: PageView(
        controller: pageController,
        reverse: true,
        children: _displayZekr.map((ZekrType item) {
          return Padding(
            padding: EdgeInsets.all(25),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  // when go the next page
                  if (start == item.numberInCircule &&
                      pageIndex + 1 < _displayZekr.length) {
                    pageController.jumpToPage(++pageIndex);
                    // when incremeant start and progress
                  } else if (progress < 1.0) {
                    ++start;
                    progress = progress + (1 / item.numberInCircule);
                  }
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  headWidget(_displayZekr),
                  SizedBox(height: 10),
                  contentWidget(item),
                  footerWidget(_displayZekr, item),
                ],
              ),
            ),
          );
        }).toList(),
        onPageChanged: (int current) {
          setState(() {
            start = 0;
            progress = 0.0;
            pageIndex = current;
          });
        },
      ),
    );
  }

  Widget footerWidget(List<ZekrType> _displayZekr, ZekrType item) {
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          // Icon Copy
          Expanded(
            flex: 1,
            child: IconButton(
              icon: const Icon(Icons.copy),
              onPressed: () {
                SnackBar snackBar = SnackBar(
                  content: Text('تم نسخ الذكر',
                      style: Theme.of(context).textTheme.headline3),
                  duration: Duration(seconds: 2),
                  backgroundColor: Theme.of(context).primaryColor,
                );
                Clipboard.setData(ClipboardData(text: item.description));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ),
          //Circle Number
          Expanded(
            flex: 3,
            child: circleNumber(start, progress, context),
          ),
          // Number Iteration
          Expanded(
            flex: 1,
            child: Text(
              _displayZekr[pageIndex].number,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ],
      ),
    );
  }

  Widget contentWidget(ZekrType item) {
    return Expanded(
      flex: 4,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 8,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            // Here show Zekr
            child: SingleChildScrollView(
              child: Text(
                item.description,
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget headWidget(List<ZekrType> _displayZekr) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            '${pageIndex + 1}' + ' / ' + '${_displayZekr.length}',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Expanded(
          flex: 3,
          child: linearPercent(pageIndex, _displayZekr, context),
        ),
      ],
    );
  }
}
