## CSC/ECE 517 - Object Oriented Design and Development
# Program 2 - Ruby on Rails

* Teams may consist of 2-3 members
* Submission due date : September 30, 2019 (Monday) 11:59 PM
* Resubmission due date : October 9, 2019 (Wednesday) 11:59 PM

# Team Members

| Name        | id          | 
| ----------- |-------------| 
|Qingyan Wang |qwang20      |
|Ruiwen Wu    |rwu5         |
|Yongjian Zhu |yzhu48       |

# Run the Library Management System
* To run the project, go to https://still-taiga-41852.herokuapp.com
* To run the project local, please do
    bundle install
    rails db:migrate
    rails s
# Sign up as admin:
* The pre-config admin username:    password:
* After signing up as admin, you will be direct to the main page of the Library Management System. An admin user is able to
  1) View/create/delete/edit universities. 
  2) View/create/delete/edit libraries. 
  3) View/create/delete/edit books.
  4) View/create/delete/edit librarians. 
  5) View/create/delete/edit students. 
  6) Approve/deny hold requests. 
  7) View overdue books. 
  8) Admin can update book stock after creating a book.
  9) Using search bar, admin is able to search a book based on its title/author/subject/date. 
  10) Edit the admin's own profile. 
  11) Approve/deny a librarian sign up request. 
  12) Cancel his account. 
  13) Log out by clicking on the top right side button "logout".
# Sign up as student: 
* Student can sign up by themself. After signing up as student, you will be direct to the main page of the Library Management System as student view. A student user is able to 
  1) View/borrow the list of books of his/her university.
  2) Add/delete a book of his university to wishlist.
  3) View existing libraries in the system and their details.
  4) Search book based on its title/auther/subject/date. 
  5) View his/her current borrowed books and the overdue fine. 
  6) return a book.
  7) Create a hold request when a book is not available or when a book is belong to special collection 
  8) View/delete the hold request of his own. 
  9) Edit his/her own profile. 
  10) Cancel his account. 
  11) Log out by clicking on the top right side button "logout".
# Sign up as librarian:
* **A librarian sign up need to be approved by an admin user.** After approved by an admin user, the librarian is direct to librarian main page. A librarian user is able to 
  1) Edit his/her own profile (change the library he belongs to).
  2) Cancel his/her own account.  
  3) View the libraries that he/she belongs to.
  4) Edit the library attribute that he/she belongs to. 
  5) View/edit/destroy the book in the library he/she belongs to.
  6) Update book stock in the library he/she belongs to. 
  7) Using search bar, librarian is able to search a book based on its title/author/subject/date. 
  8) Log out by clicking on the top right side button "logout".
# Cases we have considered
* The same email address can be used for signing up for multiple roles.
* All validations has been added. You need to use true email format for registering account. And only real email can receive borrow success emails. For convevience of testing, we have removed strict format ISBN validation, instead, you need to put only integers in the ISBN field. (To use ISBN validation, simply use gem 'isbn_validation', and then using this syntax: "validates :isbn,   :isbn_format => true", which would be really annoying for general black box testing)
* Email will be sent to the registered email after 
  1) a book is borrowed and gotten by a student
  2) when a librarian approves a hold request and assigns the book to the student
  3) first student's book limit is reached, when next book is returned, the system will assign the returned book to the next hold request student.
* The fine is calculated using the function: Overdue fine of the library * overdue days

# Rspec testing for one model and one controller
* We wrote rspec tests thoroughly for university model and university controller. 
* To run the tests, import the project into Rubymine
* Run "rake db:migrate RAILS_ENV=test"
* Then run "bundle exec rspec" in the terminal. This should pass all of the examples in rspec.

# *Project Documentation Below*

# Library Management 

You are tasked with creating a Library Management System

There will be 5 main components in the system:
* Library
* Book
* Admin
* Librarian
* Student

## Library

A library should have at least the following attributes:
* Name
* University
* Location (on Campus)
* Maximum number of days a book can be borrowed
* Overdue fines for the books in the library

