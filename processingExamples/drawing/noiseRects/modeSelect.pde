void mode(int m) {
  switch(m) {
  case 1:
    mode1();
    break;
  case 2:
    mode2();
    break;
  case 3:
    mode3();
    break;
  case 4:
    mode4();
    break;
  case 5:
    mode5();
    break;
  default:
    mode1();
  }
}