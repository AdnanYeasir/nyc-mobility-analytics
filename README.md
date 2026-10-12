# NYC Mobility analytics platform

## Business Problem

TLC Enforcement leadership needs a better way to identify locations with persistent unlicensed or high-frequency violation activity and determine whether previous enforcement actions are reducing that activity. The Deputy Commissioner, Chiefs, and Captains can use the analysis to prioritize squad deployment, identify repeat-offender patterns, and distinguish temporary spikes from persistent hotspots. The platform would combine violation trends, enforcement activity, complaints, repeat offenses, and potentially external safety data to determine where intervention is most needed. This matters operationally because limited enforcement resources can be directed toward locations where they are most likely to reduce recurring illegal activity.

## KPI
Stop Hit Rate
Violations per Productive Stop
Repeat-Offender Rate
30-Day Violation/Hit-Rate Trend
Unlicensed Activity Rate

Name: Stop Hit Rate
Definition: percentage of car stops that result in at least one summons
Formula: car stops resulting in at least 1 summons / total car stops * 100
Business interpretation: Tells us how often vehicle stops identify at least one summonsable violation and helps compare enforcement productivity across locations, periods, or deployments.

Name: Average Violations per Productive Stop
Definition:
Definition: average number of violations issued during stops that result in at least one summons
Formula: total violations issued / car stops resulting in at least 1 summons
Business interpretation: tells us how many violations are typically found when a violating vehicle is stopped and whether multiple violations are commonly found during the same stop

Name: Repeat-Offender Rate
Definition: percentage of vehicles that received the same violation more than once during the selected period
Formula: vehicles receiving the same violation more than once / total vehicles receiving that violation × 100
Business interpretation: tells us how often the same drivers or vehicles continue committing the same violations and helps identify repeat offenders  

Name: 30-Day Violation Trend
Definition: percentage increase or decrease in violations at a location compared with the previous 30-day period
Formula: (current 30-day violations - previous 30-day violations) / previous 30-day violations * 100
Business interpretation: tells us whether violation activity is increasing or decreasing and whether recent enforcement decisions may be having an impact  

Name: Unlicensed Violation Share
Definition: percentage of total summonses that are related to unlicensed activity
Formula: unlicensed activity summonses / total summonses * 100
Business interpretation: shows how much of detected violation activity involves unlicensed operations and helps track whether that share changes over time or across locations

## Data Requirements

Name: Stop Hit Rate
Required fields: 
stop_id
stop_date
stop_location
stop_outcome OR summons_flag

Name: Average Violations per Productive Stop
Required Fields: 
stop_id
summons_id
summons_type
summons_date

Name: Repeat-Offender Rate
Required Fields: 
plate_num
summons_type
summons_date
summons_id

Name: 30-Day Violation Trend
Required Fields: 
summons_id
summons_date
location
summons_type

Name: Unlicensed Violation Share
Required Fields: 
summons_id
summons_date
violation_category
summons_type
location

## Definiion
car_stops:
One row represents one vehicle stop conducted by an officer, regardless of whether the stop results in a summons, warning, or no enforcement action.

summonses:
One row represents one individual summons/violation issued during a vehicle stop. A single car stop can therefore be linked to multiple summons records.

locations:
One row represents one unique enforcement location/intersection, with attributes such as borough and precinct.

## Table

# car stops: 
- stop_id        PK
- stop_date
- stop_time
- location_id    FK
- officer_id
- squad
- vehicle_plate
- license_num
- vehicle_license_type
- stop_reason
- stop_outcome
- warning_flag
- summons_flag
- seizure_flag
- arrest_flag

# summonses
- summons_id        PK
- stop_id           FK
- summons_date
- violation_code
- violation_category
- violation_description
- unlicensed_flag
- summons_status
- disposition
- fine_amount

# locations
- location_id       PK
- intersection
- street_name
- cross_street
- borough
- precinct
- latitude
- longitude
- zip_code
