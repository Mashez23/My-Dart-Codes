//Function to add two numbers
int sum(int num1,int num2){
  return num1 + num2;
}
void main() {
  for (int i = 1;i <= 10; i++){
    print(1);
  }
 
String choice = "apple";
switch (choice) {
  case "apple":
  print("You chose an apple!");
  break;
  case"banana":
  print("You chose a banana!");
  break;
  default:
}
int j = 20;
 while ( j >= 10 ) {
  print(j);
  j--;
}
int number = 15;
if (number % 2 ==0) {
  print("$number is even");
}
else {
  print("$number is odd");
}
List<int> numbers = [ 3,8,1,10,4];
int largest = numbers [0];
for (int num in numbers) {
  if (num>largest) {
    largest = num;
  }
}
print("Largest number in the list: $largest");

try{
  double result = 10/0;
  print(result);
}on IntegerDivisionByZeroException{
  print("Error: Division by zero!");
}
}