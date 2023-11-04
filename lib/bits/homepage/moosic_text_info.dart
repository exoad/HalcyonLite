import 'package:flutter/material.dart';
import 'package:halcyon_lite/parts/parts.dart';

class MasterTags extends StatefulWidget {
  const MasterTags({Key? key}) : super(key: key);

  @override
  State<MasterTags> createState() => MasterTagsState();

  static final GlobalKey<MasterTagsState> masterTagsKey =
      GlobalKey<MasterTagsState>();

  static void addTag(String name, Widget tag) =>
      masterTagsKey.currentState?.addTag(name, tag);

  static void removeTag(String name) =>
      masterTagsKey.currentState?.removeTag(name);

  static MasterTagsState? getCurrState() =>
      masterTagsKey.currentState;
}

class MasterTagsState extends State<MasterTags> {
  final Map<String, Widget> tags = <String, Widget>{};

  @override
  void initState() {
    super.initState();
    appsLoad.forEach((key, value) {
      addTag(key, value);
    });
  }

  void addTag(String name, Widget tag) {
    setState(() => tags[name] = tag);
  }

  void removeTag(String name) {
    setState(() => tags.remove(name));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: tags.values.toList(),
      ),
    );
  }
}


class _MoosicTextInfoState extends State<MoosicTextInfo> {
  @override
  void initState() {
    super.initState();
    mainPlayer.tagStream.listen((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                  // todo: finish implementing this widget for an information dialog
                  onTap: () async {
                    /*---------------------------------------------------------------------------- /
                    / await showDialog(                                                            /
                    /     context: context,                                                        /
                    /     builder: (context) {                                                     /
                    /       Tag tag = mainPlayer.tag!;                                             /
                    /       return HDialog(                                                        /
                    /           title: "",                                                         /
                    /           content:                                                           /
                    /               CustomScrollView(slivers: <Widget>[                            /
                    /             SliverList(delegate:                                             /
                    /                 SliverChildBuilderDelegate(                                  /
                    /                     (context, index) {                                       /
                    /               return Text.rich(                                              /
                    /                 TextSpan(children: [                                         /
                    /                   const TextSpan(                                            /
                    /                       text: "Title: ",                                       /
                    /                       style: TextStyle(                                      /
                    /                           fontWeight: HalcyonLLaf                            /
                    /                               .displayTrackInformationTagHeaderFontWeight)), /
                    /                   TextSpan(                                                  /
                    /                       text: "${tag.title}\n"),                               /
                    /                   const TextSpan(                                            /
                    /                       text: "Track Artist: ",                                /
                    /                       style: TextStyle(                                      /
                    /                           fontWeight: HalcyonLLaf                            /
                    /                               .displayTrackInformationTagHeaderFontWeight)), /
                    /                                                                              /
                    /                 ]),                                                          /
                    /                 style: const TextStyle(                                      /
                    /                     color: PoprockLaF.primary1),                             /
                    /               );                                                             /
                    /             }))                                                              /
                    /           ]));                                                               /
                    /     });                                                                      /
                    /-----------------------------------------------------------------------------*/
                  },
                  child: createSmallTag(
                      icon: Icons.info_outline_rounded,
                      iconSize: 16)),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  mainPlayer.tag?.title ?? "Unknown",
                  style: const TextStyle(
                      fontSize: HalcyonLLaf.primaryMoosicInfoFontSize,
                      color: PoprockLaF.primary1,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(children: [
            createSmallTag(
                text: mainPlayer.tag?.trackArtist ?? "Unknown",
                bg: PoprockLaF.primary2,
                textStyle: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w700)),
            if ((mainPlayer.tag?.album ?? "Unknown") != "Unknown")
              createSmallTag(
                  text: mainPlayer.tag?.album ?? "Unknown",
                  bg: PoprockLaF.primary2,
                  textStyle: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w700)),
          ]),
          const SizedBox(height: 4),
          Row(children: [
            createSmallTag(
                text: mainPlayer
                    .getSource()
                    .split(".")[
                        mainPlayer.getSource().split(".").length - 1]
                    .toUpperCase(),
                bg: PoprockLaF.primary3),
            createSmallTag(
                text: Duration(seconds: mainPlayer.tag?.duration ?? 0)
                    .toString()
                    .split(".")[0],
                bg: PoprockLaF.primary3),
            createSmallTag(
              text: mainPlayer.tag?.year.toString() ?? "Unknown",
              bg: PoprockLaF.primary3,
            )
          ])
        ]);
  }
}

class MoosicTextInfo extends StatefulWidget {
  const MoosicTextInfo({
    super.key,
  });

  @override
  State<MoosicTextInfo> createState() => _MoosicTextInfoState();
}
