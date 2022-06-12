part of 'widgets.dart';

class CardItemMyOrders extends StatefulWidget {
  final bool? isPay;
  CardItemMyOrders({this.isPay = false});

  @override
  State<CardItemMyOrders> createState() => _CardItemMyOrdersState();
}
final Uri _url = Uri.parse('https://app.sandbox.midtrans.com/snap/v2/vtweb/30006a63-56a2-486f-9d1e-59388d47740f');
class _CardItemMyOrdersState extends State<CardItemMyOrders> {
  void _launchUrl() async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: greyColor,
          ),
          borderRadius: BorderRadius.circular(15)),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage("assets/test.jpg"),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 11,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Converse x Gorillaz",
                          style: ProductNameStyle.copyWith(fontSize: 14),
                        ),
                        Spacer(),
                        SizedBox(),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Size : 42",
                          style: subTitleStyle.copyWith(fontSize: 8),
                        ),
                        Spacer(),
                        Text(
                          "x1",
                          style: ProductCategoryStyle.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(),
                        Spacer(),
                        Text(
                          "Rp. 400.000",
                          style: labelStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: greyColor,
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Text(
                "Tanggal : 2022-05-20",
                style: subTitleStyle.copyWith(fontSize: 8),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    "Total Pesanan :",
                    style: ProductCategoryStyle.copyWith(
                        fontSize: 8, color: Colors.black),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Rp. 404.500",
                    style: ProductCategoryStyle.copyWith(
                        fontSize: 10, color: Colors.black),
                  ),
                ],
              )
            ],
          ),
          widget.isPay == true
              ? SizedBox()
              : GestureDetector(
                onTap: (){
                  _launchUrl();
                },
                child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 11,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 24,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Pay now",
                                  style: buttonStyle.copyWith(fontSize: 10),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
              )
        ],
      ),
    );
  }
}
