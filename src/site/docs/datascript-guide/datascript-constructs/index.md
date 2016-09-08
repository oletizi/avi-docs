---
title: DataScript Constructs
layout: default
---
### Operators

Operators compare or contrast sets of data, and will return as true or false. DataScripts rely on the Lua scripting language for the syntax and supported usage of arithmetic, relational and logical operators. When evaluating strings, DataScripts is case sensitive, so “a” does not equal “A”.

### Arithmetic Operators

<pre crayon="false">
  + -- Addition 
  - -- Subtraction 
  * -- Multiplication 
  / -- Division
</pre>

### Relational Operators

<pre crayon="false">
  &gt; -- Greater than 
  &lt; -- Less than 
  &gt;= -- Greater than or equal 
  &lt;= -- Less than or equal 
  == -- Equal ~= -- Not equal
</pre>

### Logical Operators

<pre crayon="false">
  and 
  or 
  not 
  string.find -- Used to search for a string within another string.
</pre>