

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'day_card.dart';

class DaysList extends StatefulWidget {
  const DaysList({Key? key}) : super(key: key);

  @override
  State<DaysList> createState() => _DaysListState();
}

class _DaysListState extends State<DaysList> {

  final Key nextListKey = UniqueKey();
  static const _pageSize = 10;

  late final PagingController<DateTime, DateTime> _pagingNextController = PagingController(firstPageKey: DateUtils.dateOnly(DateTime.now()));
  late final PagingController<DateTime, DateTime> _pagingPreviousController = PagingController(firstPageKey: DateUtils.dateOnly(DateTime.now()));

  @override
  void initState() {
    super.initState();

    _pagingNextController.addPageRequestListener((pageKey) {
      _fetchNextPage(pageKey);
    });

    _pagingPreviousController.addPageRequestListener((pageKey) {
      _fetchPreviousPage(pageKey);
    });

  }

  @override
  void dispose() {
    _pagingNextController.dispose();
    _pagingPreviousController.dispose();
    super.dispose();
  }

  Future<void> _fetchNextPage(DateTime pageKey) async {
    try {
      final newItems = [for (int i = 0; i < _pageSize; i++) pageKey.add(Duration(days: i))];

      _pagingNextController.appendPage(newItems, newItems.last);


    } catch (error) {
      _pagingNextController.error = error;
    }
  }

  Future<void> _fetchPreviousPage(DateTime pageKey) async {
    try {
      final newItems = [for (int i = 0; i < _pageSize; i++) pageKey.add(Duration(days: i - _pageSize))];

      _pagingPreviousController.appendPage(newItems.reversed.toList(), newItems.first);

    } catch (error) {
      _pagingPreviousController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scrollable(
      axisDirection: AxisDirection.right,
      viewportBuilder: (BuildContext context, ViewportOffset position) {
        return Viewport(
          offset: position,
          center: nextListKey,
          axisDirection: AxisDirection.right,
          slivers: [
            PagedSliverList(
              pagingController: _pagingPreviousController,
              builderDelegate: PagedChildBuilderDelegate<DateTime>(
                itemBuilder: (context, day, index) {
                  // print(day);
                  return DayCard(day: day);
                },
              ),
            ),
            PagedSliverList(
              key: nextListKey,
              pagingController: _pagingNextController,
              builderDelegate: PagedChildBuilderDelegate<DateTime>(
                itemBuilder: (context, day, index) {
                  // print(day);
                  return DayCard(day: day);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
