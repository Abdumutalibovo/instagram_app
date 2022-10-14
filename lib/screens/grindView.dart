import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram/utils/images.dart';

class grindViewPage extends StatefulWidget {
  const grindViewPage({super.key});

  @override
  State<grindViewPage> createState() => _grindViewPageState();
}

class _grindViewPageState extends State<grindViewPage> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
	      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
	      crossAxisSpacing: 0,
	      mainAxisSpacing: 0,
	      crossAxisCount: 3,
	),
	    itemCount: 30,
	    itemBuilder: (context, index) {
        return Container(
          child: Image.network("https://i.pravatar.cc/300?img=$index"),
        );
	},
),
    );
  }
}

