part of 'widgets.dart';

class CustomNavbar extends StatefulWidget {
  final int? selectedIndex;
  final Function(int index)? onTap;

  CustomNavbar({this.selectedIndex, this.onTap});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              if (widget.onTap != null) {
                widget.onTap!(0);
              }
              setState(() {});
            },
            child: Image.asset(
              widget.selectedIndex == 0 ? "assets/icons/home_active.png"  :"assets/icons/home.png",
              height: 20,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (widget.onTap != null) {
                widget.onTap!(1);
              }
              setState(() {});
            },
            child: Image.asset(
               widget.selectedIndex == 1 ? "assets/icons/chat_active.png"  :"assets/icons/chat.png",
              height: 20,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (widget.onTap != null) {
                widget.onTap!(2);
              }
              setState(() {});
            },
            child: Image.asset(
               widget.selectedIndex == 2 ? "assets/icons/favorite_active.png"  :"assets/icons/favorite.png",
              height: 20,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (widget.onTap != null) {
                widget.onTap!(3);
              }
              setState(() {});
            },
            child: Image.asset(
              widget.selectedIndex == 3 ? "assets/icons/profile_active.png"  :"assets/icons/profile.png",
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}
