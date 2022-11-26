library my_prj.globals;

dynamic pageButtonState = -1;
bool confirmCheckState = false;

int ButtonState = -1;
bool checkState = false;

DateTime currentTime = DateTime.now();
DateTime aTime = DateTime.now();
int prev = 1000;
bool idRight = true;
bool passRight = true;

class Namelist {
  Namelist(this.title, [this.isExpanded = false]);
  String title;
  // String body;
  bool isExpanded;
}

List<Namelist> getList() {
  return [
    Namelist('徐濤'),
    Namelist('趙福忠'),
    Namelist('李建偉'),
    Namelist('任海超'),
    Namelist('鮑景利'),
    Namelist('MAS MUKTIADI'),
    Namelist('ARIKURNIA WAN'),
    Namelist('ERIAWAN'),
  ];
}

List<Namelist> globalList = [
  Namelist('徐濤'),
  Namelist('趙福忠'),
  Namelist('李建偉'),
  Namelist('任海超'),
  Namelist('鮑景利'),
  Namelist('MAS MUKTIADI'),
  Namelist('ARIKURNIA WAN'),
  Namelist('ERIAWAN'),
];

Namelist turnString(String s) {
  return Namelist(s);
}
