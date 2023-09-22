String getSubjectCard(int index) {
  if (index % 4 == 0) {
    return "asset/images/rectangle_left_new.png";
  } else if (index % 4 == 1) {
    return "asset/images/rectangle_right_new.png";
  } else if (index % 4 == 2) {
    return "asset/images/blue_rectangle_left.png";
  } else {
    return "asset/images/green_rectangle_right.png";
  }
}
