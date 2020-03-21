import 'package:flutter/widgets.dart';
import 'package:owmflutter/content_filters/content_filters.dart';
import 'package:owmflutter/model/profile_related_model.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/model/model.dart';

class ProfileRelatedListModel
    extends ListModel<ProfileRelated, ProfileRelatedModel> {
  final LoadNewItemsCallback<ProfileRelated> loadNewProfileRelateds;

  ProfileRelatedListModel({this.loadNewProfileRelateds, BuildContext context})
      : super(
            loadNewItems: (page) => OWMContentFilter.filterProfileRelated(loadNewProfileRelateds(page), context),
            mapper: (e) => ProfileRelatedModel()..setData(e));
}
