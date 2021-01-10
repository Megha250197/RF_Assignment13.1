*** Variables ***

${url_books} =  https://www.indiabookstore.net/ 
${brows} =  gc
${Expected_homePage} =  Buy books online in India from online bookstores
${Expected_category} =  Crime, Thriller & Mystery
${Expected_Book_Name} =  Revenge of the Naked Princess:...
${Expected_Book_Category} =  Thriller
${Thriller} =  xpath=//*[@id="leftNavContainer"]/ul/li[8]/ul/li[2]

${Thriller} =  xpath=//a[text()='Thriller (0)']//following::li[2]
${Expected_Book_Detailed_Name} = 
                    Revenge of the Naked Princess: A Dark Tale on Forced Conversions
