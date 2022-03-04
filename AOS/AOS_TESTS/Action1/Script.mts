'------------------------Generate Data-----------------------------------------------------

'generate random data
Dim rndUserName 'declare a variable
rndUserName = "Ama" & RandomNumber(1000,9999) 'assign random user name value to a variable
DataTable("In_UserName") = rndUserName 'save the randomly generated value to a data table parameter
DataTable("In_EmailAddress", dtGlobalSheet) = rndUserName & "@" & GenerateRandData ("DOMAIN") 'use random username to create a useremail value, save to data table parameter

'---------------------use function library----------------------------------------------

'generate random First Name using GenerateRandDatea() function
DataTable("in_FirstName") = GenerateRandData ("Name") 'save to a data table parameter

'generate random Last Name using GenerateRandData() function
DataTable("in_LastName") = GenerateRandData ("NAME")  'save to a data table parameter

'generate random phone number
DataTable("in_PhoneNumber") = GenerateRandData ("1-604-###-####") 'save to a data table parameter

'validate website homepage opens

Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("dvantage").Check CheckPoint("Check logo on Home Page") @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("dvantage")_;_script infofile_;_ZIP::ssf172.xml_;_


'create new account
Browser("Advantage Shopping").Page("Advantage Shopping").Link("UserMenu").Click @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").Link("UserMenu")_;_script infofile_;_ZIP::ssf173.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").Link("CREATE NEW ACCOUNT").Click @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").Link("CREATE NEW ACCOUNT")_;_script infofile_;_ZIP::ssf174.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("usernameRegisterPage").Set DataTable("In_UserName") @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("usernameRegisterPage")_;_script infofile_;_ZIP::ssf175.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("Email").Click @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("Email")_;_script infofile_;_ZIP::ssf176.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("emailRegisterPage").Set DataTable("In_EmailAddress") @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("emailRegisterPage")_;_script infofile_;_ZIP::ssf177.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("passwordRegisterPage").Set DataTable("in_Password") @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("passwordRegisterPage")_;_script infofile_;_ZIP::ssf178.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("confirm_passwordRegisterPage").Set DataTable("in_Password") @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("confirm passwordRegisterPage")_;_script infofile_;_ZIP::ssf179.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("First Name").Click @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("First Name")_;_script infofile_;_ZIP::ssf180.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("first_nameRegisterPage").Set DataTable("in_FirstName") @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("first nameRegisterPage")_;_script infofile_;_ZIP::ssf181.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("last_nameRegisterPage").Set DataTable("in_LastName") @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("last nameRegisterPage")_;_script infofile_;_ZIP::ssf182.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("phone_numberRegisterPage").Set DataTable("in_PhoneNumber") @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("phone numberRegisterPage")_;_script infofile_;_ZIP::ssf183.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebList("countryListboxRegisterPage").Select "Canada" @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebList("countryListboxRegisterPage")_;_script infofile_;_ZIP::ssf184.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebCheckBox("i_agree").Set "ON" @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebCheckBox("i agree")_;_script infofile_;_ZIP::ssf185.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebButton("register_btnundefined").Click @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebButton("register btnundefined")_;_script infofile_;_ZIP::ssf186.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").Sync @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping")_;_script infofile_;_ZIP::ssf187.xml_;_
'validate new user name on top menu @@ script infofile_;_ZIP::ssf37.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("New_User_Name").Check CheckPoint("Confirm New User") @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("New User Name")_;_script infofile_;_ZIP::ssf188.xml_;_
'Browser("Advantage Shopping").Back
'add item to a shopping cart
Browser("Advantage Shopping").Page("Advantage Shopping").Link("View Details").WaitProperty "visible", True, 20000  @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").Link("View Details")_;_script infofile_;_ZIP::ssf189.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").Link("View Details").Click @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").Link("View Details")_;_script infofile_;_ZIP::ssf190.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebButton("save_to_cart").Click @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebButton("save to cart")_;_script infofile_;_ZIP::ssf191.xml_;_
'checkout shopping cart
Browser("Advantage Shopping").Page("Advantage Shopping").Link("ShoppingCart").Click @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").Link("ShoppingCart")_;_script infofile_;_ZIP::ssf192.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebButton("check_out_btn").Click @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebButton("check out btn")_;_script infofile_;_ZIP::ssf193.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebButton("next_btn").Click @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebButton("next btn")_;_script infofile_;_ZIP::ssf194.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("SafePay username").Click @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("SafePay username")_;_script infofile_;_ZIP::ssf195.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("safepay_username").Set DataTable("in_Spuser", dtGlobalSheet) @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("safepay username")_;_script infofile_;_ZIP::ssf196.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("SafePay password").Click @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("SafePay password")_;_script infofile_;_ZIP::ssf197.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("safepay_password").Set DataTable("in_SpPassword", dtGlobalSheet) @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("safepay password")_;_script infofile_;_ZIP::ssf198.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebButton("pay_now_btn_SAFEPAY").Click @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebButton("pay now btn SAFEPAY")_;_script infofile_;_ZIP::ssf199.xml_;_
'verify order created
Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("Thank you for buying with").Check CheckPoint("Thank you for buying with Advantage") @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("Thank you for buying with")_;_script infofile_;_ZIP::ssf200.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("trackingNumberLabel").Output CheckPoint("trackingNumberLabel") @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("trackingNumberLabel")_;_script infofile_;_ZIP::ssf201.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("trackingNumberLabel").Output CheckPoint("trackingNumberLabel_2") @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("trackingNumberLabel")_;_script infofile_;_ZIP::ssf202.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("orderNumberLabel").Output CheckPoint("orderNumberLabel") @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("orderNumberLabel")_;_script infofile_;_ZIP::ssf202.xml_;_
'logout
Browser("Advantage Shopping").Page("Advantage Shopping").Link("UserMenu_2").Click @@ hightlight id_;_Browser("Advantage Shopping").Page("Advantage Shopping").Link("UserMenu 2")_;_script infofile_;_ZIP::ssf171.xml_;_
Browser("Advantage Shopping").Page("Advantage Shopping").Link("Sign out").Click @@ hightlight id_;_1312506_;_script infofile_;_ZIP::ssf75.xml_;_
