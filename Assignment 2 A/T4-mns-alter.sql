--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-mns-alter.sql

--Student ID: 34228683
--Student Name: Nidhi Chowdary Gadde
--Unit Code: FIT9132
--Applied Class No: 01

/* Comments for your marker:




*/

--4(a)

ALTER TABLE patient ADD num_of_appt NUMBER(4);

COMMENT ON COLUMN patient.num_of_appt IS 'number of appointments the patient has had till date';

UPDATE patient p
SET
    num_of_appt = (
        SELECT
            COUNT(*)
        FROM
            appointment a
        WHERE
            p.patient_no = a.patient_no
    );
    
SELECT *
FROM patient;

DESC patient;

COMMIT;


--4(b)

DROP TABLE patient_ec CASCADE CONSTRAINTS;

CREATE TABLE patient_ec (
    patient_no NUMBER (4) NOT NULL,
    ec_id NUMBER(4) NOT NULL
);

COMMENT ON COLUMN patient_ec.patient_no IS 'Patient number';

COMMENT ON COLUMN patient_ec.ec_id IS 'Emergency contact';

ALTER TABLE patient_ec ADD CONSTRAINT pec_pk PRIMARY KEY (patient_no, ec_id);

ALTER TABLE patient_ec ADD CONSTRAINT pec_patient_no_fk FOREIGN KEY (patient_no)
REFERENCES patient(patient_no);

ALTER TABLE patient_ec ADD CONSTRAINT pec_ec_id FOREIGN KEY (ec_id)
REFERENCES emergency_contact (ec_id);

INSERT INTO patient_ec
SELECT patient_no,
ec_id
FROM patient;

SELECT *
FROM patient_ec;

DESC patient_ec;

ALTER TABLE patient DROP COLUMN ec_id;

COMMIT;


--4(c)

DROP TABLE training CASCADE CONSTRAINTS;

CREATE TABLE training (
    trainee_nurse_no NUMBER(4) NOT NULL,
    trainer_nurse_no NUMBER(4) NOT NULL,
    training_start_dt DATE NOT NULL,
    training_end_dt DATE NOT NULL,
    training_desc VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN training.trainee_nurse_no IS 'Nurse number who is taking the training';

COMMENT ON COLUMN training.training_start_dt IS 'The course start date and time';

COMMENT ON COLUMN training.training_end_dt IS 'The course end date and time';

COMMENT ON COLUMN training.training_desc IS 'Description of the course';

ALTER TABLE training ADD CONSTRAINT training_pk PRIMARY KEY ( trainee_nurse_no,
                                                              trainer_nurse_no,
                                                              training_start_dt );

ALTER TABLE training ADD CONSTRAINT trainer_nurse_no_fk FOREIGN KEY (trainer_nurse_no)
REFERENCES nurse (nurse_no);

ALTER TABLE training ADD CONSTRAINT trainee_nurse_no_fk FOREIGN KEY (trainee_nurse_no)
REFERENCES nurse (nurse_no);
                                                              
ALTER TABLE training ADD CONSTRAINT training_time_check CHECK (training_end_dt > training_start_dt);

SELECT *
FROM training;

DESC training;

COMMIT;
