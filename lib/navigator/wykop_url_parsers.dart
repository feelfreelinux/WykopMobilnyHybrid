int getEntryId(String url) {
  return int.tryParse(url.split('/wpis/')[1].split('/')[0]);
}

int getLinkUrl(String url) {
  return int.tryParse(url.split('/link/')[1].split('/')[0]);
}

int getLinkCommentId(String url) {
  return int.tryParse(url.split('/#comment-')[1].split('/')[0]);
}

int getEntryCommentId(String url) {
  return int.tryParse(url.split('/#comment-')[1].split('/')[0]);
}

String getUser(String url) {
  print(url);
  var data = url.split('/ludzie/')[1];
  print(data);
  var possibleNickMatch = data.split('/')[0];
  var possibleMatchers = [
    "wpisy",
    "komentarze",
    "plusowane-wpisy",
    "dodane",
    "opublikowane",
    "komentarze",
    "powiązane",
    "wykopane",
    "obserwujący",
    "obserwowani",
    "osiagniecia"
  ];
  if (possibleMatchers.contains(possibleNickMatch)) {
    return data.split(possibleNickMatch + '/')[1].split('/')[0];
  } else {
    return possibleNickMatch;
  }
}

String getConversation(String url) {
  var data = url.split('/konwersacja/')[1];
  var possibleNickMatch = data.split('/')[0];
  return possibleNickMatch;
}

String getTag(String url) {
  var parts = url.split('/tag/')[1].split('/');
  if (parts[0] == "znaleziska" || parts[0] == "wpisy") {
    return parts[1];
  } else {
    return parts[0];
  }
}
