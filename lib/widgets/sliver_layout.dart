import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatefulWidget {
  final Widget? floatingWidget;
  final Widget? child;
  final Widget? background;
  final double heightFactor;
  final double floatingHeight;
  final String? title;
  final bool showBackButton;

  const CustomSliverAppBar({
    super.key,
    this.floatingWidget,
    this.child,
    this.background,
    this.title,
    this.heightFactor = 0.3,
    this.floatingHeight = 0,
    this.showBackButton = false,
  });

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  final ScrollController _scrollController = ScrollController();
  double _offset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _offset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight =
        MediaQuery.of(context).size.height * widget.heightFactor;
    final slowOffset = _offset * 0.9;

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                expandedHeight: appBarHeight,
                elevation: 0,
                backgroundColor: const Color(0xFFFEF3E2),
                flexibleSpace: FlexibleSpaceBar(
                  background: widget.background ?? _buildDefaultBackground(),
                ),
                leading: widget.showBackButton
                    ? IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      )
                    : null,
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: widget.floatingHeight),
                sliver: SliverToBoxAdapter(
                  child: widget.child ?? Container(),
                ),
              ),
            ],
          ),
          if (widget.floatingWidget != null)
            Positioned(
              top: appBarHeight - slowOffset,
              left: 0,
              right: 0,
              child: _buildFloatingWidget(context),
            ),
        ],
      ),
    );
  }

  Widget _buildFloatingWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: widget.floatingHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: widget.floatingWidget,
      ),
    );
  }

  Widget _buildDefaultBackground() {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text('Background'),
      ),
    );
  }
}
