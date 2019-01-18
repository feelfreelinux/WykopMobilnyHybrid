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

String getTag(String url) {
  var parts = url.split('/tag/')[1].split('/');
  if (parts[0] == "znaleziska" || parts[0] == "wpisy") {
    return parts[1];
  } else {
    return parts[0];
  }
}
