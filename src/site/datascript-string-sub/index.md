---
title: DataScript: string.sub
layout: default
---
**Function** **string.sub(source, begin, [end])** **Description** Extracts part of a string from a source string.  Characters are count starting with a 1 for the first character, 2 for the second, etc.  Characters may also be negative.  So -1 is the last character of the source string, -2 is the second to last, etc. **Events** All **Parameter** ***source***is the string to be inspected

***begin***is the first character for the desired result

***end***is the final character for the desired result.  If no end it specified, the new string will be from the begin till the last character. **Returns** A portion of the original string.  May return the entire original string, or *nil* if no match **Example 1** Extract the 2nd through the 4th characters.
var = "abcdef" avi.vs.log(string.sub(var, 2, 4))

1

2 var  =  "abcdef"

avi . vs . log ( string . sub ( var ,  2 ,  4 ) )
  DataScript Log: [string "Test-Rule"]:2: **bcd** **Example 2** Extract characters from the string, starting from the 99th to last till the 2nd to last.
var = "abcdef" avi.vs.log(string.sub(var, -99, 2))

1

2 var  =  "abcdef"

avi . vs . log ( string . sub ( var ,  - 99 ,  2 ) )
  DataScript Log: [string "Test-Rule"]:2: **abcde** **Example 3** Update a variable with the altered string.  A path always starts with a '/', which is removed prior to rule evaluation.
path = avi.http.get_path() path = string.sub(path, 2) if path == "index.html" ...

1

2
3 path  =  avi . http . get_path ( )

path  =  string . sub ( path ,  2 )
if  path  ==  "index.html"  . . . **Example 4** The following example can be used to prevent a Shell Shock attack. This attack embeds a client header which starts with () characters.
headers = avi.http.get_header()                -- get all the HTTP headers for key,val in pairs(headers) do               -- iterate through all headers    if /#val > 2 and string.sub(val, 1, 2) == "()" then       avi.http.close_conn()                    -- close the TCP connection    end end

1

2
3

4
5

6 headers  =  avi . http . get_header ( )                 -- get all the HTTP headers

for  key , val in  pairs ( headers )  do                -- iterate through all headers
    if  /# val  >  2  and  string . sub ( val ,  1 ,  2 )  ==  "()"  then

       avi . http . close_conn ( )                     -- close the TCP connection
    end

end