use ola;
select * from bookings;
select * from bookings
where Booking_Status = 'Success';

#1. Retrieve all successful bookings:
create view Successful_Bookings as 
select * from bookings
where Booking_Status = 'success';

select * from Successful_Bookings;

#2. Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle As
select Vehicle_Type, AVG(Ride_Distance)
as avg_distance from bookings
group by Vehicle_Type;

select * from ride_distance_for_each_vehicle;

#3. Get the total number of canceled ride by customers:
create view canceled_Rides_by_Customer as
select count(Canceled_Rides_by_Customer) from bookings;

select * from canceled_Rides_by_Customer;

#4. List the top 5 customers who booked the highest number of rides:
create  view Top_5_Customers As
select Customer_ID, count(Booking_ID) as total_rides from Bookings
group by Customer_ID
order by total_rides DESC limit 5;

select * from Top_5_Customers;

#5. Get the number of rides canceled by driver due to personal and car-related_issue:
create view Canceled_Ride_Customer as
select count(Canceled_Rides_by_Driver) from Bookings;

select * from Canceled_Ride_Customer;

#6. Find the maximum and minima driver ratings for prime Sedan bookings:
create view Max_Min_Driver_Ratings as
Select max(Driver_Ratings) as Max_rating,
min(Driver_Ratings) as Min_Rating
from bookings 
where Vehicle_Type = 'Prime Sedan';

select * from Max_Min_Driver_Ratings;

#7. Retrieve all rides where payment was made using UPI:
create view UPI_Pay as 
Select * from bookings
where Payment_Method = 'UPI';

select * from UPI_Pay;

#8. Find the average customer rating per vehicle type:
Create view Avg_Customer_Ratings as
Select Vehicle_Type, avg(customer_rating) as avg_cus_rating from bookings
group by Vehicle_Type;

select * from Avg_Customer_Ratings;

#9. Calculate the total booking value of rides completed successfully:
Create view Total_Revenue as
Select sum(Booking_Value) as Total_Revenue
from bookings
where booking_status = 'success';

select * from Total_Revenue;

#10. List all incomplete rides along with the reason:
create view Incomplete_Rides as 
Select Booking_id, Incomplete_Rides_Reason
from Bookings
where Incomplete_rides = 'yes';

Select * from Incomplete_Rides;