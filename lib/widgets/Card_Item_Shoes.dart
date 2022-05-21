part of 'widgets.dart';

class CardItemShoes extends StatefulWidget {
  CardItemShoes({Key? key}) : super(key: key);

  @override
  State<CardItemShoes> createState() => _CardItemShoesState();
}

class _CardItemShoesState extends State<CardItemShoes> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.DETAIL_PRODUCT);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        height: 155,
        width: MediaQuery.of(context).size.width / 2 - 25,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFFECE8E8)),
            borderRadius: BorderRadius.circular(15),
            color: Colors.amber),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          image: DecorationImage(
                              image: AssetImage("assets/test.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          margin: EdgeInsets.all(10),
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 15,
                          )),
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Converse x Gorillaz ",
                        style: ProductNameStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Converse",
                            style: ProductCategoryStyle,
                          ),
                          Text(
                            "Rp. 400.000",
                            style: labelStyle.copyWith(fontSize: 10),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
