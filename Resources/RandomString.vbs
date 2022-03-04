 

'VBScript source code
Randomize (timer)
 
'Declaration of all formats
'Note that a token contained within a second token (e.g. yy to yyyy) must be placed AFTER the containing token (yyyy must precede yy)
FormatArray = Array("#", "DAY", "MONTH", "dd", "mm", "yyyy", "yy", "NAME", "COLOR", "CAR", "DOMAIN")

'Definition of formats not appearing as a Case in GetRandStrForToken
Dim ValuesArray
       ValuesArray = _
              Array(_
              Array("DAY", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"),_
              Array("MONTH", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"),_
              Array("COLOR", "Red", "Yellow", "Blue", "Green"),_
              Array("NAME", "Adler", "Cooper", "Copeland", "Davis", "Dixon", "Duncan", "Easton", "Finley", "Gibbs", "Griffin", "Hendrix", "Anderson", "Hutton", "Jennings", "Jones", "Lennon", "Lennox", "Lincoln", "Marshall", "Mason", "Miller", "Nash", "Beckett", "Parker", "Penn", "Sawyer", "Shaw", "Smith", "Stone", "Sullivan", "Thompson", "Walker", "Wiley", "Brady", "Wilson", "Adair", "Addison", "Arden", "Ashley", "Avery", "Bailey", "Bardot", "Bellamy", "Blaine", "Carson", "Cameron", "Campbell", "Cassidy", "Delaney", "Ellis", "Emerson", "Everly", "Garcia", "Harlow", "Harper", "Carter", "Hepburn", "Kennedy", "Kim", "Langley", "Luna", "Madigan", "Marley", "McKenna", "Monroe", "Quinn", "Channing", "Riley", "Rose", "Rowan", "Sutton", "Taylor", "Peyton", "West", "Cohen", "Coleman"),_
              Array("DOMAIN", "testers.com", "automateqa.com", "autopilotqa.com", "dontdoitagain.com"),_
			  Array("CAR", "Ford", "Toyota", "Lexus", "Mazda")_
              )
 
'Generate a random value for a specific token
Function GetRandStrForToken(sToken)
    Select Case sToken
        Case "#"' Single digit
            GetRandStrForToken = CStr(Int(Rnd*10))
        Case "dd"' May (numaric)
            GetRandStrForToken = CStr (Int(Rnd*31 + 1))
        Case "mm"' Month (numeric)
            GetRandStrForToken = CStr (Int(Rnd*12 + 1))
        Case "yy"' Two digit Year
            GetRandStrForToken = CStr(Int(Rnd*10)) + CStr(Int(Rnd*10))
        Case "yyyy"' Four digit Year
            GetRandStrForToken = CStr (1950 + Int(Rnd * 100))
        Case Else ' Pick from the Values Array for other formats
            'LookUpArray
            For i = 0 to UBound(ValuesArray)
                If sToken = ValuesArray(i)(0) Then
                    GetRandStrForToken = ValuesArray(i)( 1 + Int( rnd*(UBound(ValuesArray(i))) ) )
                    Exit For
               End If
           Next
      End Select
End Function

'Parse the current token (if any)
Function GetNextToken (ByRef sFormat)
    For each sToken in FormatArray
         sTemp = Mid(sFormat, 1, Len(sToken))
         If sTemp = sToken Then
            GetNextToken = sToken
            sFormat = Mid(sFormat, Len(sToken) + 1)
            Exit Function
        End If
   Next
End Function


'Generate a random data given a format
Function GenerateRandData(ByVal Format)
 
    Dim nPos
    Dim nLength
 
    nLength = Len(Format)
 
    While nLength > 0
        'Anything inside a [] brackets is copied as is
        If Mid(Format, 1, 1) = "[" Then ' Find the closing brackets
            nPos = InStr(1, Format, "]", vbTextCompare)
            If nPos = 0 Then Exit Function
                
            GenerateRandData = GenerateRandData + Mid(Format, 2, nPos - 2)
            Format = Mid(Format, nPos + 1)
            nLength = Len(Format)
        Else
             'Search for a valid token
             sToken = GetNextToken(Format)
             If Not sToken = "" Then
                  GenerateRandData = GenerateRandData + GetRandStrForToken(sToken)
                  nLength = Len(Format)
             Else ' No token - just copy the current character
                  GenerateRandData = GenerateRandData + Mid(Format,1, 1)
                  If nLength = 1 Then
                      Exit Function
                  End If
                  Format = Mid(Format, 2)
                  nLength = Len(Format)
             End If
         End If
    Wend
End Function



'Usage
'msgbox GenerateRandData ("Today Is the first DAY in MONTH")
'msgbox GenerateRandData ("A Date in the format [dd/mm/yyyy] dd/mm/yyyy")
'msgbox GenerateRandData ("My name is NAME, I drive a COLOR CAR. you can reach me on +972-54-###-####")



  

'' SIG '' Begin signature block
'' SIG '' MIIiqAYJKoZIhvcNAQcCoIIimTCCIpUCAQExDzANBglg
'' SIG '' hkgBZQMEAgEFADB3BgorBgEEAYI3AgEEoGkwZzAyBgor
'' SIG '' BgEEAYI3AgEeMCQCAQEEEE7wKRaZJ7VNj+Ws4Q8X66sC
'' SIG '' AQACAQACAQACAQACAQAwMTANBglghkgBZQMEAgEFAAQg
'' SIG '' okm7AxIVli+miER8fGpRN6el9cZDduXjlFyL7z//AB2g
'' SIG '' ggsRMIIFFDCCA/ygAwIBAgIRAMxu5BPjFpouK0whihpc
'' SIG '' lXkwDQYJKoZIhvcNAQELBQAwfDELMAkGA1UEBhMCR0Ix
'' SIG '' GzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4G
'' SIG '' A1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBM
'' SIG '' aW1pdGVkMSQwIgYDVQQDExtTZWN0aWdvIFJTQSBDb2Rl
'' SIG '' IFNpZ25pbmcgQ0EwHhcNMjEwNTE0MDAwMDAwWhcNMjIw
'' SIG '' NTE0MjM1OTU5WjB7MQswCQYDVQQGEwJHQjESMBAGA1UE
'' SIG '' CAwJQmVya3NoaXJlMRAwDgYDVQQHDAdOZXdidXJ5MSIw
'' SIG '' IAYDVQQKDBlNaWNybyBGb2N1cyBHcm91cCBMaW1pdGVk
'' SIG '' MSIwIAYDVQQDDBlNaWNybyBGb2N1cyBHcm91cCBMaW1p
'' SIG '' dGVkMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
'' SIG '' AQEAnE01SFazItfHe7G2025HUjheXz0NzCjG/chpi6iT
'' SIG '' eC4l2inrhMFmRBav/1IbFzlTEEtIzBddtpgUq1m/fhag
'' SIG '' AHny7/UosEJx/8gP/5I9VU+wDry3ydAr1LqhIi4WL916
'' SIG '' b2f2p66VY8skEzYEZxVQVBeZs+EUYPxQVAA+RpZ7XOqJ
'' SIG '' KOTfX1N6u+1jrFJJ17DCgFVb8gGTdulKVN3+wGa+4d5p
'' SIG '' r8UivpjsJJLsBUyyHDfKPW7yltmRNid4zNM07vCydlAb
'' SIG '' CAgWR+nBmY+Hv/ZipZjNHVGd/ZlINYjDV54fTTPSHp7F
'' SIG '' MndxlxkXsATUXIwCAhdI2RHNKledYrF1biLuFQIDAQAB
'' SIG '' o4IBkDCCAYwwHwYDVR0jBBgwFoAUDuE6qFM6MdWKvsG7
'' SIG '' rWcaA4WtNA4wHQYDVR0OBBYEFIpHccY030sskoZUKzPb
'' SIG '' CDkKEZrwMA4GA1UdDwEB/wQEAwIHgDAMBgNVHRMBAf8E
'' SIG '' AjAAMBMGA1UdJQQMMAoGCCsGAQUFBwMDMBEGCWCGSAGG
'' SIG '' +EIBAQQEAwIEEDBKBgNVHSAEQzBBMDUGDCsGAQQBsjEB
'' SIG '' AgEDAjAlMCMGCCsGAQUFBwIBFhdodHRwczovL3NlY3Rp
'' SIG '' Z28uY29tL0NQUzAIBgZngQwBBAEwQwYDVR0fBDwwOjA4
'' SIG '' oDagNIYyaHR0cDovL2NybC5zZWN0aWdvLmNvbS9TZWN0
'' SIG '' aWdvUlNBQ29kZVNpZ25pbmdDQS5jcmwwcwYIKwYBBQUH
'' SIG '' AQEEZzBlMD4GCCsGAQUFBzAChjJodHRwOi8vY3J0LnNl
'' SIG '' Y3RpZ28uY29tL1NlY3RpZ29SU0FDb2RlU2lnbmluZ0NB
'' SIG '' LmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2Vj
'' SIG '' dGlnby5jb20wDQYJKoZIhvcNAQELBQADggEBAHnzYDru
'' SIG '' 3Jc1F7p5GvQlIvBKiu7zq9btmqzzB/6eHuCplAQRBoCy
'' SIG '' 9NRmEjsn1bAqX25SDoXAU5OAGzRWsrFa3iCWMu8dJBiI
'' SIG '' RJyBbdPRm5tPYDXsNMyNYE1o2p6mvmdYvItBvBVZFiGc
'' SIG '' I2dLeEjoAYHER8pzB3FcNP6ySmsokBz/Plkg2c3cgk4/
'' SIG '' 8uW8yl5HA0kB81t3ncCd1PN20jRt5GPRcEWINl9oo75W
'' SIG '' fThkOkBGOGAOMCxg3SeiIv9wgKJPKSuPzHyLMC7J2ysI
'' SIG '' MkBpE+zD0KeHL/q5RqwmXONY+j6vPONYbneywjBrRIoV
'' SIG '' CoFeXqNFaiJ7kKdGHpYgxAP9ZtMwggX1MIID3aADAgEC
'' SIG '' AhAdokgwb5smGNCC4JZ9M9NqMA0GCSqGSIb3DQEBDAUA
'' SIG '' MIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMKTmV3IEpl
'' SIG '' cnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNV
'' SIG '' BAoTFVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UE
'' SIG '' AxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0aW9uIEF1
'' SIG '' dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEy
'' SIG '' MzU5NTlaMHwxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJH
'' SIG '' cmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZv
'' SIG '' cmQxGDAWBgNVBAoTD1NlY3RpZ28gTGltaXRlZDEkMCIG
'' SIG '' A1UEAxMbU2VjdGlnbyBSU0EgQ29kZSBTaWduaW5nIENB
'' SIG '' MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
'' SIG '' hiKNMoV6GJ9J8JYvYwgeLdx8nxTP4ya2JWYpQIZURnQx
'' SIG '' YsUQ7bKHJ6aZy5UwwFb1pHXGqQ5QYqVRkRBq4Etirv3w
'' SIG '' +Bisp//uLjMg+gwZiahse60Aw2Gh3GllbR9uJ5bXl1GG
'' SIG '' pvQn5Xxqi5UeW2DVftcWkpwAL2j3l+1qcr44O2Pej79u
'' SIG '' TEFdEiAIWeg5zY/S1s8GtFcFtk6hPldrH5i8xGLWGwuN
'' SIG '' x2YbSp+dgcRyQLXiX+8LRf+jzhemLVWwt7C8VGqdvI1W
'' SIG '' U8bwunlQSSz3A7n+L2U18iLqLAevRtn5RhzcjHxxKPP+
'' SIG '' p8YU3VWRbooRDd8GJJV9D6ehfDrahjVh0wIDAQABo4IB
'' SIG '' ZDCCAWAwHwYDVR0jBBgwFoAUU3m/WqorSs9UgOHYm8Cd
'' SIG '' 8rIDZsswHQYDVR0OBBYEFA7hOqhTOjHVir7Bu61nGgOF
'' SIG '' rTQOMA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAG
'' SIG '' AQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMDBggrBgEF
'' SIG '' BQcDCDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkw
'' SIG '' RzBFoEOgQYY/aHR0cDovL2NybC51c2VydHJ1c3QuY29t
'' SIG '' L1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3Jp
'' SIG '' dHkuY3JsMHYGCCsGAQUFBwEBBGowaDA/BggrBgEFBQcw
'' SIG '' AoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJU
'' SIG '' cnVzdFJTQUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzAB
'' SIG '' hhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0GCSqG
'' SIG '' SIb3DQEBDAUAA4ICAQBNY1DtRzRKYaTb3moqjJvxAAAe
'' SIG '' HWJ7Otcywvaz4GOz+2EAiJobbRAHBE++uOqJeCLrD0bs
'' SIG '' 80ZeQEaJEvQLd1qcKkE6/Nb06+f3FZUzw6GDKLfeL+SU
'' SIG '' 94Uzgy1KQEi/msJPSrGPJPSzgTfTt2SwpiNqWWhSQl//
'' SIG '' BOvhdGV5CPWpk95rcUCZlrp48bnI4sMIFrGrY1rIFYBt
'' SIG '' dF5KdX6luMNstc/fSnmHXMdATWM19jDTz7UKDgsEf6BL
'' SIG '' rrujpdCEAJM+U100pQA1aWy+nyAlEA0Z+1CQYb45j3qO
'' SIG '' TfafDh7+B1ESZoMmGUiVzkrJwX/zOgWb+W/fiH/AI57S
'' SIG '' HkN6RTHBnE2p8FmyWRnoao0pBAJ3fEtLzXC+OrJVWng+
'' SIG '' vLtvAxAldxU0ivk2zEOS5LpP8WKTKCVXKftRGcehJUBq
'' SIG '' hFfGsp2xvBwK2nxnfn0u6ShMGH7EezFBcZpLKewLPVdQ
'' SIG '' 0srd/Z4FUeVEeN0B3rF1mA1UJP3wTuPi+IO9crrLPTru
'' SIG '' 8F4XkmhtyGH5pvEqCgulufSe7pgyBYWe6/mDKdPGLH29
'' SIG '' OncuizdCoGqC7TtKqpQQpOEN+BfFtlp5MxiS47V1+KHp
'' SIG '' jgolHuQe8Z9ahyP/n6RRnvs5gBHN27XEp6iAb+VT1ODj
'' SIG '' osLSWxr6MiYtaldwHDykWC6j81tLB9wyWfOHpxptWDGC
'' SIG '' Fu8wghbrAgEBMIGRMHwxCzAJBgNVBAYTAkdCMRswGQYD
'' SIG '' VQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcT
'' SIG '' B1NhbGZvcmQxGDAWBgNVBAoTD1NlY3RpZ28gTGltaXRl
'' SIG '' ZDEkMCIGA1UEAxMbU2VjdGlnbyBSU0EgQ29kZSBTaWdu
'' SIG '' aW5nIENBAhEAzG7kE+MWmi4rTCGKGlyVeTANBglghkgB
'' SIG '' ZQMEAgEFAKB8MBAGCisGAQQBgjcCAQwxAjAAMBkGCSqG
'' SIG '' SIb3DQEJAzEMBgorBgEEAYI3AgEEMBwGCisGAQQBgjcC
'' SIG '' AQsxDjAMBgorBgEEAYI3AgEVMC8GCSqGSIb3DQEJBDEi
'' SIG '' BCBeduCKVaLHSbF7ZbAFrI/Hd2x3oy1fUSFeiOqgG3dt
'' SIG '' xDANBgkqhkiG9w0BAQEFAASCAQCFlXXWtap1+HFOy0nD
'' SIG '' chjzX9bdEkKJLfTrnRGSTGOdxAVu5b43eLgdXlekrg5R
'' SIG '' rdxPlROX3EKigw758zYjXKIt55lsTHLNY8W8i82hu78C
'' SIG '' 3/IjfZZiJV5wDX+d/6+UCaYUsufuKJfGub2hdqSKrKj5
'' SIG '' 82p8cu7s1aWZLw6l2dwmpPT+rtv3Waz+/WkuU02ccM9z
'' SIG '' SE87TUgHTTxyU58NW8hPN2Pyjc+y5NZbUV3BKngmLPkz
'' SIG '' yn8WNi2I9UIQmw6NqFImYBhnfTvv7nvtxmdJIDEWA+Xc
'' SIG '' eM77dtV98yhFnqmqlw1THYzKs3p92hlVgFCuSW1OBH6R
'' SIG '' ndFP9Sj921lUbEp7oYIUsDCCFKwGCisGAQQBgjcDAwEx
'' SIG '' ghScMIIUmAYJKoZIhvcNAQcCoIIUiTCCFIUCAQMxDzAN
'' SIG '' BglghkgBZQMEAgEFADBwBgsqhkiG9w0BCRABBKBhBF8w
'' SIG '' XQIBAQYKYIZIAYb6bAoDBTAxMA0GCWCGSAFlAwQCAQUA
'' SIG '' BCDpizg3jgBaceCIEz7/67nLxkVWL7+XnO2ofovLDB4q
'' SIG '' 1gIIQygpkSFl0PEYDzIwMjEwOTAyMTMxOTM1WqCCD1Uw
'' SIG '' ggQqMIIDEqADAgECAgQ4Y974MA0GCSqGSIb3DQEBBQUA
'' SIG '' MIG0MRQwEgYDVQQKEwtFbnRydXN0Lm5ldDFAMD4GA1UE
'' SIG '' CxQ3d3d3LmVudHJ1c3QubmV0L0NQU18yMDQ4IGluY29y
'' SIG '' cC4gYnkgcmVmLiAobGltaXRzIGxpYWIuKTElMCMGA1UE
'' SIG '' CxMcKGMpIDE5OTkgRW50cnVzdC5uZXQgTGltaXRlZDEz
'' SIG '' MDEGA1UEAxMqRW50cnVzdC5uZXQgQ2VydGlmaWNhdGlv
'' SIG '' biBBdXRob3JpdHkgKDIwNDgpMB4XDTk5MTIyNDE3NTA1
'' SIG '' MVoXDTI5MDcyNDE0MTUxMlowgbQxFDASBgNVBAoTC0Vu
'' SIG '' dHJ1c3QubmV0MUAwPgYDVQQLFDd3d3cuZW50cnVzdC5u
'' SIG '' ZXQvQ1BTXzIwNDggaW5jb3JwLiBieSByZWYuIChsaW1p
'' SIG '' dHMgbGlhYi4pMSUwIwYDVQQLExwoYykgMTk5OSBFbnRy
'' SIG '' dXN0Lm5ldCBMaW1pdGVkMTMwMQYDVQQDEypFbnRydXN0
'' SIG '' Lm5ldCBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eSAoMjA0
'' SIG '' OCkwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
'' SIG '' AQCtTUupEoay6qMgBxUWZCorS9G/C0pNju2AdqVnt3hA
'' SIG '' wHNCyGjA21Mr3V64dpg1k4sanXwTOg4fW7cez+UkFB6x
'' SIG '' gamNfbjMa0sD8QIM3KulQCQAf3SUoZ0IKbOIC/WHd51V
'' SIG '' zeTDftdqZKuFFIaVW5cyUG89yLpmDOP8vbhJwXaJSRn9
'' SIG '' wKi9iaNnL8afvHEZYLgt6SzJkHZme5Tir3jWZVNdPNac
'' SIG '' ss8pA/kvpFCy1EjOBTJViv2yZEwO5JgHddt/37kIVWCF
'' SIG '' MCn5e0ikaYbjNT8ehl16ehW97wCOFSJUFwCQJpO8Dklo
'' SIG '' kb/4R9OdlULBDk3fbybPwxghYmZDcNbVwAfhAgMBAAGj
'' SIG '' QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTAD
'' SIG '' AQH/MB0GA1UdDgQWBBRV5IHREYC+2Im5CKMx+aEkCRa5
'' SIG '' cDANBgkqhkiG9w0BAQUFAAOCAQEAO5uPVpsw51OZfHp5
'' SIG '' p02X1xmVkPsGH8ozfEZjj5ZmJPpAGyEnyuZyc/JP/jGZ
'' SIG '' /cgMTGhTxoCCE5j6tq3aXT3xzm72FRGUggzuP5WvEasP
'' SIG '' 1y/eHwOPVyweybuaGkSV6xhPph/NfVcQL5sECVqEtW7Y
'' SIG '' HTrh1p7RbHleeRwUxePQTJM7ZTzt3z2+puWVGsO1GcO9
'' SIG '' Xlu7/yPvaBnLEpMnXAMtbzDQHrYarN5a99GqqCem/nmB
'' SIG '' xHmZM1e6ErCp4EJsk8pW3v5thAsIi36N6teYIcbz5zx5
'' SIG '' L16c0UwVjeHsIjfMmkMLl9yAkI2zZ5tvSAgVVs+/8St8
'' SIG '' Xpp26VmQxXyDNRFlUTCCBRMwggP7oAMCAQICDFjaE/8A
'' SIG '' AAAAUc4N9zANBgkqhkiG9w0BAQsFADCBtDEUMBIGA1UE
'' SIG '' ChMLRW50cnVzdC5uZXQxQDA+BgNVBAsUN3d3dy5lbnRy
'' SIG '' dXN0Lm5ldC9DUFNfMjA0OCBpbmNvcnAuIGJ5IHJlZi4g
'' SIG '' KGxpbWl0cyBsaWFiLikxJTAjBgNVBAsTHChjKSAxOTk5
'' SIG '' IEVudHJ1c3QubmV0IExpbWl0ZWQxMzAxBgNVBAMTKkVu
'' SIG '' dHJ1c3QubmV0IENlcnRpZmljYXRpb24gQXV0aG9yaXR5
'' SIG '' ICgyMDQ4KTAeFw0xNTA3MjIxOTAyNTRaFw0yOTA2MjIx
'' SIG '' OTMyNTRaMIGyMQswCQYDVQQGEwJVUzEWMBQGA1UEChMN
'' SIG '' RW50cnVzdCwgSW5jLjEoMCYGA1UECxMfU2VlIHd3dy5l
'' SIG '' bnRydXN0Lm5ldC9sZWdhbC10ZXJtczE5MDcGA1UECxMw
'' SIG '' KGMpIDIwMTUgRW50cnVzdCwgSW5jLiAtIGZvciBhdXRo
'' SIG '' b3JpemVkIHVzZSBvbmx5MSYwJAYDVQQDEx1FbnRydXN0
'' SIG '' IFRpbWVzdGFtcGluZyBDQSAtIFRTMTCCASIwDQYJKoZI
'' SIG '' hvcNAQEBBQADggEPADCCAQoCggEBANkj5hSk6HxLhXFY
'' SIG '' +/iB5nKLXUbDiAAfONCK4dZuVjDlr9pkUH3CEzn7vWa0
'' SIG '' 2oT7g9AoH8t26GBQaZvzzk8T4sE+wd8SyzKj+F5EIg7M
'' SIG '' OumNSblgdMjeVD1BXkNfKEapprfKECsivFtNW4wXZRKG
'' SIG '' /Sx31cWgjMrCg+BHV3zncK5iRScxGArUwKQYVVL3YMYE
'' SIG '' S7PdaDJuEB80EbgSeGTx7qng9+OxIo80WmXLivThRVB0
'' SIG '' 35OXpjTm0Ew7nzdJUqdTTp8uZ1ztlvylv3RRiOOqjr3Z
'' SIG '' sS9fUDAW9FFgImuZy//hVDu5+0Q4pQg5I5tpR/o8xNDn
'' SIG '' qt9GsuzyihmsKbI4lXUCAwEAAaOCASMwggEfMBIGA1Ud
'' SIG '' EwEB/wQIMAYBAf8CAQAwDgYDVR0PAQH/BAQDAgEGMDsG
'' SIG '' A1UdIAQ0MDIwMAYEVR0gADAoMCYGCCsGAQUFBwIBFhpo
'' SIG '' dHRwOi8vd3d3LmVudHJ1c3QubmV0L3JwYTAzBggrBgEF
'' SIG '' BQcBAQQnMCUwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3Nw
'' SIG '' LmVudHJ1c3QubmV0MDIGA1UdHwQrMCkwJ6AloCOGIWh0
'' SIG '' dHA6Ly9jcmwuZW50cnVzdC5uZXQvMjA0OGNhLmNybDAT
'' SIG '' BgNVHSUEDDAKBggrBgEFBQcDCDAdBgNVHQ4EFgQUw8Jx
'' SIG '' 0nvXaAWuOzmbNCUMYgPHV2gwHwYDVR0jBBgwFoAUVeSB
'' SIG '' 0RGAvtiJuQijMfmhJAkWuXAwDQYJKoZIhvcNAQELBQAD
'' SIG '' ggEBAB0k55p0W6pw/LEOMUXXLAB/ZjoroJo0qqxjbYn5
'' SIG '' n98Nd/0kI/xPnLdvj/P0H7bB/dYcxIyIZsFjjbpXd9O4
'' SIG '' Gh7IUa3MYDYah2oo6hFl3sw8LIx0t+hQQ9PMKOgVbBEq
'' SIG '' nxSVKckFV7VnNug8qYPvQcEhFtN+9y0RR2Z2YIISaYx2
'' SIG '' VXMP3y9LXelsI/gH9rV91mlFnFh9YS78eEtDTomRRkQs
'' SIG '' oFOoRaH2Fli7kRPyS8XfC8Dnril6vUWz53Aw5zSO63r2
'' SIG '' 07XR3msTmUazi9JNk3W18W+/3AAowiW/vOejZTTsPw0d
'' SIG '' l4z6qogipBg12wWOduMQyCmPY9CurBjZ2sSfURIwggYM
'' SIG '' MIIE9KADAgECAhEAjc4V86eUxYcAAAAAVZIz9DANBgkq
'' SIG '' hkiG9w0BAQsFADCBsjELMAkGA1UEBhMCVVMxFjAUBgNV
'' SIG '' BAoTDUVudHJ1c3QsIEluYy4xKDAmBgNVBAsTH1NlZSB3
'' SIG '' d3cuZW50cnVzdC5uZXQvbGVnYWwtdGVybXMxOTA3BgNV
'' SIG '' BAsTMChjKSAyMDE1IEVudHJ1c3QsIEluYy4gLSBmb3Ig
'' SIG '' YXV0aG9yaXplZCB1c2Ugb25seTEmMCQGA1UEAxMdRW50
'' SIG '' cnVzdCBUaW1lc3RhbXBpbmcgQ0EgLSBUUzEwHhcNMjAw
'' SIG '' NzIyMTUzMzI5WhcNMzAxMjI5MTYyOTIzWjB1MQswCQYD
'' SIG '' VQQGEwJDQTEQMA4GA1UECBMHT250YXJpbzEPMA0GA1UE
'' SIG '' BxMGT3R0YXdhMRYwFAYDVQQKEw1FbnRydXN0LCBJbmMu
'' SIG '' MSswKQYDVQQDEyJFbnRydXN0IFRpbWVzdGFtcCBBdXRo
'' SIG '' b3JpdHkgLSBUU0ExMIICIjANBgkqhkiG9w0BAQEFAAOC
'' SIG '' Ag8AMIICCgKCAgEAyj7sJGLh9/7f0TapN2bWeRcUlEIA
'' SIG '' pIaXuCeM60+p99Ou4qswBAgoX5tTpoeKLd0CUl+1uOW2
'' SIG '' UPCcqxLB7hpWeIpuRD+pio/X21PZxkfIDNxGVwBnBhca
'' SIG '' hbdAqq92B+eQX5SS1a7W1815ocU1K0SEX0kc1XO4gY1y
'' SIG '' lAJqqc9Wkqo2lMNQyVaXiFzhf1/9+98Ujj2rJA32e49q
'' SIG '' +m4e+pW9fZD45EIUv1VeBFSTMUP3w+fCBRForEBpxyM3
'' SIG '' 7FpMKcnfNbN+SU7GetvOwiWUnjc/iOwkTTmPf+8Va1RM
'' SIG '' cfENIXxaddCHU4mgW+Ad+5wHwKihtCLQYqTHF383Ts4t
'' SIG '' Oljj5fAmhk1CB5++o+IZomtypUa/y2RbJchF9N7oPLb9
'' SIG '' nPOg74NBfDZwkMNSYrDHfz175ZaHpVb/DupJBd+03RNv
'' SIG '' RdObyCN5KjCZnZnczM2lLoFTUiLy0D2iN1KRkUZw1sVL
'' SIG '' Bf9O9NxkBpf+fJCGJ6+fNFVIiasiwHUHjCHZBNMcp+pt
'' SIG '' pMlSK+LEAokwXuebMeY5Za1xre9nW9yjJO0N5uKpejoY
'' SIG '' Vd7wRi40TRpNmIANTtFshXW4A8IA1SJKJtGO3e211CfW
'' SIG '' OnxnaYbXVD+Xz2S+katutp0ZEHm1lw700YXJ5K7HwLSq
'' SIG '' B8QfwTpXn80OpnrlFYayqvSikyzPjPdR+t2M0EkCAwEA
'' SIG '' AaOCAVcwggFTMA4GA1UdDwEB/wQEAwIHgDAWBgNVHSUB
'' SIG '' Af8EDDAKBggrBgEFBQcDCDBBBgNVHSAEOjA4MDYGCmCG
'' SIG '' SAGG+mwKAwUwKDAmBggrBgEFBQcCARYaaHR0cDovL3d3
'' SIG '' dy5lbnRydXN0Lm5ldC9ycGEwCQYDVR0TBAIwADBoBggr
'' SIG '' BgEFBQcBAQRcMFowIwYIKwYBBQUHMAGGF2h0dHA6Ly9v
'' SIG '' Y3NwLmVudHJ1c3QubmV0MDMGCCsGAQUFBzAChidodHRw
'' SIG '' Oi8vYWlhLmVudHJ1c3QubmV0L3RzMS1jaGFpbjI1Ni5j
'' SIG '' ZXIwMQYDVR0fBCowKDAmoCSgIoYgaHR0cDovL2NybC5l
'' SIG '' bnRydXN0Lm5ldC90czFjYS5jcmwwHwYDVR0jBBgwFoAU
'' SIG '' w8Jx0nvXaAWuOzmbNCUMYgPHV2gwHQYDVR0OBBYEFC1W
'' SIG '' gO+O90pDHEOhtd7Z16iqayYoMA0GCSqGSIb3DQEBCwUA
'' SIG '' A4IBAQBYS87Y/oHXUdjHXI2S0k6VHoWGQ+3gGuaaIUIz
'' SIG '' XeORvvhQfHaMJalB1ISZ6OiitpmXaKIgvTKoqil8CnYa
'' SIG '' n8hVjqvTe9Tjfll+knA5D+32L/NP/3Rc8+cwNECjEaNr
'' SIG '' cqQyEQV8/ZGLR6hXNlLH+rVFhNGyPkLlFl7dA9Op/T1w
'' SIG '' Z3raE+CEgmc4YFbDrbCI4Qo3fmKBBrsjBO9YoCOo0Qlj
'' SIG '' MM3ZGTj061p3WL5fv+uULf8vBDBkEI8+WVYuOjZPDjyW
'' SIG '' D4/J6n5/STIfo19u2iKf19kXOVneSBd6AktYcf+3DC2h
'' SIG '' 8GejEdz3ybzZHstsDBUneEgWayzxrZe4dWy7lcOOMYIE
'' SIG '' ojCCBJ4CAQEwgcgwgbIxCzAJBgNVBAYTAlVTMRYwFAYD
'' SIG '' VQQKEw1FbnRydXN0LCBJbmMuMSgwJgYDVQQLEx9TZWUg
'' SIG '' d3d3LmVudHJ1c3QubmV0L2xlZ2FsLXRlcm1zMTkwNwYD
'' SIG '' VQQLEzAoYykgMjAxNSBFbnRydXN0LCBJbmMuIC0gZm9y
'' SIG '' IGF1dGhvcml6ZWQgdXNlIG9ubHkxJjAkBgNVBAMTHUVu
'' SIG '' dHJ1c3QgVGltZXN0YW1waW5nIENBIC0gVFMxAhEAjc4V
'' SIG '' 86eUxYcAAAAAVZIz9DANBglghkgBZQMEAgEFAKCCAaow
'' SIG '' GgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMBwGCSqG
'' SIG '' SIb3DQEJBTEPFw0yMTA5MDIxMzE5MzVaMC0GCSqGSIb3
'' SIG '' DQEJNDEgMB4wDQYJYIZIAWUDBAIBBQChDQYJKoZIhvcN
'' SIG '' AQELBQAwLwYJKoZIhvcNAQkEMSIEIMMwL0ivh+iQLpZo
'' SIG '' TLaAGnpPo+GrfVb+M5ZcsaidornYMIIBDAYLKoZIhvcN
'' SIG '' AQkQAi8xgfwwgfkwgfYwgfMEIJUKJv3HwCAY6feRqVw4
'' SIG '' 8m7vPaQyZ8qwzRWlVa9jEHLJMIHOMIG4pIG1MIGyMQsw
'' SIG '' CQYDVQQGEwJVUzEWMBQGA1UEChMNRW50cnVzdCwgSW5j
'' SIG '' LjEoMCYGA1UECxMfU2VlIHd3dy5lbnRydXN0Lm5ldC9s
'' SIG '' ZWdhbC10ZXJtczE5MDcGA1UECxMwKGMpIDIwMTUgRW50
'' SIG '' cnVzdCwgSW5jLiAtIGZvciBhdXRob3JpemVkIHVzZSBv
'' SIG '' bmx5MSYwJAYDVQQDEx1FbnRydXN0IFRpbWVzdGFtcGlu
'' SIG '' ZyBDQSAtIFRTMQIRAI3OFfOnlMWHAAAAAFWSM/QwDQYJ
'' SIG '' KoZIhvcNAQELBQAEggIAOMh7fWucrrKGyoNr2nevG/bC
'' SIG '' tIbBS+H6MSaBCwzYQN73YRqmJcwCJbrqqwy2sUpxIto6
'' SIG '' 40ciNKDP7SsXpRnw6dsZeeHJLX5Akc3sq1jOr7wKYGxR
'' SIG '' 6AzbA8kqz5MlV42vLQG2kVIAtcC+T0u+rLBZdAaDHAr3
'' SIG '' fyesLBE7TW2yvQCgn7iiKGftMqKddni4S0FHr+VKdkEb
'' SIG '' gVmqF78dKAeNfrESncYMwTKyhhkObPzdjrED27YM0qK3
'' SIG '' ygqAoysiIMgJo7ZRtellX0rmdBDngtwwDfYGsGmmAHuR
'' SIG '' WIvaLfssf/hnHUxmCsdDNBew8PT76NOrCApqXX5QdOZr
'' SIG '' 7kTVpilHUmts4GxZMCVGWZPRpHLuXip+ITkja+8wfRa5
'' SIG '' lZops2YSYk3qnE3NfGtXhbAu62Nkuk4QJRI6eeZjiNyq
'' SIG '' b67Y8H/BXNZSYM3NXE4ncSgbrw0P1UbzYAaF8v7UJySv
'' SIG '' naCw2uxOyvoO5ddb4F1bCte8ETlXEkpXr/IsQsEY72qP
'' SIG '' MxcQGd5ABchQu2O7KgGGL053lfvjZJVCIqhb4YdNDXga
'' SIG '' YsSdxcWESVO66wnZXXzot9pCl3ul43bIDhP9n0HY8Rnk
'' SIG '' aorIxAtp0+jKvcLg1H1AIYAbwPYyg0tcD+gAsYUxaM70
'' SIG '' tdvG8xQRrK8OZqEzJsq/z6a/xQ0O2vT8IX3VuewMUIk=
'' SIG '' End signature block
