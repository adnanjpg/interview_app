import 'package:flutter/material.dart';

import 'default_paginationer.dart';
import 'paginationer_type.dart';

/// this paginationer handles all scroll and loading events,
/// but its difference from [Paginationer] is that
/// it does not handle rebuilds.
///
/// {@macro adnan_flutter.paginationer.description}
///
///
class StatelessPaginationer<T> extends StatefulWidget {
  const StatelessPaginationer({
    Key? key,
    required this.emptyChildren,
    required this.future,
    required this.builder,
    required this.items,
    this.initialWidgets,
    this.paginationed = true,
    this.shrinkWrap = false,
    this.reverse = false,
    this.scrollDirection = Axis.vertical,
    this.loadOn,
    this.controller,
    this.primary,
    this.pageStartFrom = 1,
    // keep it this way for now, to not break anything.
    this.type = PaginationerType.scrollBased,
  })  : assert(type == PaginationerType.scrollBased
            ? (loadOn == null || loadOn >= 0.0 && loadOn <= 1.0)
            : true),
        super(key: key);

  /// will be inserted to the tree when
  /// we start loading, and will be removed
  /// when we finish loading.
  final List<Widget> emptyChildren;

  /// pre loaded widgets that will show above the
  /// Future data.
  ///
  /// NOTE: when you pass this variable,
  /// the current page will start from 2.
  final List<Widget>? initialWidgets;

  /// return found any data or not.
  final Future<bool> Function(int currentPage) future;

  final List<T> items;

  final Widget Function(BuildContext context, int index) builder;

  final Axis scrollDirection;

  /// if passed, the scroll control
  /// will be from parent, and thus
  /// load with un-paginated Widget
  /// above it.
  final ScrollController? controller;

  /// {@template adnan_flutter.paginationer.load_on}
  /// if (type == PaginationerType.ScrollBased),
  /// the `loadOn` parameter indicates in what percentage
  /// of the screen the load will be triggered.
  /// {@endtemplate}
  ///
  ///
  /// the value should be
  /// between 0.0 and 1.0. default is 0.8.
  final double? loadOn;

  /// wether to run the [future] methods,
  /// on reaching the scroll bound.
  final bool paginationed;

  final bool reverse;

  final bool shrinkWrap;

  final PaginationerType type;

  final bool? primary;

  /// which page to start from.
  /// defualts to 1.
  /// if you pass [initialWidgets],
  /// you might want to start from 2.
  final int pageStartFrom;

  @override
  // ignore: no_logic_in_create_state
  State<StatelessPaginationer> createState() {
    if (type == PaginationerType.scrollBased) {
      return _ScrollBased();
    } else {
      return _ItemBased();
    }
  }
}

bool _isNotEmpty(List? list) {
  return list != null && list.isNotEmpty;
}

class _ScrollBased<T> extends State<StatelessPaginationer<T>> {
  List<T> get items => widget.items;

  bool get hasItems {
    return _isNotEmpty(items);
  }

  bool get hasInitialChildren {
    return _isNotEmpty(widget.initialWidgets);
  }

  bool get allEmpty => !hasItems && !hasInitialChildren;

  bool isLoading = false;

  late bool noMoreData;

  late ScrollController controller;

  late int currentPage;

  // loading children.
  // will go back and forth adding and deleting
  // on each load
  List<Widget> additionalChildren = [];

  // manages adding and removing loading widgets.
  Future<void> load({required VoidCallback onEmpty}) async {
    // add loading widgets to the tree
    additionalChildren = widget.emptyChildren;
    if (mounted) setState(() {});

    isLoading = true;

    final future = await widget.future(currentPage);
    if (future) {
      currentPage++;
    } else {
      onEmpty();
    }

    isLoading = false;

    additionalChildren = [];

    if (mounted) setState(() {});
  }

  /// loads more data;
  Future<void> loadMore() async {
    if (
        //
        noMoreData == false && // if data is ended
            isLoading == false && // if currently loading other data
            //
            (
                // if we reached the `loadOn` percentage of the screen
                controller.offset >=
                    controller.position.maxScrollExtent * (widget.loadOn ?? .8)
            //
            ) &&
            // if we are not out of range
            !controller.position.outOfRange
        //
        ) {
      await load(
        onEmpty: () {
          noMoreData = true;
        },
      );
    }
  }

