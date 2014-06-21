Hill Valley Clock
=================

Hill Valley Clock is an application that allows users to clock time for employees and also view and manage employee accounts as an administrator.

Requirements
================
•	Build an application that allows employees to enter an ID into a form and then click a button to clock-in/out. 
•	The clock-in and out times should be saved in a MySQL database and the program should keep track of an employee’s status, whether clocked in/out so that the next time they access the system it will know to do a clock-out vs. a clock-in and vice-versa.  
•	An employee cannot clock-in when they are already clocked-in or clock-out when they already are.  
•	When the employee clocks in and out, they should get a confirmation that the action was successful and the time they clocked in/out, the total amount they just worked, and any other information you’d like to display on the screen. 
•	Also create a way to add and remove employees. 
•	You should be able to add an employee’s first name, last name, ID and set if the particular user is an “employee” or an “administrator”. 
•	When an administrator clocks in, the interface should clock them in and keep track of their time (just like a normal employee), however, the interface will ALSO display ALL of the other employees and their times worked over the last 7 days.  
•	This report is only shown when an administrator clocks in. 
•	You do not need to create a secure login or anything to access the script. 
•	Add a report button for employees so that they can generate a simple report of their time worked over the last 7 days. 
•	Write the unit and functional tests for all models and controllers. Use RSpec for unit testing.
•	Use CSS to organize the UI.

Important: Use git for source code management, and COMMIT OFTEN. We'd like to see the changes as you progress.

Bonus: Write integration tests.
 
Deliverables: The application in Github with all the necessary codes, SQL dump of the tables and tests to run on anybody's machine that has Ruby on Rails on it. (We need to be able to run it in our machine).


Directions
===============

1. Clone the repo and cd into the host_app folder
2. Run the script labeled "./after_pull"
3. Run "bundle install"
4. Run "bundle exec rails s"
5. In a browser, navigate to the index page: http://localhost:3000
6. Employees can be created from and accessed on the index page
7. Creating or accessing an employee will execute a clock. A clock will notify the user whether is was a clock in or a clock out.
