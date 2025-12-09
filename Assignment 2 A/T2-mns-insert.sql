--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T2-mns-insert.sql

--Student ID: 34228683
--Student Name: Nidhi Chowdary Gadde
--Unit Code: FIT9132
--Applied Class No: 01

/* Comments for your marker:




*/

--------------------------------------
--INSERT INTO emergency_contact
--------------------------------------
INSERT INTO emergency_contact VALUES (
    23,
    'Varsha',
    'Bonam',
    '0426783636'
);

INSERT INTO emergency_contact VALUES (
    15,
    'Sravya',
    'Surada',
    '0460037427'
);

INSERT INTO emergency_contact VALUES (
    11,
    'Mitali',
    'Sharma',
    '0443982332'
);

INSERT INTO emergency_contact VALUES (
    08,
    'Pavani',
    'Parimi',
    '0427789890'
);

INSERT INTO emergency_contact VALUES (
    18,
    'Pallavi',
    'Mahajan',
    '0477745566'
);

--------------------------------------
--INSERT INTO patient
--------------------------------------
INSERT INTO patient VALUES (
    4,
    'Padma',
    'Priya',
    '19, Brownleaf Street, Mansfield',
    'Brisbane',
    'QLD',
    '4122',
    to_date('14/MAY/1999', 'DD/MON/YYYY'),
    '0452344409',
    'priyap01@gmail.com',
    23
);

INSERT INTO patient VALUES (
    8,
    'Jyothi',
    'Swaroopa',
    '4 Macintyre Lane, Yering',
    'Melbourne',
    'VIC',
    '3770',
    to_date('01/DEC/1996', 'DD/MON/YYYY'),
    '0457048250',
    'jyothis11@gmail.com',
    15
);

INSERT INTO patient VALUES (
    16,
    'Prasanna',
    'Jain',
    '2, Pemberley Drive, Notting Hill',
    'Melbourne',
    'VIC',
    '3168',
    to_date('22/Jul/1994', 'DD/MON/YYYY'),
    '0452344409',
    'djain555@gmail.com',
    23
);

INSERT INTO patient VALUES (
    9,
    'Anushka',
    'Shetty',
    '83, Kingsville Street, Kingsville',
    'Melbourne',
    'VIC',
    '3010',
    to_date('10/DEC/2015', 'DD/MON/YYYY'),
    '0480992323',
    'anushkash90@gmail.com',
    23
);

INSERT INTO patient VALUES (
    12,
    'Regina',
    'George',
    '1919, Wellington Road, Menzies Creek',
    'Melbourne',
    'VIC',
    '3791',
    to_date('02/MAR/2012', 'DD/MON/YYYY'),
    '0490037434',
    'reg06candy@gmail.com',
    11
);

INSERT INTO patient VALUES (
    23,
    'Sophia',
    'Potter',
    '3, Raymond Road, Rye',
    'Melbourne',
    'VIC',
    '3941',
    to_date('14/NOV/2008', 'DD/MON/YYYY'),
    '0455509096',
    'sophie008@gmail.com',
    15
);

INSERT INTO patient VALUES (
    14,
    'Caroline',
    'Forbes',
    '20, Jumping Creek Road, Wonga Park',
    'Melbourne',
    'VIC',
    '3115',
    to_date('23/FEB/2014', 'DD/MON/YYYY'),
    '0400052344',
    'carolinefb14@gmail.com',
    11
);

INSERT INTO patient VALUES (
    11,
    'Damon',
    'Salvatore',
    '170, Camelot Place, Bridgeman Downs',
    'Brisbane',
    'QLD',
    '4035',
    to_date('30/AUG/1988', 'DD/MON/YYYY'),
    '0490888240',
    'damon07@gmail.com',
    11
);

INSERT INTO patient VALUES (
    22,
    'Klaus',
    'Mikaelson',
    '80, Wivenhoe Circuit, Forest Lake',
    'Brisbane',
    'QLD',
    '4078',
    to_date('14/JUN/1999', 'DD/MON/YYYY'),
    '0480809898',
    'klausmikael09@gmail.com',
    08
);

INSERT INTO patient VALUES (
    17,
    'Bonnie',
    'Bennett',
    '45, Buller Street, North Parramatta',
    'Sydney',
    'NSW',
    '3160',
    to_date('14/MAY/2009', 'DD/MON/YYYY'),
    '0402027892',
    'bonnie222@gmail.com',
    18
);


--------------------------------------
--INSERT INTO appointment
--------------------------------------
INSERT INTO appointment VALUES (
2,
to_date('14/JUN/2023 11:00:00', 'DD/MON/YYYY HH24:MI:SS'),
8,  /*ROOM NUM*/
'T', /**/
16, /*PATIENT NUM*/
'ORT001', /*PROVIDER*/
7,  /*NURSE NUM*/
NULL  /*APPT NUM*/
);

