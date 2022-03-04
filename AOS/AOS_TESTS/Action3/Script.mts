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

Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("dvantage").Check CheckPoint("Check logo on Home Page")


'create new account
Browser("Advantage Shopping").Page("Advantage Shopping").Link("UserMenu").Click
Browser("Advantage Shopping").Page("Advantage Shopping").Link("CREATE NEW ACCOUNT").Click
Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("usernameRegisterPage").Set DataTable("In_UserName")
Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("Email").Click
Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("emailRegisterPage").Set DataTable("In_EmailAddress")
Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("passwordRegisterPage").Set DataTable("in_Password")
Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("confirm_passwordRegisterPage").Set DataTable("in_Password")
Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("First Name").Click
Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("first_nameRegisterPage").Set DataTable("in_FirstName")
Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("last_nameRegisterPage").Set DataTable("in_LastName")
Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("phone_numberRegisterPage").Set DataTable("in_PhoneNumber")
Browser("Advantage Shopping").Page("Advantage Shopping").WebList("countryListboxRegisterPage").Select "Canada"
Browser("Advantage Shopping").Page("Advantage Shopping").WebCheckBox("i_agree").Set "ON"
Browser("Advantage Shopping").Page("Advantage Shopping").WebButton("register_btnundefined").Click
Browser("Advantage Shopping").Page("Advantage Shopping").Sync
'validate new user name on top menu
Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("New_User_Name").Check CheckPoint("Confirm New User")
'Browser("Advantage Shopping").Back

