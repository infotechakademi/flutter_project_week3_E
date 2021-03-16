import 'package:flutter/material.dart';

class SliversPage extends StatefulWidget {
  @override
  _SliversPageState createState() => _SliversPageState();
}

class _SliversPageState extends State<SliversPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          titleWidget(),
          headerWidget(),
          showcaseWidget(),
          headerWidget(),
          productListWidget(),
        ],
      ),
    );
  }

  titleWidget() {
    return SliverAppBar(
      title: Text("Products"),
      floating: true,
    );
  }

  productListWidget() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return listTileWidget;
        },
      ),
    );
  }

  showcaseWidget() {
    return SliverGrid(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return gridTileWidget;
        },
        childCount: 9,
      ),
    );
  }

  headerWidget() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: detailsTextWidget,
      ),
    );
  }

  var detailsTextWidget = Text(
      "Kargo bilgileri (temsili):\n\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.");

  var listTileWidget = ListTile(
    title: Text("Ürün"),
  );

  var gridTileWidget = GridTile(
    child: Card(
      child: Stack(
        children: [
          Positioned.fill(
            child: FittedBox(
              child: Icon(
                Icons.crop_square,
                color: Colors.grey.withAlpha(100),
              ),
            ),
          ),
          Center(
            child: Text("Ürün"),
          )
        ],
      ),
    ),
  );
}
