USE nyc_mobility_analytics;
GO

INSERT INTO locations (
    location_id,
    intersection,
    street_name,
    cross_street,
    borough,
    precinct,
    latitude,
    longitude,
    zip_code
)
VALUES (
    1,
    'JFK Terminal 4',
    'Main Street',
    'First Avenue',
    'Queens',
    'Queens 1',
    40.6925,
    -73.7871,
    '11375'
),
(
    2,
    'Times Square',
    'Broadway',
    '7th Avenue',
    'Manhattan',
    'Manhattan 1',
    40.7580,
    -73.9855,
    '10036'
),
(
    3,
    'Brooklyn Bridge',
    'Centre Street',
    'Park Row',
    'Brooklyn',
    'Brooklyn 1',
    40.7061,
    -73.9969,
    '11201'
);

INSERT INTO car_stops (
    stop_id,
    stop_date,
    stop_time,
    location_id,
    officer_id,
    squad,
    vehicle_plate,
    license_num,
    vehicle_license_type,
    stop_reason,
    stop_outcome,
    warning_flag,
    summons_flag,
    seizure_flag,
    arrest_flag
)
VALUES
(
    101,
    '2026-10-01',
    '09:30:00',
    1,
    5001,
    'Squad A',
    'ABC1234',
    'LIC1001',
    'FHV',
    'Routine Inspection',
    'Summons Issued',
    0,
    1,
    0,
    0
),
(
    102,
    '2026-10-01',
    '11:15:00',
    1,
    5002,
    'Squad A',
    'XYZ5678',
    'LIC1001',
    'Yellow Taxi',
    'Equipment Inspection',
    'Warning Only',
    1,
    0,
    0,
    0
),
(
    103,
    '2026-10-02',
    '14:45:00',
    2,
    5003,
    'Squad B',
    'DEF9012',
    'LIC1003',
    'FHV',
    'Suspected Unlicensed Activity',
    'Summons Issued',
    0,
    1,
    0,
    0
),
(
    104,
    '2026-10-03',
    '17:20:00',
    2,
    5001,
    'Squad B',
    'GHI3456',
    'LIC1004',
    'FHV',
    'Routine Inspection',
    'Summons Issued',
    0,
    1,
    0,
    0
);

INSERT INTO summonses (
    summons_id,
    stop_id,
    summons_date,
    violation_code,
    violation_category,
    violation_description,
    unlicensed_flag,
    summons_status,
    disposition,
    fine_amount
)
VALUES
(
    1001,
    101,
    '2026-10-01',
    'TLC101',
    'Licensing',
    'Operating without required TLC license',
    1,
    'Open',
    'Pending Hearing',
    500.00
),
(
    1002,
    101,
    '2026-10-01',
    'TLC102',
    'Documentation',
    'Failure to produce required documents',
    0,
    'Open',
    'Pending Hearing',
    150.00
),
(
    1003,
    103,
    '2026-10-02',
    'TLC101',
    'Licensing',
    'Operating without required TLC license',
    1,
    'Open',
    'Pending Hearing',
    500.00
),
(
    1004,
    103,
    '2026-10-02',
    'TLC103',
    'Safety',
    'Unsafe passenger pickup',
    0,
    'Closed',
    'Guilty',
    250.00
),
(
    1005,
    103,
    '2026-10-02',
    'TLC104',
    'Insurance',
    'Failure to maintain proper insurance',
    0,
    'Open',
    'Pending Hearing',
    400.00
),
(
    1006,
    104,
    '2026-10-03',
    'TLC105',
    'Documentation',
    'Expired vehicle inspection documentation',
    0,
    'Closed',
    'Guilty',
    200.00
);