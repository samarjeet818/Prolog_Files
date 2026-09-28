% Student marks and performance classification.

marks(aman, 85, 78, 91).
marks(riya, 72, 68, 75).
marks(vikram, 42, 38, 45).
marks(neha, 95, 93, 97).

total(Student, Total) :-
    marks(Student, First, Second, Third),
    Total is First + Second + Third.

average(Student, Average) :-
    total(Student, Total),
    Average is Total / 3.

topper(Student) :-
    average(Student, Average),
    Average >= 85.

average_student(Student) :-
    average(Student, Average),
    Average >= 50,
    Average < 85.

fail_student(Student) :-
    marks(Student, First, Second, Third),
    (First < 40 ; Second < 40 ; Third < 40).

% Example queries:
% ?- total(aman, Total).
% ?- average(neha, Average).
% ?- topper(Student).
% ?- fail_student(Student).