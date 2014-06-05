A Bank Application for manage user with account.

Used tool -
1. Ruby 1.8.7 or higher
2. Rails 3.x.x or higher
3. Mysql5
(works in Firefox, Chrome and Safari with basic support for IE10)

Install -
1. Clone or downlaod zip folder.
2. Extract it if downloaded
3. Run - bundle install
4. Run - rake db:create
5. Run - rake db:migrate
6. Run - rails s

After running migration admin user record created by defaulty. Admin login details - 
   User ID - admin
   Password - admin

Site Map -
Home page - http://localhost:3000
Here you can login as admin or as account holder

Admin Portal -
  If login as admin then admin dashboard will come. Here you can perform following actions - 
      a. Create User - When you create an user and account also created with balance 0.00. After creation user will get user id and paasword.
      b. Edit/Delete user.
      c. Check account statement by clicking on corresponding account number anchor link available admin dashboard.
      d. Offer fund - admin can able to offer some fund to any user.
      e. Logout

Account Holder Portal -
  User dashboard will come. Here you can perform following actions - 
  1. See statement with balance, received and transafer amounts.
  2. Transfer fund - he can transfer fund to any other account holder.
  3. Logout

------------------------------------------------------------------------------------------------------------------------------------
Rake Task - 
Offer fund to an user - run following command from console
     rake banking:offer_fund user_id=150801 amount=100

Here user_id is his login id which is unique.











       
   
