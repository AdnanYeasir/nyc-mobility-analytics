USE nyc_mobility_analytics;
GO

SELECT *
From locations
Left Join car_stops
On locations.location_id = car_stops.location_id


SELECT summonses.summons_id, car_stops.stop_id,vehicle_plate, violation_code, violation_category
FROM summonses
LEFT JOIN car_stops
ON summonses.stop_id = car_stops.stop_id


WITH summons_count AS (
    SELECT COUNT(summonses.summons_id) AS summons_count, car_stops.stop_id
    FROM car_stops
    LEFT JOIN summonses
        ON summonses.stop_id = car_stops.stop_id
    GROUP BY car_stops.stop_id
)
WITH  Productive_stops AS (
    SELECT stop_id, summons_count, 
    CASE 
        WHEN summons_count >= 1 THEN 1
        ELSE 0
        END AS productive_flag
FROM summons_count;
)


SELECT COUNT(productive_stops) / SUM(summons_count) * 100.0 AS average_stops_per_productive_stop
FROM productive_stops
