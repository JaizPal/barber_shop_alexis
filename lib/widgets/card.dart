import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class card extends StatelessWidget {
  final String title;
  final int time;
  final double cost;
  final double costJubilado;
  final String src;
  const card({
    Key? key,
    required this.title,
    required this.time,
    required this.cost,
    required this.costJubilado,
    required this.src,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NetworkImage image = const NetworkImage(
        "https://tendenzias.com//wp-content/uploads/2022/03/Cortes-de-pelo-hombre-corto-por-los-lados-y-largo-por-arriba-corte-undercut-istock-600x600.jpg");

    TextStyle textTitle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
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
                    alignment: Alignment(-1, -1),
                    fit: BoxFit.fitWidth,
                    image: image,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Corte de pelo",
                      style: textTitle,
                    )),
                collapsed: Text("20 minutos"),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("20 minutos"),
                    Text("17 €"),
                    Text("Jubilados 10€"),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
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
}
