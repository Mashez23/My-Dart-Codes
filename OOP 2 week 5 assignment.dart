class Student{
  final String name;
  final int age;
  final int gradelevel;

  Student(this.name,this.age,this.gradelevel);
  void printInfo(){
    print(
      "Student Information: Name:$name, Age:$age, Grade Level:$gradelevel"
    );
  }
}
class Teacher{
  final String name;
  final int age;
  final String subject;
  Teacher(this.name,this.age,this.subject);
void printInfo(){
  print(
    "Teacher Information : Name:$name, Age:$age , Subject:$subject"
  );
}
}
class School{
 void run() {
  Student student1=Student("Brian Muhanji",23,12);
  Teacher teacher1=Teacher("Calvin Ominde", 39,"Lasers");

  student1.printInfo();
  teacher1.printInfo();
 }
}
void main(){
  School school = School();
  school.run();
}