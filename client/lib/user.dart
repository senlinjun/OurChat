import 'dart:async';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:ourchat/server_setting.dart';
import 'package:ourchat/about.dart';
import 'package:ourchat/service/ourchat/set_account_info/v1/set_account_info.pb.dart';
import 'package:ourchat/service/ourchat/upload/v1/upload.pb.dart';
import 'package:ourchat/service/ourchat/v1/ourchat.pbgrpc.dart';
import 'package:provider/provider.dart';
import 'package:ourchat/l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'main.dart';

class User extends StatelessWidget {
  const User({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<OurChatAppState>();
    var l10n = AppLocalizations.of(context)!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            child: Stack(
              children: [
                SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Image(image: AssetImage("assets/images/logo.png")),
                ),
                Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        backgroundBlendMode: BlendMode.overlay,
                        color: Theme.of(context).cardColor,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(5)),
                      ),
                      child: Icon(Icons.edit, size: 20),
                    ))
              ],
            ),
            onTap: () async {
              ImagePicker picker = ImagePicker();
              XFile? image =
                  await picker.pickImage(source: ImageSource.gallery);
              if (image == null) return;
              Uint8List biData = await image.readAsBytes();
              var stub = OurChatServiceClient(appState.server!.channel!,
                  interceptors: [appState.server!.interceptor!]);
              StreamController<UploadRequest> controller =
                  StreamController<UploadRequest>();
              var call = stub.upload(controller.stream);
              controller.add(UploadRequest(
                metadata: Header(
                    hash: sha256.convert(biData.toList()).bytes,
                    size: Int64.parseInt(biData.length.toString()),
                    autoClean: false),
              ));
              controller.add(UploadRequest(content: biData.toList()));
              await controller.close();
              var res = await call;
              var setInfoRes = await stub
                  .setSelfInfo(SetSelfInfoRequest(avatarKey: res.key));
            },
          ),
        ),
        Text(
          appState.thisAccount!.username,
          style: TextStyle(fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${l10n.email}: "),
            SelectableText(appState.thisAccount!.email!),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${l10n.ocid}: "),
            SelectableText(appState.thisAccount!.ocid),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                  onPressed: () {
                    appState.thisAccount = null;
                    appState.server = null;
                    appState.privateDB!.close();
                    appState.privateDB = null;
                    appState.accountCachePool = {};
                    appState.sessionCachePool = {};
                    appState.eventSystem!.stopListening();
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ServerSetting()));
                  },
                  child: Text(l10n.logout)),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => About()));
                  },
                  child: Text(l10n.about)),
            )
          ],
        ),
      ],
    );
  }
}
