import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShinyBackdrop extends StatelessWidget {
  ShinyBackdrop({
    Key key,
    @required this.gradientCreator,
    @required this.extent,
    this.controller,
    this.child,
  }) : super(key: key);

  /// The image to paint.
  final GradientCreatorCallback gradientCreator;

  /// Scroll controller which determines scroll direction and notifies this
  /// widget of scroll position changes.
  ///
  /// If `null` then this widget uses nearest [Scrollable] ancestor to determine
  /// scroll direction and listen for scroll position changes.
  final ScrollController controller;

  /// Extent of this widget in scroll direction.
  ///
  /// If scroll direction is [Axis.vertical] it is the height of this widget,
  /// if scroll direction is [Axis.horizontal] it is the width.
  final double extent;

  /// The optional child of this widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final scrollPosition = (controller != null)
        ? controller.position
        : Scrollable.of(context).position;
    final constraints = (scrollPosition.axis == Axis.vertical)
        ? new BoxConstraints(minHeight: extent)
        : new BoxConstraints(minWidth: extent);
    return new RepaintBoundary(
      child: new ConstrainedBox(
        constraints: constraints,
        child: new _Shiny(
          gradientCreator: gradientCreator,
          scrollPosition: scrollPosition,
          child: child,
          screenSize: media.size,
        ),
      ),
    );
  }
}

class _Shiny extends SingleChildRenderObjectWidget {
  final GradientCreatorCallback gradientCreator;
  final ScrollPosition scrollPosition;
  final Size screenSize;

  _Shiny({
    Key key,
    @required this.gradientCreator,
    @required this.scrollPosition,
    @required this.screenSize,
    Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderShiny(
        gradientCreator: gradientCreator,
        screenSize: screenSize,
        scrollPosition: scrollPosition);
  }

  @override
  void updateRenderObject(BuildContext context, _RenderShiny renderObject) {
    renderObject
      .._scrollPosition = scrollPosition
      .._screenSize = screenSize
      ..gradientCreator = gradientCreator;
  }
}

typedef Gradient GradientCreatorCallback(double parallaxValue);

// "inspired" by https://github.com/pulyaevskiy/parallax-image
class _RenderShiny extends RenderProxyBox {
  Decoration _decoration;
  ScrollPosition _scrollPosition;
  Size _screenSize;
  BoxPainter _painter;
  Offset _position;
  GradientCreatorCallback _gradientCreator;
  ImageConfiguration configuration;

  _RenderShiny({
    @required ScrollPosition scrollPosition,
    @required GradientCreatorCallback gradientCreator,
    @required Size screenSize,
    this.configuration: ImageConfiguration.empty,
    RenderBox child,
  })  : _scrollPosition = scrollPosition,
        _gradientCreator = gradientCreator,
        _screenSize = screenSize,
        super(child) {
    _scrollPosition.addListener(markNeedsPaint);
  }
  set gradientCreator(GradientCreatorCallback value) {
    if (value == _gradientCreator) return;
    _gradientCreator = value;
    _painter?.dispose();
    _painter = null;
    _decoration = null;
    markNeedsPaint();
  }

  set scrollPosition(ScrollPosition value) {
    if (value == _scrollPosition) return;
    if (attached) _scrollPosition.removeListener(markNeedsPaint);
    _scrollPosition = value;
    if (attached) _scrollPosition.addListener(markNeedsPaint);
    // _scrollPosition.absorb(value);
    markNeedsPaint();
  }

  set screenSize(Size value) {
    if (value == _screenSize) return;
    _screenSize = value;
    markNeedsPaint();
  }

  get decoration {
    if (_decoration != null) return _decoration;
    double parallaxValue;
    if (_scrollPosition.axis == Axis.vertical) {
      parallaxValue = ((_position.dy / 100) % 4) - 2;
    } else {
      parallaxValue = ((_position.dx / 100) % 4) - 2;
    }

    _decoration = new BoxDecoration(gradient: _gradientCreator(parallaxValue));
    return _decoration;
  }

  BoxFit get fit {
    return (_scrollPosition.axis == Axis.vertical)
        ? BoxFit.fitWidth
        : BoxFit.fitHeight;
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _scrollPosition.addListener(markNeedsPaint);
  }

  @override
  void detach() {
    _painter?.dispose();
    _painter = null;
    _scrollPosition.removeListener(markNeedsPaint);
    super.detach();
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    assert(size.width != null);
    assert(size.height != null);
    // We use center of the widget's render box as a reference point.
    var pos = localToGlobal(new Offset(size.width / 2, size.height / 2));
    if (_position != pos) {
      _painter?.dispose();
      _painter = null;
      _decoration = null;
      _position = pos;
    }
    _painter ??= decoration.createBoxPainter(markNeedsPaint);
    final ImageConfiguration filledConfiguration =
        configuration.copyWith(size: size);
    int debugSaveCount;
    assert(() {
      debugSaveCount = context.canvas.getSaveCount();
      return true;
    }());
    _painter.paint(context.canvas, offset, filledConfiguration);
    assert(() {
      if (debugSaveCount != context.canvas.getSaveCount()) {
        throw new FlutterError(
            '${decoration.runtimeType} painter had mismatching save and restore calls.\n'
            'Before painting the decoration, the canvas save count was $debugSaveCount. '
            'After painting it, the canvas save count was ${context.canvas.getSaveCount()}. '
            'Every call to save() or saveLayer() must be matched by a call to restore().\n'
            'The decoration was:\n'
            '  $decoration\n'
            'The painter was:\n'
            '  $_painter');
      }
      return true;
    }());
    if (decoration.isComplex) context.setIsComplexHint();
    super.paint(context, offset);
  }
}
