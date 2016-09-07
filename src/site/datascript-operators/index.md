---
title: DataScript: Operators
layout: default
---
Operators compare or contrast sets of data, and will return as *true* or *false*.  DataScripts rely on the Lua scripting language for the syntax and supported usage of arithmetic, relational and logical operators.  DataScripts are case sensitive when evaluating strings, so “a” does not equal “A”.

 

### Arithmetic Operators:

+                      -- Addition -                      -- Subtraction /*                      -- Multiplication /                      -- Division

 

### Relational Operators:

>                     -- Greater than <                     -- Less than >=                    -- Greater than or equal <=                    -- Less than or equal ==                    -- Equal ~=                    -- Not equal

If the port does not equal 443, then redirect the client to HTTPS.

if avi.vs.port() ~= <strong>"</strong>443<strong>"</strong> then    avi.http.redirect(<strong>"</strong>https://<strong>"</strong> .. avi.vs.host() .. avi.http.get_uri()) end

1

2
3 if  avi . vs . port ( )  ~ =  < strong > "</strong>443<strong>" < / strong >  then

    avi . http . redirect ( < strong > "</strong>https://<strong>" < / strong >  . .  avi . vs . host ( )  . .  avi . http . get_uri ( ) )
end

 

### Logical Operators

and or not string.find          -- Search for a string within another string.

 