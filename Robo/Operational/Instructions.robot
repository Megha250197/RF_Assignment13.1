*** Settings ***
Library  SeleniumLibrary
Library  Collections

Resource  ../Operational/instructions.robot
Resource  ../Operational/locatorVariables.robot

*** Keywords ***
Open India Bookstore
    Open Browser  ${url_books}  ${brows}   
    Maximize Browser Window
    sleep  4s
    Verify WebPage title  ${Expected_homePage}
    Capture Page Screenshot
    Execute Javascript  window.scrollTo(0, 500)
    Log to Console  Step1

Navigate to Category "Crime, Thriller & Mystery"
     ${category_count} =  Get Element Count  xpath=//*[@id="leftNavContainer"]/ul/li
    #Log to Console  ${category_count}
    sleep  3s
    FOR  ${i}  IN RANGE  1  ${category_count}
        ${dynamic_categ_name} =  Get Text  xpath=//*[@id="leftNavContainer"]/ul/li[${i}]/a
        Scroll Element Into View  xpath=//*[@id="leftNavContainer"]/ul/li[${i}]/a
        #Log to Console  ${dynamic_categ_name}
        Exit For Loop If  "${dynamic_categ_name}" == "${Expected_category}"
    END
    Set Test Variable  ${static_categ_name}  xpath=//*[@id="leftNavContainer"]/ul/li[${i}]/a
    Log to Console  Step2
    

Click on "Thriller" Sub Section
    Mouse Over  ${static_categ_name}
    sleep  1s
    Mouse Over  ${Thriller}
    sleep  3s
    Verify WebPage title  Thriller
    Click Element  ${Thriller}
    sleep  1s
    Verify WebPage title  ${Expected_Book_Category}
    Capture Page Screenshot
    Log to Console  Step3


Search for the book title 'Revenge of the Naked Princess:...' in the Booklist
    ${buk_list} =  Get Element Count  xpath=//div[@class='col-md-9']/div
    #Log to Console  ${buk_list}
    FOR  ${j}  IN RANGE  2  ${buk_list}
    ${buk_names} =  Get Text  xpath=//div[@class='col-md-9']/div[${j}]/a/div[3]
    #Log to Console  ${buk_names}
    Exit For Loop If  "${buk_names}" == "${Expected_Book_Name}"
    END
    Set Test Variable  ${exact_buk_elem}  xpath=//div[@class='col-md-9']/div[${j}]/a/div[3]
    Log to Console  Step4

Go to Expected Book details page
    sleep  5s
    Click Element  ${exact_buk_elem}
    Log to Console  Step5
    


Verify User navigated to the expected book details
    Verify WebPage title  ${Expected_Book_Detailed_Name}
    Capture Page Screenshot
    Log to Console  Step6

Verify WebPage title
    [Arguments]  ${title_name}
    Wait Until Page Contains  ${title_name}
    Capture Page Screenshot
    Log to Console  ${title_name}
    Log to Console  Step7

Click on Amazon
    Click Element   xpath=//a[text()='Rs.100 @Amazon']
    Capture Page Screenshot

Switch to new window
    Select Window    NEW      #comment: It will automatically move to new window
    ${newwindow}=    Get Title
    Verify webpage Title    ${newwindow}
    Capture Page Screenshot
     Log To Console   Step8     # to verify the name in console
    

Click on Add to cart Button
    Click Element   xpath=//input[@name='submit.add-to-cart']
    Sleep    4s
    Capture Page Screenshot
    Click Element   xpath=//a[@id='hlb-view-cart-announce']
    Log to Console  Step9


Verify the book in cart page
    ${Verify_book-in_cart}=    Get Text   xpath=//span[@class='a-size-medium sc-product-title a-text-bold']
    Page Should Contain    ${Verify_book-in_cart}
    Capture Page Screenshot
    Log to Console  ${Verify_book-in_cart}
    Log to Console      Pass!!!
    
Close the Browser
    Close Browser
    