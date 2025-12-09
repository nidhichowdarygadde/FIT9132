--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-mns-dm.sql

--Student ID: 34228683
--Student Name: Nidhi Chowdary Gadde
--Unit Code: FIT9132
--Applied Class No: 01

/* Comments for your marker:




*/


--3(a)

DROP SEQUENCE emergency_contact_pk_sequence;

DROP SEQUENCE patient_pk_sequence;

DROP SEQUENCE appointment_pk_sequence;

CREATE SEQUENCE emergency_contact_pk_sequence MINVALUE 100 START WITH 100 INCREMENT BY
5;

CREATE SEQUENCE patient_pk_sequence MINVALUE 100 START WITH 100 INCREMENT BY 5;

CREATE SEQUENCE appointment_pk_sequence MINVALUE 100 START WITH 100 INCREMENT BY 5;


--3(b)

INSERT INTO emergency_contact VALUES ( 
    emergency_contact_pk_sequence.NEXTVAL,
    'Jonathan',
    'Robey',
    '0412523122'
);

INSERT INTO patient VALUES (
    patient_pk_sequence.NEXTVAL,
    'Laura',
    'Robey',
    '1063, Centre Road, Oakleigh South',
    'Melbourne',
    'VIC',
    '3167',
    TO_DATE('14/MAY/2018', 'DD/MON/YYYY'),
    '0412523122',
    'jonrobey@gmail.com',
(
    SELECT
        ec_id
    FROM
        emergency_contact
    WHERE
        ec_phone = '0412523122'
) );

INSERT INTO patient VALUES (
    patient_pk_sequence.NEXTVAL,
    'Lachlan',
    'Robey',
    '1063, Centre Road, Oakleigh South',
    'Melbourne',
    'VIC',
    '3167',
    TO_DATE('22/MAR/2019', 'DD/MON/YYYY'),
    '0412523122',
    'jonrobey@gmail.com',
(
    SELECT
        ec_id
    FROM
        emergency_contact
    WHERE
        ec_phone = '0412523122'
) );

INSERT INTO appointment VALUES (
    appointment_pk_sequence.NEXTVAL,
    TO_DATE('04/SEP/2023 15:30:00','DD/MON/YYYY HH24:MI:SS'),
    (
        SELECT provider_roomno
        FROM provider
        WHERE provider_fname = 'Bruce'
        AND provider_lname = 'Striplin'
    ),
    'S',
    (
        SELECT patient_no
        FROM patient
        WHERE patient_fname = 'Laura'
        AND patient_lname = 'Robey'
    ),
    (
        SELECT provider_code
        FROM provider
        WHERE provider_fname = 'Bruce'
        AND provider_lname = 'Striplin'
    ),
    (
        SELECT nurse_no
        FROM nurse
        WHERE nurse_fname = 'Chelsea'
        AND nurse_lname = 'Ford'
    ),
    NULL
);

INSERT INTO appointment VALUES (
    appointment_pk_sequence.NEXTVAL,
    TO_DATE('04/SEP/2023 16:00:00','DD/MON/YYYY HH24:MI:SS'),
    (
        SELECT provider_roomno
        FROM provider
        WHERE provider_fname = 'Bruce'
        AND provider_lname = 'Striplin'
    ),
    'S',
    (
        SELECT patient_no
        FROM patient
        WHERE patient_fname = 'Lachlan'
        AND patient_lname = 'Robey'
    ),
    (
        SELECT provider_code
        FROM provider
        WHERE provider_fname = 'Bruce'
        AND provider_lname = 'Striplin'
    ),
    (
        SELECT nurse_no
        FROM nurse
        WHERE nurse_fname = 'Chelsea'
        AND nurse_lname = 'Ford'
    ),
    NULL
);

COMMIT;

--3(c)

INSERT INTO appointment VALUES (
    appointment_pk_sequence.NEXTVAL,
    TO_DATE('14/SEP/2023 16:00:00', 'DD/MON/YYYY HH24:MI:SS'),
    (
        SELECT provider_roomno
        FROM provider
        WHERE provider_fname = 'Bruce'
        AND provider_lname = 'Striplin'
    ),
    'L',
    (
        SELECT patient_no
        FROM patient
        WHERE patient_fname = 'Lachlan'
        AND patient_lname = 'Robey'
    ),
    (
        SELECT provider_code
        FROM provider
        WHERE provider_fname = 'Bruce'
        AND provider_lname = 'Striplin'
    ),
    (
        SELECT nurse_no
        FROM nurse
        WHERE nurse_fname = 'Katie'
    ),
    (
        SELECT appt_no
        FROM appointment
        WHERE appt_datetime = TO_DATE('04/SEP/2023 16:00:00','DD/MON/YYYY HH24:MI:SS')
    )
);

COMMIT;


--3(d)

UPDATE appointment 
SET 
    appt_datetime = TO_DATE('18/SEP/2023 16:00:00','DD/MON/YYYY HH24:MI:SS')
WHERE 
        appt_datetime = TO_DATE('14/SEP/2023 16:00:00','DD/MON/YYYY HH24:MI:SS')
AND patient_no = (
    SELECT 
        patient_no
    FROM 
        patient
    WHERE 
            patient_fname = 'Lachlan'
        AND patient_lname = 'Robey'
    );

COMMIT;


--3(e)

DELETE FROM appointment
WHERE
    appt_datetime BETWEEN TO_DATE('15/SEP/2023 00:00:00','DD/MON/YYYY HH24:MI:SS') AND
    TO_DATE('23/SEP/2023 00:00:00','DD/MON/YYYY HH24:MI:SS')
    AND provider_code = (
        SELECT provider_code
        FROM provider
        WHERE 
                provider_fname = 'Bruce'
            AND provider_lname = 'Striplin'
    );

COMMIT;




