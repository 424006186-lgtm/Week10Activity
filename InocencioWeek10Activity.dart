abstract class Evaluatable {
  void evaluatePerformance();
}

mixin HonorsEligible {
  bool checkHonors(double grade) {
    return grade >= 90.0;
  }
}

class Student {
  String name;
  int age;
  String course;
  double _grade;

  Student(this.name, this.age, this.course, this._grade);

  void displayInfo() {
    print("Name: $name");
    print("Age: $age");
    print("Course: $course");
    print("Grade: $_grade");
  }

  double getGrade() {
    return _grade;
  }

  void updateGrade(double newGrade) {
    if (newGrade >= 0 && newGrade <= 100) {
      _grade = newGrade;
    } else {
      print("Invalid grade!");
    }
  }
}

class UndergraduateStudent extends Student implements Evaluatable {
  String yearLevel;

  UndergraduateStudent(
    String name,
    int age,
    String course,
    double grade,
    this.yearLevel,
  ) : super(name, age, course, grade);

  @override
  void displayInfo() {
    super.displayInfo();
    print("Year Level: $yearLevel");
    print("Status: Undergraduate");
    print("--------------------");
  }

  @override
  void evaluatePerformance() {
    if (getGrade() >= 75.0) {
      print("$name is passing their undergraduate modules.");
    } else {
      print("$name needs academic support.");
    }
  }
}

class GraduateStudent extends Student implements Evaluatable {
  String thesisTopic;

  GraduateStudent(
    String name,
    int age,
    String course,
    double grade,
    this.thesisTopic,
  ) : super(name, age, course, grade);

  @override
  void displayInfo() {
    super.displayInfo();
    print("Thesis Topic: $thesisTopic");
    print("Status: Graduate");
    print("--------------------");
  }

  @override
  void evaluatePerformance() {
    if (getGrade() >= 85.0) {
      print("$name is meeting graduate research standards.");
    } else {
      print("$name's research progress is under review.");
    }
  }
}

class AcademicAdvisor with HonorsEligible {
  String name;
  String department;

  AcademicAdvisor(this.name, this.department);

  void reviewStudent(Student student) {
    bool isHonors = checkHonors(student.getGrade());
    print("Advisor $name ($department):");
    print("${student.name} Honors Status: ${isHonors ? 'Eligible' : 'Not Eligible'}");
    print("--------------------");
  }
}

void main() {
  UndergraduateStudent alice = UndergraduateStudent(
    "Alice",
    20,
    "Information Technology",
    90.5,
    "3rd Year",
  );

  GraduateStudent bob = GraduateStudent(
    "Bob",
    25,
    "Computer Science",
    85.0,
    "AI in Healthcare",
  );

  List<Student> students = [alice, bob];

  print("=== STUDENT INFORMATION ===");
  for (Student student in students) {
    student.displayInfo();
  }

  print("=== PERFORMANCE EVALUATION ===");
  alice.evaluatePerformance();
  bob.evaluatePerformance();
  print("--------------------");

  print("=== ADVISOR REVIEW ===");
  AcademicAdvisor advisor = AcademicAdvisor("Dr. Smith", "Computer Studies");
  advisor.reviewStudent(alice);
  advisor.reviewStudent(bob);
}