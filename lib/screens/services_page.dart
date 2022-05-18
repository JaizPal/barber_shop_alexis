import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../widgets/service_card_widget.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListView(
        children: [
          serviceCard(context,
              title: "Corte de pelo",
              duration: 20,
              cost: 16,
              costJubilado: 10,
              src:
                  "https://tendenzias.com//wp-content/uploads/2022/03/Cortes-de-pelo-hombre-corto-por-los-lados-y-largo-por-arriba-corte-undercut-istock-600x600.jpg",
              algn: const Alignment(0, -1)),
          serviceCard(context,
              title: "Corte de barba",
              duration: 15,
              cost: 8,
              costJubilado: 5,
              src:
                  "https://sp-ao.shortpixel.ai/client/q_glossy,ret_img,w_484/https://www.formacionaires.es/wp-content/uploads/2019/03/iStock_000084252567_Large-e1465271896270_opt.jpg",
              algn: const Alignment(0, -0.5)),
          serviceCard(context,
              title: "Corte de cejas",
              duration: 10,
              cost: 5,
              costJubilado: 5,
              src:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0oPKjVsSTQwlZesxo7XubY_GF5DnHkrb8Lw&usqp=CAU",
              algn: const Alignment(0, -0.5)),
          ExpandableNotifier(
              child: Column(
            children: [
              Expandable(
                collapsed: ExpandableButton(
                  child: Card(),
                ),
                expanded: Column(
                  children: [
                    Text("1"),
                    Text("2"),
                    ExpandableButton(
                      child: Text("3"),
                    )
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
