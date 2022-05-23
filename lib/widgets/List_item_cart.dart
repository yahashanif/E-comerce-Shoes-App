part of 'widgets.dart';

class ListItem extends StatefulWidget {
  final bool? isCart;
  final bool? isFavorite;
  ListItem({
    this.isCart = false,
    this.isFavorite = false,
  });

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.fromLTRB(20, 20, widget.isCart! ? 36 : 20, 11),
      decoration: BoxDecoration(
          border: Border.all(color: greyColor),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 65,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage("assets/test.jpg"))),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Converse x Gorillaz",
                        style: ProductNameStyle.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Rp. 400.000",
                        style: labelStyle.copyWith(fontSize: 12),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      widget.isFavorite!
                          ? SizedBox()
                          : Row(
                              children: [
                                Text(
                                  "Size : ",
                                  style: subTitleStyle.copyWith(fontSize: 12),
                                ),
                                Text(
                                  "42",
                                  style: subTitleStyle.copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                    ],
                  ),
                ],
              ),
              widget.isCart!
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/icons/add.png", width: 15),
                        SizedBox(
                          height: 7,
                        ),
                        Text("2"),
                        SizedBox(
                          height: 7,
                        ),
                        Image.asset("assets/icons/min.png", width: 15),
                      ],
                    )
                  : widget.isFavorite!
                      ? Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: greyColor),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.favorite,
                            color: primaryColor,
                          ),
                        )
                      : Text(
                          "100 Items",
                          style: ProductCategoryStyle.copyWith(fontSize: 12),
                        )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          widget.isCart!
              ? Row(
                  children: [
                    Image.asset("assets/icons/trash.png", width: 15),
                    Text(
                      "Remove",
                      style: ProductNameStyle.copyWith(
                          fontSize: 8, color: removeColor),
                    ),
                  ],
                )
              : SizedBox()
        ],
      ),
    );
  }
}
