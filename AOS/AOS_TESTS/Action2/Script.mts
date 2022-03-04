'add item to a shopping cart
Browser("Advantage Shopping").Page("Advantage Shopping").Link("View Details").WaitProperty "visible", True, 20000 
Browser("Advantage Shopping").Page("Advantage Shopping").Link("View Details").Click
Browser("Advantage Shopping").Page("Advantage Shopping").WebButton("save_to_cart").Click
'checkout shopping cart
Browser("Advantage Shopping").Page("Advantage Shopping").Link("ShoppingCart").Click
Browser("Advantage Shopping").Page("Advantage Shopping").WebButton("check_out_btn").Click
Browser("Advantage Shopping").Page("Advantage Shopping").WebButton("next_btn").Click
Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("SafePay username").Click
Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("safepay_username").Set DataTable("in_Spuser", dtGlobalSheet)
Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("SafePay password").Click
Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("safepay_password").Set DataTable("in_SpPassword", dtGlobalSheet)
Browser("Advantage Shopping").Page("Advantage Shopping").WebButton("pay_now_btn_SAFEPAY").Click
'verify order created

Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("trackingNumberLabel").Output CheckPoint("trackingNumberLabel")
Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("orderNumberLabel").Output CheckPoint("orderNumberLabel")

