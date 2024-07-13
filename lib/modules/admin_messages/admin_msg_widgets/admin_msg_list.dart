import 'package:flutter/material.dart';

import '../detailed_admin_msg/detailed_admin_msg.dart';
import 'msg_from_to_admin.dart';

class AdminMsgList extends StatelessWidget {
  const AdminMsgList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return const DetailedAdminMsg();
            }));
          },
          child: MsgFromToAdmin(),
        ),
      ],
    );
  }
}