  /// initializes data for the first load;
  Future<void> initializeData() async {
    await load(
      onEmpty: () {
        // items = null;
      },
    );
  }

  @override
  void initState() {
    controller = widget.controller ?? ScrollController();

    noMoreData = !widget.paginationed;

    currentPage = widget.pageStartFrom;

    controller.addListener(loadMore);

    initializeData();

    super.initState();
  }

  @override
  void dispose() {
    // do not dispose a controller
    // passed as an argument, or
    // it would result in chaotic
    // stuff!!
    if (widget.controller == null) controller.dispose();

    super.dispose();
  }

  List<Widget> get children {
    if (items.isEmpty == true) return [];

    final _output = <Widget>[];

    for (var i = 0; i < items.length; i++) {
      final Widget res = widget.builder(context, i);
      _output.add(res);
    }

    return _output;
  }

  @override
  Widget build(BuildContext context) {
    final widgets = [
      if (hasInitialChildren) ...widget.initialWidgets!,
      ...children,
      if (additionalChildren.isNotEmpty) ...additionalChildren,
    ];

    if (widgets.isEmpty) return Container();

    return ListView.builder(
      reverse: widget.reverse,
      // force if parent is a scrollable widget.
      shrinkWrap: widget.controller != null || widget.shrinkWrap,
      // assert(!(controller != null && primary == true)
      primary: widget.primary ?? false,
      key: widget.key,
      itemCount: widgets.length,
      scrollDirection: widget.scrollDirection,
      itemBuilder: (context, index) {
        return widgets.elementAt(index);
      },
      // do not have a controller if parent does.
      controller: widget.controller == null ? controller : null,
    );
  }
}

class _ItemBased<T> extends State<StatelessPaginationer<T>> {
  List<T> get items => widget.items;

  bool get hasItems {
    return _isNotEmpty(items);
  }

  bool get hasInitialChildren {
    return _isNotEmpty(widget.initialWidgets);
  }

  bool get allEmpty => !hasItems && !hasInitialChildren;

  bool isLoading = false;

  late bool noMoreData;

  late ScrollController controller;

  late int currentPage;

  // loading children.
  // will go back and forth adding and deleting
  // on each load
  List<Widget> additionalChildren = [];

  // manages adding and removing loading widgets.
  Future<void> load({required VoidCallback onEmpty}) async {
    // add loading widgets to the tree
    additionalChildren = widget.emptyChildren;
    if (mounted) setState(() {});

    isLoading = true;

    final future = await widget.future(currentPage);
    if (future) {
      currentPage++;
    } else {
      onEmpty();
    }

    isLoading = false;

    additionalChildren = [];
  }

  setSt() {
    if (mounted) {
      Future.microtask(
        () {
          setState(() {});
        },
      );
    }
  }

  /// loads more data;
  Future<void> loadMore() async {
    if (noMoreData == false && // if data is ended
            isLoading == false // if currently loading other data

        ) {
      await load(
        onEmpty: () {
          noMoreData = true;
        },
      );
    }
  }

  /// initializes data for the first load;
  Future<void> initializeData() async {
    await load(
      onEmpty: () {
        // items = null;
      },
    );
  }

  @override
  void initState() {
    noMoreData = !widget.paginationed;

    currentPage = widget.pageStartFrom;

    initializeData();

    super.initState();
  }

  List<Widget> get children {
    if (items.isEmpty == true) return [];

    final _output = <Widget>[];

    for (var i = 0; i < items.length; i++) {
      final Widget res = widget.builder(context, i);
      _output.add(res);
    }

    return _output;
  }

  @override
  Widget build(BuildContext context) {
    final widgets = [
      if (hasInitialChildren) ...widget.initialWidgets!,
      ...children,
      if (additionalChildren.isNotEmpty) ...additionalChildren,
    ];

    if (widgets.isEmpty) return Container();

    return ListView.builder(
      reverse: widget.reverse,
      // force if parent is a scrollable widget.
      shrinkWrap: widget.controller != null || widget.shrinkWrap,
      key: widget.key,
      primary: widget.primary,
      itemCount: widgets.length,
      scrollDirection: widget.scrollDirection,
      itemBuilder: (context, index) {
        if (index == widgets.length - 1) {
          loadMore();
        }
        return widgets.elementAt(index);
      },
    );
  }
}
