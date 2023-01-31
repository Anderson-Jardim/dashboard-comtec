import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'package:syncfusion_flutter_maps/maps.dart';

class Mapa extends StatefulWidget {
  const Mapa({
    Key? key,
  }) : super(key: key);

  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  _MapaState();

  late MapShapeSource _mapShapeSource;

  late List<_InternetPrice> _internetPriceForShapes;

  late List<MapColorMapper> _shapeColorMappers;

  bool _showBubbleData = false;
  bool _showBarLegend = false;
  bool _enableGradient = false;


 /*  late String _currentLegend; */

  @override
  void initState() {
    super.initState();

    _internetPriceForShapes = <_InternetPrice>[
      const _InternetPrice('Argentina', price: 3.8),
      const _InternetPrice('Brazil', price: 5.6),
      const _InternetPrice('Chile', price: 6.5),
      const _InternetPrice('Colombia', price: 1),
      const _InternetPrice('Ecuador', price: 3.5),
      const _InternetPrice('Peru', price: 6),
      const _InternetPrice('Paraguay', price: 2.7),
      const _InternetPrice('Uruguay', price: 7),
      const _InternetPrice('Venezuela', price: 2.5),
    ];

    _shapeColorMappers = <MapColorMapper>[
      const MapColorMapper(
          from: 0,
          to: 0.99,
          color: Color.fromRGBO(3, 192, 150, 1),
          text: 'Brazil: R\$ 5.6 M'),
      const MapColorMapper(
          from: 1.0,
          to: 4.99,
          color: Color.fromRGBO(3, 192, 150, 0.6),
          text: 'Venezuela: R\$ 2.5 M'),
      const MapColorMapper(
          from: 5,
          to: 9.99,
          color: Color.fromRGBO(3, 192, 150, 0.35),
          text: 'Colombia: R\$ 1 M'),
      const MapColorMapper(
          from: 10,
          to: 29.99,
          color: Color.fromRGBO(3, 192, 150, 1),
          text: 'Ecuador: R\$ 3.5 M'),
      const MapColorMapper(
          from: 30,
          to: 100,
          color: Color.fromRGBO(3, 192, 150, 1),
          text: 'Peru: R\$ 6 M'),
      const MapColorMapper(
          from: 30,
          to: 100,
          color: Color.fromRGBO(3, 192, 150, 1),
          text: 'Paraguay: R\$ 2.7 M'),
      const MapColorMapper(
          from: 30,
          to: 100,
          color: Color.fromRGBO(3, 192, 150, 1),
          text: 'Uruguay: R\$ 7 M'),
      const MapColorMapper(
          from: 30,
          to: 100,
          color: Color.fromRGBO(3, 192, 150, 1),
          text: 'Argentina: R\$ 3.8 M'),
      const MapColorMapper(
          from: 30,
          to: 100,
          color: Color.fromRGBO(3, 192, 150, 1),
          text: 'Chile: R\$ 6.5 M'),
    ];

    _mapShapeSource = MapShapeSource.asset(
      'assets/south_america.json',
      shapeDataField: 'name',
      dataCount: _internetPriceForShapes.length,
      primaryValueMapper: (int index) =>
          _internetPriceForShapes[index].actualCountryName,
      shapeColorValueMapper: (int index) =>
          _internetPriceForShapes[index].price,
      shapeColorMappers: _shapeColorMappers,
    );

  }

  @override
  void dispose() {
    _internetPriceForShapes.clear();
    _shapeColorMappers.clear();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final bool scrollEnabled = constraints.maxHeight > 400;
      double height = scrollEnabled ? constraints.maxHeight : 400;
      {
        final double refHeight = height * 0.6;
        height = height > 500 ? (refHeight < 500 ? 500 : refHeight) : height;
      }
      return Center(
        child: Container(
          child: SizedBox(
            width: constraints.maxWidth,
            height: height,
            child: _buildMapsWidget(scrollEnabled),
          ),
        ),
      );
    });
  }

  Widget _buildMapsWidget(bool scrollEnabled) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: SfMapsTheme(
          data: SfMapsThemeData(
            shapeHoverColor: Colors.transparent,
            shapeHoverStrokeColor: Colors.transparent,
            bubbleHoverColor: Colors.transparent,
            bubbleHoverStrokeColor: Colors.transparent,
            toggledItemColor: Colors.transparent,
            toggledItemStrokeColor: Colors.transparent,
          ),
          child: Column(children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    top: 15, bottom: (_enableGradient) ? 18 : 30),
                child: Align(
                    child: Text('Vendas Totais America do Sul',
                        style: Theme.of(context).textTheme.subtitle1))),
            Expanded(
                child: SfMaps(
              layers: <MapShapeLayer>[
                MapShapeLayer(
                  loadingBuilder: (BuildContext context) {
                    return const SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    );
                  },
                  strokeWidth: 1,
                  source: _mapShapeSource,
                  showDataLabels: true,
                  shapeTooltipBuilder: _showBubbleData
                      ? null
                      : (BuildContext context, int index) {
                          if (_internetPriceForShapes[index].price == null) {
                            return const SizedBox();
                          }
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'País : ${_internetPriceForShapes[index].countryName ?? _internetPriceForShapes[index].actualCountryName}\nTotal Vendas : \$${_internetPriceForShapes[index].price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                    color: scrollEnabled
                                        ? const Color.fromRGBO(255, 255, 255, 1)
                                        : const Color.fromRGBO(10, 10, 10, 1),
                                  ),
                            ),
                          );
                        },
                  color: _showBubbleData
                      ? (scrollEnabled
                          ? const Color.fromRGBO(204, 204, 204, 1)
                          : const Color.fromRGBO(103, 103, 103, 1))
                      : null,
                  strokeColor: _showBubbleData
                      ? (scrollEnabled
                          ? const Color.fromRGBO(255, 255, 255, 1)
                          : const Color.fromRGBO(49, 49, 49, 1))
                      : const Color.fromRGBO(255, 255, 255, 1),
                  legend: _showBarLegend
                      ? MapLegend.bar(
                          _showBubbleData
                              ? MapElement.bubble
                              : MapElement.shape,
                          labelsPlacement:
                              MapLegendLabelsPlacement.betweenItems,
                          spacing: _enableGradient ? 10.0 : 1.0,
                          segmentPaintingStyle: _enableGradient
                              ? MapLegendPaintingStyle.gradient
                              : MapLegendPaintingStyle.solid,
                          segmentSize: _enableGradient
                              ? const Size(279.0, 9.0)
                              : const Size(55.0, 9.0),
                          showPointerOnHover: true,
                          padding: const EdgeInsets.only(bottom: 20),
                        )
                      : MapLegend(
                          _showBubbleData
                              ? MapElement.bubble
                              : MapElement.shape,
                          position: MapLegendPosition.left,
                          iconType: MapIconType.rectangle,
                          /* enableToggleInteraction: _enableToggleInteraction, */
                        ),
                  tooltipSettings: MapTooltipSettings(
                    color: scrollEnabled
                        ? const Color.fromRGBO(45, 45, 45, 1)
                        : const Color.fromRGBO(242, 242, 242, 1),
                  ),
                ),
              ],
            )),
          ]),
        ));
  }

  Widget buildSettings(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter stateSetter) {
      return Container(
          child: Column(
        mainAxisSize: MainAxisSize.min,      
            children: const <Widget>[],
          
      ));
    });
  }
}

class _InternetPrice {
  const _InternetPrice(
    this.actualCountryName, {
    this.price,
    this.countryName,
  });

  final String actualCountryName;
  final double? price;
  final String? countryName;
}
