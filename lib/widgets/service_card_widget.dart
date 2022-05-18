import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

Widget serviceCard(
  BuildContext context, {
  required String title,
  required int duration,
  required double cost,
  required double costJubilado,
  required String src,
  required Alignment algn,
}) {
  NetworkImage image = NetworkImage(src);

  TextStyle styleTitle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  TextStyle textSubTitle = const TextStyle(
    fontSize: 16,
  );

  return ExpandableNotifier(
      child: Padding(
    padding: const EdgeInsets.all(10),
    child: Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 200,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: algn,
                  fit: BoxFit.fitWidth,
                  image: image,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
          ),
          ScrollOnExpand(
            scrollOnExpand: true,
            scrollOnCollapse: true,
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToCollapse: true,
                tapHeaderToExpand: true,
              ),
              header: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    title,
                    style: styleTitle,
                  )),
              collapsed: Text(
                "~ $duration minutos",
                style: textSubTitle,
              ),
              expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "~ $duration minutos",
                    style: textSubTitle,
                  ),
                  Text(
                    "Precio: $cost €",
                    style: textSubTitle,
                  ),
                  Text(
                    "Jubilados:\nPrecio: $costJubilado €",
                    style: textSubTitle,
                  ),
                ],
              ),
              builder: (_, collapsed, expanded) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 10, bottom: 10),
                  child: Expandable(
                    collapsed: collapsed,
                    expanded: expanded,
                    theme: const ExpandableThemeData(crossFadePoint: 0),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  ));
}
