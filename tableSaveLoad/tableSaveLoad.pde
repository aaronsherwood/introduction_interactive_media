Circle[] circles;
Table table;

void setup(){
  size(640,360);
  loadData();
}

void draw(){
  background(127);
  for (int i=0; i<circles.length; i++){
    circles[i].display(); 
  }
}

void loadData() {
  // Load CSV file into a Table object
  // "header" option indicates the file has a header row
  table = loadTable("table.csv", "header");

  // The size of the array of Circle objects is determined by the total number of rows in the CSV
  circles = new Circle[table.getRowCount()]; 

  // You can access iterate over all the rows in a table
  for (int i = 0; i < table.getRowCount(); i++) {
    TableRow row = table.getRow(i);
    // You can access the fields via their column name (or index)
    float x = row.getFloat("x");
    float y = row.getFloat("y");
    float d = row.getFloat("diameter");
    // Make a Circle object out of the data read
    PVector p = new PVector(x,y);
    circles[i] = new Circle(p, d);
  }
}

void mousePressed() {
  // Create a new row
  TableRow row = table.addRow();
  // Set the values of that row
  row.setFloat("x", mouseX);
  row.setFloat("y", mouseY);
  row.setFloat("diameter", random(40, 80));

  // If the table has more than 10 rows
  if (table.getRowCount() > 10) {
    // Delete the oldest row
    table.removeRow(0);
  }

  // Writing the CSV back to the same file
  saveTable(table, "data/table.csv");
  // And reloading it
  loadData();
}

class Circle{
   float size;
   PVector position;
   
   Circle(PVector p, float s){
     position = p;
     size = s;
   }
   
   void display(){
     ellipse(position.x,position.y,size,size); 
   }
}