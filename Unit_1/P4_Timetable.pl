% Faculty, subjects, classrooms, and timetable facts.

faculty(prof_sharma).
faculty(prof_mehta).
faculty(prof_khan).

subject(ai).
subject(machine_learning).
subject(prolog).

classroom(ai, room_101).
classroom(machine_learning, room_102).
classroom(prolog, lab_1).

time_slot(ai, monday, 9).
time_slot(machine_learning, tuesday, 11).
time_slot(prolog, wednesday, 10).

teaches(prof_sharma, ai).
teaches(prof_mehta, machine_learning).
teaches(prof_khan, prolog).

timetable(Subject, Faculty, Day, Hour, Room) :-
    subject(Subject),
    teaches(Faculty, Subject),
    time_slot(Subject, Day, Hour),
    classroom(Subject, Room).

% Example queries:
% ?- timetable(Subject, Faculty, Day, Hour, Room).
% ?- classroom(machine_learning, Room).
% ?- teaches(Faculty, prolog).