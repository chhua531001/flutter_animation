import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart Button Animation"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: AnimatedContainer(
            //有了width & height與orderRadius.circular的數值相周，就會變成圓型
            duration: const Duration(milliseconds: 800),
            height: 70,
            width: isExpanded ? 220 : 70,
            decoration: BoxDecoration(
              color: isExpanded ? Colors.green : Colors.purpleAccent,
              borderRadius: BorderRadius.circular(isExpanded ? 50 : 70),
            ),
            child: isExpanded
                ? const Row(
                  //有Expanded時，mainAxisAlignment與crossAxisAlignment設定是無效的，
                  // 因此無法把Row Widget置中
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  //為了讓顯示看起來有置中感覺，使用Expanded的flex作為分配
                  //以下搭配Align的設定，可以讓顯示更為置中
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.check,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    //因為使用AnimatedContainer在改變大小時，會造成錯誤，所以要加Expanded
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Add to Cart",
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ],
                )
                : const Icon(
                    Icons.shopping_cart,
                    size: 30,
                    color: Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}
