'login as Admin
Browser("Dashboard").Page("Software Quality Assurance").Link("Log in").Click @@ script infofile_;_ZIP::ssf65.xml_;_
Browser("Dashboard").Page("Software Quality Assurance").WebEdit("username").Set "anastasiachernovskaya" @@ script infofile_;_ZIP::ssf67.xml_;_
Browser("Dashboard").Page("Software Quality Assurance").WebEdit("password").SetSecure "61dbdeb22fd8c68cf9041882f6dc24787e8de84563524eeda20b8a3b9e6a8c34" @@ script infofile_;_ZIP::ssf68.xml_;_
Browser("Dashboard").Page("Software Quality Assurance").WebButton("Log in").Click @@ script infofile_;_ZIP::ssf69.xml_;_
'validate loging in as Admin
Browser("Dashboard").Page("Dashboard").WebElement("Anastasia Chernovskaya").Check CheckPoint("Check Login as Admin") @@ script infofile_;_ZIP::ssf61.xml_;_
'navigate to create new user
Browser("Dashboard").Page("Dashboard").Link("Site administration").Click @@ script infofile_;_ZIP::ssf43.xml_;_
Browser("Dashboard").Page("SQA: Administration: Search").WebTabStrip("Site administration Users").Select "Users" @@ script infofile_;_ZIP::ssf44.xml_;_
Browser("Dashboard").Page("SQA: Administration: Search").Link("Add a new user").Click @@ script infofile_;_ZIP::ssf45.xml_;_
Browser("Dashboard").Page("SQA: Administration: Users:").WebEdit("1 1").Set "1 1" @@ script infofile_;_ZIP::ssf46.xml_;_

Dim rndUserName 'declare a variable
rndUserName = "ama" & RandomNumber(1000,9999) 'assign random user name value to a variable
DataTable("in_UserName") = rndUserName 'save the randomly generated value to a data table parameter
DataTable("in_EmailAddress", dtGlobalSheet) = rndUserName & "@" & GenerateRandData ("DOMAIN") 'use random username to create a user email value, save to data table parameter

'-------------------------------------------use function library------------------------------------------------------------------------

'generate random First Name using GenerateRandData() function
DataTable("in_FirstName") = GenerateRandData ("NAME") 'save to a data table parameter

'generate random Last Name using GenerateRandData() function
DataTable("in_LastName") = GenerateRandData ("NAME") 'save to a data table parameter

'----------------------------------------------------------------------------------------------------------------------------------------------
Browser("Dashboard").Page("SQA: Administration: Users:").WebEdit("username").Set DataTable("in_UserName") @@ script infofile_;_ZIP::ssf47.xml_;_
Browser("Dashboard").Page("SQA: Administration: Users:").Link("Click to enter text").Click @@ script infofile_;_ZIP::ssf48.xml_;_
Browser("Dashboard").Page("SQA: Administration: Users:").WebEdit("newpassword").Set DataTable("in_Password") @@ script infofile_;_ZIP::ssf49.xml_;_
Browser("Dashboard").Page("SQA: Administration: Users:").WebEdit("firstname").Set DataTable("in_FirstName") @@ script infofile_;_ZIP::ssf50.xml_;_
Browser("Dashboard").Page("SQA: Administration: Users:").WebEdit("lastname").Set DataTable("in_LastName") @@ script infofile_;_ZIP::sAmasf51.xml_;_
Browser("Dashboard").Page("SQA: Administration: Users:").WebEdit("email").Set DataTable("in_EmailAddress") @@ script infofile_;_ZIP::ssf52.xml_;_
Browser("Dashboard").Page("SQA: Administration: Users:").WebButton("Create user").Click
'search
Browser("Dashboard").Page("Confirm New User").WebEdit("email").Set DataTable("in_EmailAddress") @@ script infofile_;_ZIP::ssf54.xml_;_
Browser("Dashboard").Page("Confirm New User").WebButton("Add filter").Click @@ script infofile_;_ZIP::ssf55.xml_;_
'validate new user @@ script infofile_;_ZIP::ssf56.xml_;_
Browser("Dashboard").Page("Confirm New User").WebElement("New_User_Email").Check CheckPoint("Confirm New User")
'delete user
Browser("Dashboard").Page("Confirm New User").WebElement("Delete").Click @@ script infofile_;_ZIP::ssf57.xml_;_
Browser("Dashboard").Page("Confirm New User").WebButton("Delete").Click @@ script infofile_;_ZIP::ssf58.xml_;_
'change the Admin's role to Manager
Browser("Dashboard").Page("Confirm New User").WebButton("User menu").Click @@ script infofile_;_ZIP::ssf96.xml_;_
Browser("Dashboard").Page("Confirm New User").WebMenu("Anastasia Chernovskaya").Select "Switch role to..." @@ script infofile_;_ZIP::ssf97.xml_;_
Browser("Dashboard").Page("Switch role to...").WebButton("Manager").Click @@ script infofile_;_ZIP::ssf98.xml_;_
Browser("Dashboard").Page("Dashboard").WebElement("Manager").Output CheckPoint("Manager") @@ script infofile_;_ZIP::ssf99.xml_;_
Browser("Dashboard").Page("Dashboard").WebButton("User menu").Click @@ script infofile_;_ZIP::ssf100.xml_;_
Browser("Dashboard").Page("Dashboard").WebMenu("Anastasia ChernovskayaManager").Select "Return to my normal role"
'logout as Admin
Browser("Dashboard").Page("Confirm New User").Image("f2").Click @@ script infofile_;_ZIP::ssf59.xml_;_
Browser("Dashboard").Page("Confirm New User").WebMenu("Anastasia Chernovskaya").Select "Log out" @@ script infofile_;_ZIP::ssf60.xml_;_
