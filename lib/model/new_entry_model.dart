import 'package:flutter/foundation.dart';
import 'package:owmflutter/model/input_model.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/screens/input.dart';

typedef void EntryCreatedCallback(Entry entry);

class EditModel extends InputModel {
  final EntryCreatedCallback entryCreated;


  final ValueChanged<EntryComment> commentEdited;
  final ValueChanged<LinkComment> linkCommentEdited;
  final ValueChanged<Entry> entryEdited;

  final bool edit;
  final int itemId;
  final InputType inputType;
  EditModel(
      {this.entryCreated,
      this.edit = false,
      this.itemId = -1,
      this.entryEdited,
      this.commentEdited,
      this.linkCommentEdited,
      this.inputType});
  @override
  Future<void> onInputSubmitted(InputData data) async {
    if (edit) {
      switch (inputType) {
        case InputType.ENTRY:
            entryEdited(await api.entries.editEntry(this.itemId, data));
            break;
        case InputType.ENTRY_COMMENT:
          commentEdited(await api.entries.editEntryComment(this.itemId, data));
          break;
        case InputType.LINK_COMMENT:
          linkCommentEdited(await api.links.editComment(this.itemId, data));
          break;
        default:
          return;
      }
    } else {
      var entry = await api.entries.addEntry(data);
      entryCreated(entry);
    }
  }
}
