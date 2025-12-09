--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T2-mns-select.sql

--Student ID: 34228683
--Student Name: Nidhi Chowdary Gadde
--Unit Code: FIT9132
--Applied Class No: 01

/* Comments for your marker:




*/

/*2(a)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    i.item_id as item,
    i.item_desc as description,
    i.item_stdcost as standard_cost,
    i.item_stock as stock
FROM
    mns.item i
WHERE
        i.item_stock >= 50
    AND upper(i.item_desc) LIKE upper('%composite%')
ORDER BY
    i.item_stock DESC,
    i.item_id;


/*2(b)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    p.provider_code,
    TRIM(
        CASE
            WHEN p.provider_title IS NOT NULL THEN
                p.provider_title || ' '
            ELSE
                ''
        END
        ||
        CASE
            WHEN p.provider_fname IS NOT NULL THEN
                p.provider_fname || ' '
            ELSE
                ''
        END
        || nvl(p.provider_lname, '')) AS provider_full_name
FROM
         mns.provider p
    JOIN mns.specialisation s
    ON p.spec_id = s.spec_id
WHERE
    upper(s.spec_name) = upper('PAEDIATRIC DENTISTRY')
ORDER BY
    p.provider_lname,
    p.provider_fname,
    p.provider_code;
    

/*2(c)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    s.service_code,
    s.service_desc,
    lpad(to_char(s.service_stdfee, '$9999.99'), 15, ' ') AS service_stdfee
FROM
    mns.service s
WHERE
    s.service_stdfee > (
        SELECT
            AVG(service_stdfee)
        FROM
            mns.service
    )
ORDER BY
    s.service_stdfee DESC,
    s.service_code;


/*2(d)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    a.appt_no,
    a.appt_datetime,
    a.patient_no,
    patient_fname || ' ' || patient_lname AS patient_fullname,
    lpad(to_char(nvl(aps.apptserv_fee, 0) + nvl(aps.apptserv_itemcost, 0),
            '$9999'), 15, ' ') AS appt_total_cost
FROM
         mns.appointment a
    JOIN mns.appt_serv aps
    ON a.appt_no = aps.appt_no
    JOIN mns.patient   p
    ON a.patient_no = p.patient_no
ORDER BY
    appt_total_cost DESC,
    a.appt_no;
    
    
/*2(e)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
s.service_code,
s.service_desc,
lpad(to_char(s.service_stdfee, '$9999.99'),
15,
' ') AS standard_fee,
lpad(to_char(nvl(s.service_stdfee, 0) - nvl((
SELECT
AVG(aps.apptserv_fee)
FROM mns.appt_serv aps
WHERE
aps.service_code = s.service_code
),
0),
'$999.99'),
23,
' ') AS service_fee_differential
FROM
mns.appt_serv aps
JOIN mns.service s
ON aps.service_code = s.service_code
GROUP BY
s.service_code,
s.service_desc,
s.service_stdfee
ORDER BY
s.service_code;



/*2(f)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
p.patient_no,
p.patient_fname
|| ' ' || p.patient_lname AS patientname,
trunc(months_between(sysdate, p.patient_dob) / 12) AS currentage,
COUNT(a.appt_no) AS numappts,
lpad(to_char(round(((COUNT(a.appt_no) - 1) / COUNT(a.appt_no)) * 100, 2), '99.99'), 10, ' ') || '%' AS followups
FROM mns.patient p
LEFT JOIN mns.appointment a
ON p.patient_no = a.patient_no
GROUP BY
p.patient_no,
p.patient_fname,
p.patient_lname,
p.patient_dob
ORDER BY
p.patient_no;


/*2(g)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
  NVL(TO_CHAR(provider_code), '-') AS "PCODE",
  NVL(TO_CHAR(SUM(numapp)), '-') AS "NUMBERAPPTS",
  NVL(TO_CHAR(SUM(fee), '$999999.99'), '-') AS "TOTALFEES",
  NVL(TO_CHAR(SUM(quantity)), '-') AS "NOITEMS"
FROM
  (
    SELECT
      a.provider_code,
      COUNT(a.appt_no) AS numapp,
      SUM(aps.apptserv_fee) AS fee,
      SUM(asi.as_item_quantity) AS quantity
    FROM
      mns.appointment a
      LEFT JOIN mns.appt_serv aps ON a.appt_no = aps.appt_no
      LEFT JOIN mns.apptservice_item asi ON aps.appt_no = asi.appt_no
    WHERE
      a.appt_datetime BETWEEN TO_DATE('2023-09-10 09:00', 'YYYY-MM-DD HH24:MI') AND TO_DATE('2023-09-14 17:00', 'YYYY-MM-DD HH24:MI')
    GROUP BY
      a.provider_code
  ) appointment_summary
GROUP BY
  provider_code
ORDER BY
  provider_code;

