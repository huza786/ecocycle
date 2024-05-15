import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_app/Models/Firebase/message_services.dart';
import 'package:recycle_app/Models/message.dart';
import 'package:recycle_app/View/setting_page/message/components/admin_messege_bubble.dart';
import 'package:recycle_app/View/setting_page/message/components/user_meesage_bubble.dart';
import 'package:recycle_app/View/shared_components/custom_app_bar.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Stack(
              children: [
                CustomAppBar(
                  title: "Message",
                  context: context,
                  navigationEnabled: true,
                ),
              ],
            ),
            Consumer(builder: (context, ref, _) {
              final stream = ref.watch(messageStream);
              return stream.when(data: (data) {
                final List<Map<String, dynamic>> messagesData =
                    data.docs.map((doc) => doc.data()).toList();
                if (messagesData.isEmpty) {
                  return const Text("No Messages available");
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    children: [
                      Column(
                          children: messagesData.map((e) {
                        final messege = Message.fromMap(e);
                        return messege.isAdmin
                            ? AdminMessageBubble(messege: messege.message)
                            : UserMessageBubble(message: messege.message);
                      }).toList()),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                );
              }, error: (error, stacktrace) {
                return const Text("No Messages available");
              }, loading: () {
                return const CircularProgressIndicator();
              });
            }),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Material(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          child: Container(
            width: 408.w,
            height: 54.h,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(40)),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: SizedBox(
                        height: 54.h,
                        child: Center(
                          child: TextFormField(
                            onTap: () {
                              scrollController.jumpTo(
                                  scrollController.position.maxScrollExtent);
                            },
                            onChanged: (value) {
                              scrollController.jumpTo(
                                  scrollController.position.maxScrollExtent);
                            },
                            controller: controller,
                            decoration: const InputDecoration(
                                hintText: "Type your message...",
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        await FirebaseMessaging().sendMessage(controller.text);
                        controller.clear();
                        scrollController
                            .jumpTo(scrollController.position.maxScrollExtent);
                      },
                      icon: const Icon(Icons.send_outlined))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final scrollNotifier = NotifierProvider<ScrollNotifier, ScrollController>(
  () {
    return ScrollNotifier();
  },
);

class ScrollNotifier extends Notifier<ScrollController> {
  @override
  ScrollController build() {
    ScrollController scrollController = ScrollController();
    state = scrollController;
    return state;
  }

  void animateToEndPage() {
    ScrollController scrollController = ScrollController();
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
    state = scrollController;
  }
}