## Book

A book should have at least following attributes (https://catalog.lib.ncsu.edu/catalog/NCSU3343215):
  * ISBN (unique)
  * Title
  * Author(s)
  * Language
  * Published
  * Edition
  * Image of the front cover (PNG or JPEG files only)
  * Subject of the book (Ex: Computer Science/Industrial/Life Sciences etc.)
  * Summary
  * Is Special Collection Item? (Yes/No) 

## Admin

The system should have a preconfigured admin with at least the following attributes: 
* Email (unique for each account)
* Name 
* Password

An admin should be capable of performing all operations performed by Librarian or Student, and admin account cannot be deleted.
Admins should be able to:

* Log in with an email and password
* Edit profile
* Create/Modify Librarian or Student accounts
* Create Books.
* View the list of users (students and librarians) and their profile details (except password)
* View the list of books, along with detailed information.
* View the list of book hold requests.
* View the list of Checked out books.  
* View the list of students with books overdue (along with overdue fines).
* View the borrowing history of each book.
* Delete Student/Book/Librarian from the system


## Librarian

A librarian should have at least the following attributes: 
* Email (unique for each account)
* Name 
* Password
* Library

Anyone can sign up as a librarian using their email, name and password. After signing up, they must be approved by an admin before they can perform the following tasks:

* Log in with email and password.
* Edit their own profile to choose an existing library. Each librarian can only work for one library.
* Edit library attributes.
* Add/Remove books to/from a library.
* View & Edit book information.
* View all books.
* View hold requests for any book in the library he/she works in.
* For books in the special collection, accept or deny book hold request.
* View list of all the books that are checked out from their library.
* View the borrowing history of the books from their library.
* View the list of students with overdue books from their library along with overdue fine.


## Students

A student should have at least the following attributes: 
* Email (unique for each account), 
* Name 
* Password
* Educational Level (Undergraduate/Graduate/PhD Student)
* University 
* Maximum number of books (**N**) that can be borrowed at any given time (Based on their educational level, For ex: Undergraduate - 2, Masters - 4, PhD - 6).

Anyone can sign up as a student using their email, name and password. After signing up, they can perform the following tasks:

* View the list of all the libraries
* Edit profile to modify email, name and password only.
* View all books
* Check out/Request/Return a book from any library associated with their University.
* Renew/Modify/Delete a reservation.
* View/Edit their account attributes (including changing their password).
* Search through the books
  * Search by title
  * Search by author
  * Search by publication date
  * Search by category
* Bookmark a book they are interested in.
* View their bookmarked books.
* At any given time, a student can borrow a max of '**N**' number of books based on their educational level.
* View the overdue fines for his/her account. 
* Receive an email when any of their book request is sucessful.

### Book Hold Request
* If the book is available, proceed to check out:
  * If the book is in Special Cllection list, add this to Librarian's approval list and wait. 
  * Otherwise, add the book to student's checked out list
* If the book is unavailable or the student has checked out **N** books already,
  * Inform the student that the book is unavailable or max limit reached.
  * Create a book hold request if the student wants to continue requesting.  
  
* Number of hold requests for a book should be visible to every user

### Returning a book
* If there is no hold request for a book, return and increase the available count of the book
* If there is a pending hold request,
  * Approve the hold request and add the book to the checked out list of the requested student
  * Send a mail to the student that the book is checked out.

## Notes
* There will be only one admin in the system, and this account will be preconfigured. 
* A librarian can add more than one book.  
* Each student can bookmark/request multiple books. They can also remove themselves from the bookmark/request list for a book.
* It’s up to you whether a user should be able to sign up as both an librarian and a student with the same email address or not.  Either way is OK.

## Miscellaneous

### Testing

* Thoroughly test one model and one controller (prefer RSpec testing framework).

### Deployment
**_Please ensure that your deployment is always accessible for grading_**. You can deploy your app to any of the following: (Try to perform continuous deployment)

* Heroku or any similar PaaS (OpenShift, etc.) with free plans
* Amazon AWS
* NCSU VCL

### Bonus (Extra Credit)
You can do any or all of the below tasks for extra credit (each item below is worth **5 points**).
* No student/librarian should access any private content associated with other student/librarian/admin's account.
* All users can use their LinkedIn/Google/Facebook account (implementing any one of them is enough) to log into the system.

## Submission
Your submission in Expertiza should consist of the following-

* A link to your deployed application
* A link to your repository
   * Credentials for the preconfigured admin and any other information that reviewers would find useful should be in the README.md file in this repository
   * Please include the following details (not limited to!) in README file:
      * How to test various features (e.g., how to access certain pages, what details to enter in the form etc.)
      * How your program handles edge-case scenarios(e.g., what will happen if  admin/librarian deletes a book checked out by students? Or if the student who has checkout out a book deletes his/her account.)
      
      
# Frequently Asked Questions (FAQs)
* [FAQ](https://docs.google.com/document/d/1LRcu-cyPqBmIZdhG677JwEFMQ6J-UFR5piTAMgzkeGI/edit?usp=sharing "FAQ")
1. Can we use any 3rd party gems?
* Yes, you can.

2. If the admin account is predefined, how does the admin know how to log in?  Do we just give the admin a predefined login and password?
* Yes.

3. Would a bare minimum UI consist of a page of links and simple HTML?
* As long as the functionalities work, it is ok.

4. Is the admin able to edit the existing information for librarian and/or students?
* Yes. As mentioned above, an admin should be capable of performing all operations performed by librarian or students.

5. Can a librarian switch between libraries?
* Your call, but at any given moment a librarian can be associated with only one library and has access to the books from the same library.

6. Admin has the right to create librarian and student accounts. When the admin creates an account for a student, the admin creates it with the student’s email address.

7. Is the extra credit included in 70 points for the program, or can we score more than 70?
* You can score more than 70 if you finish all extra credit tasks.

8. Does the admin set password for them while creating a new librarian/student?
* Yes

9. Are we required to store the hashes of passwords? Or are we expected to store the passwords themselves?
* Hashes of the password

10. Do we submit the assignment through github?
* Yes, you submit the github link in expertiza.

11. Can React be used for frontend? Any resources on how to integrate react with .erb?
* You can use whatever you want for the frontend. The TA staff will not provide support for anything apart from .erb templates

12. Are we supposed to create different portals for librarian login and student login?
* Upto you

13. Should the Maximum number of books (N) be configurable?
* Yes. An example is given in Student description. You are free to design in any way as long as different education level students have different **N**.

14. Are we allowed to use any database software or do we have to use a specific one?
* You are allowed to use any. Please make sure you are able to deploy it.

15. Is it necessary for the the library to be affiliated to a university?
* Yes

16. Should there be any penalty for returning the book after due?
* Yes, you calculate the overdue fine

17. Is there an amount of time we are expected to keep the deployment running for after the project has been submitted?
* Atleast 2 weeks after the final submission

18. We have to deploy our application to OpenShift/AWS ? 
* No, you could use VCL or Heroku. (Please check "Deployment" section in the program description)

19. What if two students borrow a same book simultaneously?
* Not allowed. One book can be checked out by only one student.

20. Do we need to create a bucket for book checkout like a cart on online shopping?
* Upto you

21. Are there different admins for different libraries?
* 1 Admin for the aplication who can perform all the operations listed under Admin/Librarian/Student.

22. Is there any requirement for the database? Like we have to use Oracle or MySQL. Or we can just choose the one we like?
* You can use whatever you want. The TA staff will not provide support for anything apart from SQL, PostgreSQL, MySQL databases.

23. Association between books and library is not clear. Is it upto the student to define this? 
Do we need to excrypt sensitive data?
* A book is part of a library. Few attributes like max no of days a book can be borrowed or the overdue fines apply to all the books in a library. Encryption - Upto you.

24. What does the University attribute of Student do? Can student edit this attribute? 
* A student can borrow books from the libraries associated with the University they are enrolled in. No, this field cannot be edited once set.




