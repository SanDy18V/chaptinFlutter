import 'package:flutter/material.dart';


class OthersChatBubble extends StatelessWidget {
  String chat;
  String time;
  String name;
  OthersChatBubble({
    required this.chat,
    required this.time,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 241, 241, 241)),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 10, top: 10, right: 20),
                      child: Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle().copyWith(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // if (name.length > 21)
                  ],
                ),
                // if (chatMessage.isHost)
                //   Padding(
                //     padding: const EdgeInsets.only(right: 10, top: 10),
                //     child: Text(
                //       "Host",
                //       style: primaryfont.copyWith(color: Colors.black45),
                //     ),
                //   )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    chat.length > 30
                        ? Container(
                      width: size.width * 0.50,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          chat,
                          style:  TextStyle().copyWith(
                              color: Color.fromARGB(221, 17, 16, 16)),
                        ),
                      ),
                    )
                        : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        chat,
                        style: TextStyle().copyWith(
                            color: Color.fromARGB(221, 16, 17, 16)),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 10, 5),
                  child: Text(
                    time,
                    style:  TextStyle().copyWith(
                        color: Colors.black45, fontSize: 13),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
