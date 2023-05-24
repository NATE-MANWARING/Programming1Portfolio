// Nate Manwaring | october 24 | Cars
Car c1, c2;
Car[] cars = new Car[15];

void setup() {
  size(400, 400);
  c1= new Car();
  c2= new Car();
  for (int i=0; i<cars.length; i++) {
    cars[i] = new Car();
  }
}

void draw() {
  background(190);
  c1.display();
  c1.drive();
  c2.display();
  c2.drive();
  for (int i=0; i<cars.length; i++) {
    cars[i].display();
    cars[i].drive();
  }
}
