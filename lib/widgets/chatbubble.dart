import 'package:flutter/material.dart';


class MyChatBubble extends StatelessWidget {
  String chat;
  String time;
  MyChatBubble({required this.chat, required this.time});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 248, 237, 235)),
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                chat.length > 40
                    ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: size.width * 0.55,
                    child: Text(
                      chat,
                      maxLines: 30,
                      style: TextStyle().copyWith(color: Colors.black87),
                    ),
                  ),
                )
                    : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    chat,
                    maxLines: 30,
                    style: TextStyle().copyWith(
                        color: const Color.fromARGB(221, 17, 17, 16)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 10, 5, 5),
                  child: Text(
                    time,
                    style:TextStyle().copyWith(
                        fontSize: 9, color: Colors.black45),
                  ),
                ),
                // chatMessgae.isReaded
                //     ? Padding(
                //         padding: const EdgeInsets.fromLTRB(2, 10, 5, 5),
                //         child: Icon(
                //           Icons.done_all,
                //           color: primaryColor,
                //           size: 15,
                //         ),
                //       )
                //     : Padding(
                //         padding: const EdgeInsets.fromLTRB(2, 10, 5, 5),
                //         child: Icon(
                //           Icons.done,
                //           color: primaryColor,
                //           size: 15,
                //         ),
                //       )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
