// Convert null values when parsing responses
import 'package:pips_flutter/data/mapper/mapper.dart';

// extension on String
extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return EMPTY;
    } else {
      return this!;
    }
  }
}

// extension on int
extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return ZERO;
    } else {
      return this!;
    }
  }
}

extension TimeAgoExtension on DateTime? {
  String timeAgo() {
    Duration diff = DateTime.now().difference(this!);
    if (diff.inDays > 365) {
      return "${(diff.inDays / 365).floor()}${(diff.inDays / 365).floor() == 1 ? "y" : "y"} ago";
    }
    if (diff.inDays > 30) {
      return "${(diff.inDays / 30).floor()}${(diff.inDays / 30).floor() == 1 ? "mo" : "mo"} ago";
    }
    if (diff.inDays > 7) {
      return "${(diff.inDays / 7).floor()}${(diff.inDays / 7).floor() == 1 ? "w" : "w"} ago";
    }
    if (diff.inDays > 0) {
      return "${diff.inDays}${diff.inDays == 1 ? "w" : "d"} ago";
    }
    if (diff.inHours > 0) {
      return "${diff.inHours}${diff.inHours == 1 ? "h" : "h"} ago";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes}${diff.inMinutes == 1 ? "min" : "min"} ago";
    }
    return "just now";
  }
}
