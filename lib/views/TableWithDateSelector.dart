import 'package:flutter/material.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

class StickyHeadersTableWithDateSelector extends StatefulWidget {
  StickyHeadersTableWithDateSelector({
    required this.columnsLength,
    required this.rowsLength,
    required this.columnsTitleBuilder,
    required this.rowsTitleBuilder,
    required this.contentCellBuilder,
    required this.dateCallback,
    required this.selectedDate,
    this.cellDimensions = CellDimensions.base,
    this.cellAlignments = CellAlignments.base,
  });
  final DateTime selectedDate;
  final Function(DateTime date) dateCallback;
  final Widget Function(int columnIndex) columnsTitleBuilder;
  final Widget Function(int rowIndex) rowsTitleBuilder;
  final Widget Function(int columnIndex, int rowIndex) contentCellBuilder;
  final int columnsLength;
  final int rowsLength;
  final CellDimensions cellDimensions;
  final CellAlignments cellAlignments;
  final ScrollControllers scrollControllers = ScrollControllers();

  @override
  _StickyheadersTableWithDateSelectorState createState() =>
      _StickyheadersTableWithDateSelectorState();
}

class _StickyheadersTableWithDateSelectorState
    extends State<StickyHeadersTableWithDateSelector> {
  DateTime selectedDate = DateTime.now();
  late _SyncScrollController _horizontalSyncController;
  late _SyncScrollController _verticalSyncController;

  @override
  void initState() {
    super.initState();
    _verticalSyncController = _SyncScrollController([
      widget.scrollControllers._verticalTitleController,
      widget.scrollControllers._verticalBodyController,
    ]);
    _horizontalSyncController = _SyncScrollController([
      widget.scrollControllers._horizontalTitleController,
      widget.scrollControllers._horizontalBodyController,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            //StickyLegend
            GestureDetector(
              onTap: () => openDateSelector(),
              child: Container(
                width: widget.cellDimensions.stickyLegendWidth,
                height: widget.cellDimensions.stickyLegendHeight,
                child: Text(selectedDate.toString()),
              ),
            ),
            //StickyRow
            Expanded(
              child: NotificationListener<ScrollNotification>(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      widget.columnsLength,
                      (i) => GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        //onTap: ()=>this.onColumnTitlePressed(i) ,
                        child: Container(
                          width: widget.cellDimensions.stickyWidth(i),
                          height: widget.cellDimensions.stickyLegendHeight,
                          alignment: widget.cellAlignments.rowAlignment(i),
                          child: widget.columnsTitleBuilder(i),
                        ),
                      ),
                    ),
                  ),
                  controller:
                      widget.scrollControllers._horizontalTitleController,
                ),
                onNotification: (ScrollNotification notification) {
                  final didEndScrolling =
                      _horizontalSyncController.processNotification(
                    notification,
                    widget.scrollControllers._horizontalTitleController,
                  );
                  /* if (widget.onEndScrolling != null && didEndScrolling) {
                    _scrollOffsetX = widget
                        .scrollControllers._horizontalTitleController.offset;
                    widget.onEndScrolling!(_scrollOffsetX, _scrollOffsetY);
                  } */
                  return true;
                },
              ),
            )
          ],
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Sticky Column
              NotificationListener<ScrollNotification>(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      widget.rowsLength,
                      (i) => GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        //onTap: () => widget.onRowTitlePressed(i),
                        child: Container(
                          width: widget.cellDimensions.stickyLegendWidth,
                          height: widget.cellDimensions.stickyHeight(i),
                          alignment: widget.cellAlignments.columnAlignment(i),
                          child: widget.rowsTitleBuilder(i),
                        ),
                      ),
                    ),
                  ),
                  controller: widget.scrollControllers._verticalTitleController,
                ),
                onNotification: (ScrollNotification notification) {
                  final didEndScrolling =
                      _verticalSyncController.processNotification(
                    notification,
                    widget.scrollControllers._verticalTitleController,
                  );
                  /* if (widget.onEndScrolling != null && didEndScrolling) {
                    _scrollOffsetY = widget
                        .scrollControllers._verticalTitleController.offset;
                    widget.onEndScrolling!(_scrollOffsetX, _scrollOffsetY);
                  } */
                  return true;
                },
              ),
              // CONTENT
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller:
                        widget.scrollControllers._horizontalBodyController,
                    child: NotificationListener<ScrollNotification>(
                      child: SingleChildScrollView(
                        controller:
                            widget.scrollControllers._verticalBodyController,
                        child: Column(
                          children: List.generate(
                            widget.rowsLength,
                            (int rowIdx) => Row(
                              children: List.generate(
                                widget.columnsLength,
                                (int columnIdx) => GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  /* onTap: () => widget.onContentCellPressed(
                                      columnIdx, rowIdx), */
                                  child: Container(
                                    width: widget.cellDimensions
                                        .contentSize(rowIdx, columnIdx)
                                        .width,
                                    height: widget.cellDimensions
                                        .contentSize(rowIdx, columnIdx)
                                        .height,
                                    alignment: widget.cellAlignments
                                        .contentAlignment(rowIdx, columnIdx),
                                    child: widget.contentCellBuilder(
                                        columnIdx, rowIdx),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      onNotification: (ScrollNotification notification) {
                        final didEndScrolling =
                            _verticalSyncController.processNotification(
                          notification,
                          widget.scrollControllers._verticalBodyController,
                        );
                        /* if (widget.onEndScrolling != null && didEndScrolling) {
                          _scrollOffsetY = widget
                              .scrollControllers._verticalBodyController.offset;
                          widget.onEndScrolling!(
                              _scrollOffsetX, _scrollOffsetY);
                        } */
                        return true;
                      },
                    ),
                  ),
                  onNotification: (ScrollNotification notification) {
                    final didEndScrolling =
                        _horizontalSyncController.processNotification(
                      notification,
                      widget.scrollControllers._horizontalBodyController,
                    );
                    /* if (widget.onEndScrolling != null && didEndScrolling) {
                      _scrollOffsetX = widget
                          .scrollControllers._horizontalBodyController.offset;
                      widget.onEndScrolling!(_scrollOffsetX, _scrollOffsetY);
                    } */
                    return true;
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
    /* (
      columnsLength: columnsLength,
      rowsLength: rowsLength,
      columnsTitleBuilder: columnsTitleBuilder,
      rowsTitleBuilder: rowsTitleBuilder,
      contentCellBuilder: contentCellBuilder,
      legendCell: Text(""),
    ); */
  }

  void openDateSelector() {
    //open calender or sth to select a new Date
  }
}

class ScrollControllers {
  final ScrollController _verticalTitleController;
  final ScrollController _verticalBodyController;

  final ScrollController _horizontalBodyController;
  final ScrollController _horizontalTitleController;

  ScrollControllers({
    ScrollController? verticalTitleController,
    ScrollController? verticalBodyController,
    ScrollController? horizontalBodyController,
    ScrollController? horizontalTitleController,
  })  : this._verticalTitleController =
            verticalTitleController ?? ScrollController(),
        this._verticalBodyController =
            verticalBodyController ?? ScrollController(),
        this._horizontalBodyController =
            horizontalBodyController ?? ScrollController(),
        this._horizontalTitleController =
            horizontalTitleController ?? ScrollController();
}

/// SyncScrollController keeps scroll controllers in sync.
class _SyncScrollController {
  _SyncScrollController(List<ScrollController> controllers) {
    controllers
        .forEach((controller) => _registeredScrollControllers.add(controller));
  }

  final List<ScrollController> _registeredScrollControllers = [];

  ScrollController? _scrollingController;
  bool _scrollingActive = false;

  /// Returns true if reached scroll end
  bool processNotification(
    ScrollNotification notification,
    ScrollController controller,
  ) {
    if (notification is ScrollStartNotification && !_scrollingActive) {
      _scrollingController = controller;
      _scrollingActive = true;
      return false;
    }

    if (identical(controller, _scrollingController) && _scrollingActive) {
      if (notification is ScrollEndNotification) {
        _scrollingController = null;
        _scrollingActive = false;
        return true;
      }

      if (notification is ScrollUpdateNotification) {
        for (ScrollController controller in _registeredScrollControllers) {
          if (identical(_scrollingController, controller)) continue;
          controller.jumpTo(_scrollingController!.offset);
        }
      }
    }
    return false;
  }
}
