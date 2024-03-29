import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class SetGoal extends StatelessWidget {
  const SetGoal({super.key});

  @override
  Widget build(BuildContext context) {
    calculateScreenSize(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Container(
            alignment: Alignment.centerRight,
            child: const Text("تعیین نقطه هدف",
                style: TextStyle(color: Colors.black54)),
          ),
        ),
        body: Column(
          children: [
            const Expanded(
                flex: 1, child: Center(child: Text("نقطه‌ی هدف را مشخص کنید"))),
            // a GridView with 10x10 cells
            Expanded(
              flex: 9,
              child: Container(
                height: getCellSize()[0],
                width: getCellSize()[1],
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Center(
                  child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 10,
                      children: List.generate(100, (index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: calculateBorderForCells(index),
                          ),
                          child: InkWell(
                            onTap: () {
                              List<int> offset = indexToOffset(index);
                              maze[offset[0]][offset[1]].value = 2;
                              Get.offNamed('/setWalls');
                            },
                            child: Center(child: Text(index.toString())),
                          ),
                        );
                      })),
                ),
              ),
            ),
          ],
        ));
  }
}
