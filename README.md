Outra
Data Engineer Technical Test

Background
At Outra we ingest and analyse a large quantity of property listings data from the major residential listings sites. The attached listings data shows a small selection of properties and how the listing has changed over time (e.g. price changes, corrections to the address etc).
Data included:-
    • listings.csv
    • addresses.csv
    • rates.json  (some recent exchange rates)

Task
Part A (SQL)
Write SQL code that will answer the following questions:-
    1. For each listing ID, return the latest address and price. Also extract the postcode into a separate field.
    2. Provide a list of property's that went under offer, with the price and date they first went under offer
    3. Using the "addresses" data, display all addresses whether they've been listed or not. Also add the average listed price for each address.
    4. Find the top 5 properties whose price has fluctuated the most during the listing. 

Part B (Python)

Using the list of properties identified in question 4 in part A, create a csv file from the results and answer the following questions using python:-

    1. Display the price changes over time for these properties on a line chart. 
    2. Use the rates.json file to convert the prices to USD, and display the same chart.

