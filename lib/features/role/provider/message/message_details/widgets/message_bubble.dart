import 'dart:io';

import 'package:flutter/material.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/provider/message/message_details/model/message_details_model.dart';

class MessageBubble extends StatelessWidget {
  final MessageDetailsModel message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isMe = message.isSentByMe;
    final hasImage = message.imageFilePath != null || message.imageUrl != null;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Column(
          crossAxisAlignment: isMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            if (hasImage)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: message.imageFilePath != null
                    ? Image.file(
                        File(message.imageFilePath!),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 0.65,
                      )
                    : Image.asset(
                        message.imageUrl!,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 0.65,
                      ),
              )
            else
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: isMe
                      ? const Color(0xff9F6E4D)
                      : const Color(0xffE1D2C8),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(8),
                    topRight: const Radius.circular(8),
                    bottomLeft: Radius.circular(isMe ? 8 : 8),
                    bottomRight: Radius.circular(isMe ? 8 : 8),
                  ),
                ),
                child: Text(
                  message.text ?? '',
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: isMe
                        ? const Color(0xffE1D2C8)
                        : const Color(0xff9F6E4D),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
