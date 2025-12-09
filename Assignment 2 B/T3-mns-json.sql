--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-mns-json.sql

--Student ID: 34228683
--Student Name: Nidhi Chowdary Gadde
--Unit Code: FIT9132
--Applied Class No: 01

/* Comments for your marker:




*/

/*3(a)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT TO GENERATE 
-- THE COLLECTION OF JSON DOCUMENTS HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SET PAGESIZE 300

SELECT
        JSON_OBJECT(
            '_id' VALUE appt_no,
            'datetime' VALUE TO_CHAR(appt_datetime, 'DD/MM/YYYY HH24:MI:SS'),
            'provider_code' VALUE provider_code,
                    'provider_name' VALUE 
                    (CASE 
                        WHEN provider_title IS NOT NULL THEN
                provider_title || ' '
            ELSE
                ''
        END
        ||
        CASE
            WHEN provider_fname IS NOT NULL THEN
                provider_fname || ' '
            ELSE
                ''
        END
        || nvl(provider_lname, '')
        ),
            'item_totalcost' VALUE SUM(item_stdcost*as_item_quantity),
            'no_of_items' VALUE COUNT(as_item_quantity),
                    'items' VALUE JSON_ARRAYAGG(
                JSON_OBJECT(
                    'id' VALUE item_id,
                            'desc' VALUE item_desc,
                            'standardcost' VALUE item_stdcost,
                            'quantity' VALUE as_item_quantity
                )
            )
        FORMAT JSON)
        || ','
FROM
         mns.appointment
         JOIN mns.provider USING (provider_code)
         NATURAL JOIN mns.apptservice_item
         NATURAL JOIN mns.item
WHERE
as_item_quantity > 0
GROUP BY
    appt_no,
    provider_fname,
    provider_lname,
    appt_datetime,
    provider_code,
    provider_title
ORDER BY
    appt_no;