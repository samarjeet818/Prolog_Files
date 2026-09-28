% Student-course knowledge base.

student(aman).
student(riya).
student(vikram).
student(neha).

course(ai).
course(machine_learning).
course(prolog).
course(data_mining).

enrolled(aman, ai).
enrolled(aman, prolog).
enrolled(riya, machine_learning).
enrolled(riya, prolog).
enrolled(vikram, ai).
enrolled(vikram, data_mining).
enrolled(neha, machine_learning).

student_course(Student, Course) :-
    student(Student),
    enrolled(Student, Course).

course_student(Course, Student) :-
    course(Course),
    enrolled(Student, Course).

% Example queries:
% ?- student_course(aman, Course).
% ?- course_student(prolog, Student).
% ?- enrolled(Student, ai).