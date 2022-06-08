part of 'widgets.dart';

class ListItem extends StatefulWidget {
  final bool? isCart;
  final bool? isFavorite;
  final Cart? cart;
  final Product? product;
  ListItem({
    this.isCart = false,
    this.isFavorite = false,
    this.cart,
    this.product,
  });

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  final umumC = Get.find<UmumController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
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
                            image: widget.isCart == true
                                ? NetworkImage(baseUrl +
                                    "product/image/" +
                                    widget.cart!.product!.productImage!.first
                                        .urlImage!)
                                : NetworkImage(baseUrl +
                                    "product/image/" +
                                    widget.product!.productImage!.first
                                        .urlImage!),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       widget.isCart == true ? "${widget.cart!.product!.name}" :  "${widget.product!.name}",
                        style: ProductNameStyle.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                          widget.isCart == true ? "Rp. ${widget.cart!.product!.harga}" :  "Rp. ${widget.product!.harga}",
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
                                  "${widget.cart!.productDetail!.size}",
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
                        GestureDetector(
                            onTap: () {
                              umumC.addQuantityCart(
                                  widget.cart!.productDetail!.id.toString());
                            },
                            child:
                                Image.asset("assets/icons/add.png", width: 15)),
                        SizedBox(
                          height: 7,
                        ),
                        Text("${widget.cart!.quantity}"),
                        SizedBox(
                          height: 7,
                        ),
                        GestureDetector(
                            onTap: () {
                              umumC.MinQuantityCart(
                                  widget.cart!.productDetail!.id.toString());
                            },
                            child:
                                Image.asset("assets/icons/min.png", width: 15)),
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