INSERT INTO appointment VALUES (
5,
to_date('08/JUL/2023 10:30:00', 'DD/MON/YYYY HH24:MI:SS'),
11,  /*ROOM NUM*/
'S',
4, /*PATIENT NUM*/
'PER001', /*PROVIDER*/
2,  /*NURSE NUM*/
NULL  /*APPT NUM*/
);

INSERT INTO appointment VALUES (
7,
to_date('14/JUN/2023 11:00:00', 'DD/MON/YYYY HH24:MI:SS'),
6,  /*ROOM NUM*/
'T',
12, /*PATIENT NUM*/
'PED001', /*PROVIDER*/
4,  /*NURSE NUM*/
NULL  /*APPT NUM*/
);

INSERT INTO appointment VALUES (
12,
to_date('14/JUN/2023 10:30:00', 'DD/MON/YYYY HH24:MI:SS'),
12,  /*ROOM NUM*/
'L',
23, /*PATIENT NUM*/
'PER002', /*PROVIDER*/
1,  /*NURSE NUM*/
NULL  /*APPT NUM*/
);

INSERT INTO appointment VALUES (
15,
to_date('08/JUL/2023 14:00:00', 'DD/MON/YYYY HH24:MI:SS'),
8,  /*ROOM NUM*/
'S',
12, /*PATIENT NUM*/
'ORT001', /*PROVIDER*/
8,  /*NURSE NUM*/
7  /*APPT NUM*/
);

INSERT INTO appointment VALUES (
25,
to_date('08/JUL/2023 15:30:00', 'DD/MON/YYYY HH24:MI:SS'),
5,  /*ROOM NUM*/
'L',
14, /*PATIENT NUM*/
'ORS001', /*PROVIDER*/
15,  /*NURSE NUM*/
NULL  /*APPT NUM*/
);

INSERT INTO appointment VALUES (
10,
to_date('14/JUN/2023 17:00:00', 'DD/MON/YYYY HH24:MI:SS'),
1,  /*ROOM NUM*/
'S',
8, /*PATIENT NUM*/
'END001', /*PROVIDER*/
10,  /*NURSE NUM*/
NULL  /*APPT NUM*/
);

INSERT INTO appointment VALUES (
26,
to_date('22/AUG/2023 12:00:00', 'DD/MON/YYYY HH24:MI:SS'),
7,  /*ROOM NUM*/
'T',
14, /*PATIENT NUM*/
'ORT001', /*PROVIDER*/
7,  /*NURSE NUM*/
25  /*APPT NUM*/
);

INSERT INTO appointment VALUES (
31,
to_date('08/JUL/2023 16:00:00', 'DD/MON/YYYY HH24:MI:SS'),
2,  /*ROOM NUM*/
'S',
9, /*PATIENT NUM*/
'GEN001', /*PROVIDER*/
10,  /*NURSE NUM*/
NULL  /*APPT NUM*/
);

INSERT INTO appointment VALUES (
32,
to_date('14/JUN/2023 12:30:00', 'DD/MON/YYYY HH24:MI:SS'),
10,  /*ROOM NUM*/
'S',
17, /*PATIENT NUM*/
'AST002', /*PROVIDER*/
12,  /*NURSE NUM*/
NULL  /*APPT NUM*/
);

INSERT INTO appointment VALUES (
37,
to_date('22/AUG/2023 17:30:00', 'DD/MON/YYYY HH24:MI:SS'),
4,  /*ROOM NUM*/
'T',
23, /*PATIENT NUM*/
'GEN003', /*PROVIDER*/
5,  /*NURSE NUM*/
12  /*APPT NUM*/
);

INSERT INTO appointment VALUES (
35,
to_date('22/AUG/2023 17:30:00', 'DD/MON/YYYY HH24:MI:SS'),
13,  /*ROOM NUM*/
'L',
16, /*PATIENT NUM*/
'PRO001', /*PROVIDER*/
3,  /*NURSE NUM*/
2  /*APPT NUM*/
);

INSERT INTO appointment VALUES (
40,
to_date('08/JUL/2023 15:30:00', 'DD/MON/YYYY HH24:MI:SS'),
9,  /*ROOM NUM*/
'S',
8, /*PATIENT NUM*/
'AST001', /*PROVIDER*/
6,  /*NURSE NUM*/
10  /*APPT NUM*/
);

INSERT INTO appointment VALUES (
38,
to_date('08/JUL/2023 10:00:00', 'DD/MON/YYYY HH24:MI:SS'),
10,  /*ROOM NUM*/
'T',
22, /*PATIENT NUM*/
'AST002', /*PROVIDER*/
7,  /*NURSE NUM*/
NULL  /*APPT NUM*/
);

INSERT INTO appointment VALUES (
42,
to_date('14/JUN/2023 13:00:00', 'DD/MON/YYYY HH24:MI:SS'),
12,  /*ROOM NUM*/
'L',
11, /*PATIENT NUM*/
'PER002', /*PROVIDER*/
14,  /*NURSE NUM*/
NULL  /*APPT NUM*/
);




