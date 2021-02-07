Table table;
float spacing;

void setup() {
  size(1280, 720);
  loadData();
}

void loadData() {
  // Load CSV file into a Table object
  // "header" option indicates the file has a header row
  table = loadTable("multiTimeline.csv", "csv");
  // spacing is rowcount - 4 since the first three rows and the last row are superfluous
  spacing = float(width)/(table.getRowCount()-3);

}

void draw() {
  background(255);
  // You can access iterate over all the rows in a table
  // start at row 3 since the first few rows are filler
  
  // scaffolding
  for (int i = 3; i < table.getRowCount(); i++) {
    TableRow row = table.getRow(i);
    // You can access the fields via their column name (or index)
    // interest in topic: range 0 - 100
    float interest = row.getFloat(1);
  }
}
