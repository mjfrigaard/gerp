## code to prepare `date_patterns` dataset goes here

date_patterns <- list(

'YYYY-MM-DD' = "([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))",

'month DD, YYYYY' = "january\\s\\d{2},\\s\\d{4}|february\\s\\d{2},\\s\\d{4}|march\\s\\d{2},\\s\\d{4}|april\\s\\d{2},\\s\\d{4}|may\\s\\d{2},\\s\\d{4}|june\\s\\d{2},\\s\\d{4}|july\\s\\d{2},\\s\\d{4}|august\\s\\d{2},\\s\\d{4}|september\\s\\d{2},\\s\\d{4}|october\\s\\d{2},\\s\\d{4}|november\\s\\d{2},\\s\\d{4}|december\\s\\d{2},\\s\\d{4}",

'any MM DD YYYY' = "^(?:(?:31(\\/|-|\\.)(?:0?[13578]|1[02]))\\1|(?:(?:29|30)(\\/|-|\\.)(?:0?[1,3-9]|1[0-2])\\2))(?:(?:1[6-9]|[2-9]\\d)?\\d{2})$|^(?:29(\\/|-|\\.)0?2\\3(?:(?:(?:1[6-9]|[2-9]\\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\\d|2[0-8])(\\/|-|\\.)(?:(?:0?[1-9])|(?:1[0-2]))\\4(?:(?:1[6-9]|[2-9]\\d)?\\d{2})$",

'month prefix' = "^january|^february|^march|^april|^may|^june|^july|^august|^september|^october|^november|^december|^jan|^feb|^febr|^mar|^apr|^jun|^jul|^aug|^sept|^sep|^oct|^nov|^dec|^jan\\.|^feb\\.|^febr\\.|^mar\\.|^apr\\.|^jun\\.|^jul\\.|^aug\\.|^sept\\.|^sep\\.|^oct\\.|^nov\\.|^dec\\.",

'YYYY prefix' = "(^\\s*\\d{4}[/.-])|(^\\s*\\d{4})",

'any month' = "(?:january|february|march|april|may|june|july|august|september|october|november|december|jan|feb|febr|mar|apr|jun|jul|aug|sept|sep|oct|nov|dec|jan\\.|feb\\.|febr\\.|mar\\.|apr\\.|jun\\.|jul\\.|aug\\.|sept\\.|sep\\.|oct\\.|nov\\.|dec\\.)",

'any YYYY' = "(?:\\d{4}[/.-]|[/.-]\\d{4}|\\s\\d{4}|^\\d{4})"

)
usethis::use_data(date_patterns, overwrite = TRUE)
