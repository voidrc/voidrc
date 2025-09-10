## Intro
Python is, as you know, popular programming language. It is used for:
- Web Development (server-side)
- Software Development
- Mathematics
- System Scripting

Also:
- Python can be used on a server to create web applications.
- Python can be used alongside software to create workflows.
- Python can connect to database systems. It can also read and modify files.
- Python can be used to handle big data and perform complex mathematics.
- Python can be used for rapid prototyping, or for production-ready software development.
### Why Python?
Primary reason why i started python is, one of my friends told  me there is a vacancy for Python&Django internship. So i didn't want to waste opportunity.

---
## Syntax
1) Python uses indentation to indicate a block of code
	- The number of spaces is up to you as a programmer, the most common use is four, but it has to be at least one.
	- You have to use the same number of spaces in the same block of code, otherwise Python will give you an error.
2) Python has commenting capability for the  purpose of in-code documentation.
	- Comments start with a `#`, and Python will  render the rest of the line as a comment.
	- Comments can be used to explain Python code.
	- Comments can be used to make the code more readable.
	- Comments can be used to prevent execution when testing code.
3) Python does not really have a syntax for multiline comments
	- Since Python will ignore string literals that are not assigned to a variable, you can add a multiline string `""" """`.

---
## Variables
Variables are containers for storing data values.
- A Variable is created the moment you first assign a value to it.
- Variables don't need to be declared with particular _type_, and can change type after they have been set.
- Strings can be declared either with  single or double quotes.

### **Variable Names**
- Must start with a letter or  the underscore character
- Can not start with a number
- Can only contain alpha-numeric characters and underscores
- Case-Sensitive
- Ca not be any of the Python Keywords

### **Multi Values**
Python allows you to assign values to multiple variables in one line:
```python
x, y, z = "Orange", 27, "Brainrot"
print(x)
print(y)
print(z)
```
> Make sure number of values matches number of variables

or one value to multiple variables:
```python
x = y = z = "HEHEHE"
print(X)
print(y)
print(z)
```

If you have a colllection of values in a list,  tuple etc. Python allows you  to extract the values into variables. This is called _unpacking_:
```python
fruits = ["apple", "banana", "cherry"]  
x, y, z = fruits  
print(x)  
print(y)  
print(z)
```

### Output Variables
`print()` function is often used to output variables.

You output multiple variables,  separated by a comma:
```python
x = "Python"  
y = "is"  
z = "awesome"
print(x, y, z)
```

You can also use the `+` operator to output multiple variables:
```python
x = "Python "  
y = "is "  
z = "awesome"  
print(x + y + z)
```
> Notice the space character after **"Python "** and **"is "**, without them the result would be **"Pythonisawesome"**.
> To add a space between them, add a `" "`: **c = a + " " + b**

For numbers, the `+` character works as a mathematical operator:
```python
x = 5  
y = 10  
print(x + y)
```
> You can't combine **string** and **number**. Use **comma** instead.

### Global Variables
Variables that are created outside of a function are known as _Global Variables_.
They can be used everywhere in code.

If you create a variable with the same name inside a function, this variable will be local, and can only be used inside the function. The global variable with the same name will remain as it was, global and with the original value.
```python
x = "awesome"  
  
def myfunc():  
  x = "fantastic"  
  print("Python is " + x)  
  
myfunc()  
  
print("Python is " + x)
```

To create a global variable inside a function, you can use the `global` keyword.
```python
def myfunc():  
  global x  
  x = "fantastic"  

myfunc()  
  
print("Python is " + x)
```
> It can also be used to change value of Global variable inside a function.

---
## Data Types

In programming, data type is an important concept.
Variables can store data of different types, and different types can do different things.

Python has the following data types built-in by default, in these categories:

|                 |                                    |
| --------------- | ---------------------------------- |
| Text Type:      | `str`                              |
| Numeric Types:  | `int`, `float`, `complex`          |
| Sequence Types: | `list`, `tuple`, `range`           |
| Mapping Type:   | `dict`                             |
| Set Types:      | `set`, `frozenset`                 |
| Boolean Type:   | `bool`                             |
| Binary Types:   | `bytes`, `bytearray`, `memoryview` |
| None Type:      | `NoneType`                         |
> You can get the data type of any object by using the `type()` function:

In Python, the data type is set when you assign a value to a variable:

| Example                                      | Data Type  |
| -------------------------------------------- | ---------- |
| x = "Hello World"                            | str        |
| x = 20                                       | int        |
| x = 20.5                                     | float      |
| x = 1j                                       | complex    |
| x = ["apple", "banana", "cherry"]            | list       |
| x = ("apple", "banana", "cherry")            | tuple      |
| x = range(6)                                 | range      |
| x = {"name" : "John", "age" : 36}            | dict       |
| x = {"apple", "banana", "cherry"}            | set        |
| x = frozenset({"apple", "banana", "cherry"}) | frozenset  |
| x = True                                     | bool       |
| x = b"Hello"                                 | bytes      |
| x = bytearray(5)                             | bytearray  |
| x = memoryview(bytes(5))                     | memoryview |
| x = None                                     | NoneType   |

If you want to specify the data type, you can use the following constructor functions:

|                                              |            |
| -------------------------------------------- | ---------- |
| x = str ("Hello World")                      | str        |
| x = int(20)                                  | int        |
| x = float(20.5)                              | float      |
| x = complex(1j)                              | complex    |
| x = list(("apple", "banana", "cherry"))      | list       |
| x = tuple(("apple", "banana", "cherry"))     | tuple      |
| x = range(6)                                 | range      |
| x = dict(name="John", age=36)                | dict       |
| x = set(("apple", "banana", "cherry"))       | set        |
| x = frozenset(("apple", "banana", "cherry")) | frozenset  |
| x = bool(5)                                  | bool       |
| x = bytes(5)                                 | bytes      |
| x = bytearray(5)                             | bytearray  |
| x = memoryview(bytes(5))                     | memoryview |

---

## Numbers
There are 3 numeric types in Python:
- `int`
- `float`
- `complex`

### Int
Int, or integer, is a whole number:
```python
x = 1
y = 97815425126521
z = -3255522
```

### Float
Float, or "floating point number" is a number that contains decimals. It can also be scientific numbers with an `e` to indicate the power of 10:
```python
x = 1.10  
y = 1.0  
z = -35.59

a = 35e3  
b = 12E4  
c = -87.7e100
```

### Complex
Complex numbers are written with a "j" as the imaginary part:
```python
x = 3+5j  
y = 5j  
z = -5j
```

### Conversion
You can convert from one type to another with the `int()`, `float()`, and `complex()` methods:
```python
x = 1    # int  
y = 2.8  # float  
z = 1j   # complex  
  
#convert from int to float:  
a = float(x)  
  
#convert from float to int:  
b = int(y)  
  
#convert from int to complex:  
c = complex(x)
```
> You can not convert complex into another type

### Random Number
Python does not have a `random()` function to make a random number, but Python has a built-in module called `random` that can be used to make random numbers:
```python
import random  
  
print(random.randrange(1, 10))
```

---

## Casting
There may be times when you want to specify a type on to a variable. This can be done with casting. Python is an object-orientated language, and as such it uses classes to define data types, including its primitive types.

Casting in python is therefore done using constructor functions:

`int()` - constructs an integer number from an integer literal, a float literal (by removing all decimals), or a string literal (providing the string represents a whole number)
```python
x = int(1)   # x will be 1  
y = int(2.8) # y will be 2  
z = int("3") # z will be 3
```

`float()` - constructs a float number from an integer literal, a float literal or a string literal (providing the string represents a float or an integer)
```python
x = float(1)     # x will be 1.0  
y = float(2.8)   # y will be 2.8  
z = float("3")   # z will be 3.0  
w = float("4.2") # w will be 4.2
```

`str()` - constructs a string from a wide variety of data types, including strings, integer literals and float literals
```python
x = str("s1") # x will be 's1'  
y = str(2)    # y will be '2'  
z = str(3.0)  # z will be '3.0'
```

---
## Strings
1) Strings in python are surrounded by either single quotation marks, or double quotation marks.
2) You can use quotes inside a string, as long as they don't match the quotes surrounding the string
3) You can assign a multiline string to a variable by using three quotes or three single quotes
4) Strings are arrays
	- a single character is simply a string with a length of 1
	- Square brackets can be used to access elements of the string
	- Since strings are arrays, we can loop through the characters in a string, with a `for` loop
5) To get the length of a string, use the `len(x)` function
6) To check if a certain phrase or character is present in a string, we can use the keyword `in`
7) To check if a certain phrase or character is NOT present in a string, we can use the keyword `not in`
```python
# 1
print("Hello")  
print('Hello')

# 2
print("It's alright")  
print("He is called 'Johnny'")  
print('He is called "Johnny"')

# 3
a = """Lorem ipsum dolor sit amet,  
consectetur adipiscing elit,  
sed do eiusmod tempor incididunt  
ut labore et dolore magna aliqua."""

b = '''Lorem ipsum dolor sit amet,  
consectetur adipiscing elit,  
sed do eiusmod tempor incididunt  
ut labore et dolore magna aliqua.'''

# 4
a = "Hello, World!"  
print(a[1])

for x in "banana":  
  print(x)

# 5
a = "Hello, World!"  
print(len(a))

# 6
txt = "The best things in life are free!"  
print("free" in txt)

txt = "The best things in life are free!"  
if "free" in txt:  
  print("Yes, 'free' is present.")

# 7
txt = "The best things in life are free!"  
print("expensive" not in txt)

txt = "The best things in life are free!"  
if "expensive" not in txt:  
  print("No, 'expensive' is NOT present.")
```

### Slicing
You can return a range of characters by using the slice syntax.

Specify the start index and the end index, separated by a colon, to return a part of the string:
```python
b = "Hello, World!"  
print(b[2:5])
print(b[:5])
print(b[2:])
print(b[-5:-2])
```
> The first character has index 0.
> End index in slice syntax is not included

### Modify
Python has a set of built-in methods that you can use on strings.
```python
# The "upper()" method returns the string in upper case:
a = "Hello, World!"  
print(a.upper())

# The "lower()" method returns the string in lower case:
a = "Hello, World!"  
print(a.lower())

# The "strip()" method removes any whitespace from the beginning or the end:
a = " Hello, World! "  
print(a.strip()) # returns "Hello, World!"

# The "replace()" method replaces a string with another string:
a = "Hello, World!"  
print(a.replace("H", "J"))

# The `split()` method splits the string into substrings if it finds instances of the separator:
a = "Hello, World!"  
print(a.split(",")) # returns ['Hello', ' World!']
```
> Whitespace is the space before and/or after the actual text, and very often you want to remove this space.

### Format
As we learned in the Python Variables chapter, we cannot combine strings and numbers like this:
```python
age = 36  
txt = "My name is John, I am " + age  
print(txt)
```
> But we can combine strings and numbers by using _f-strings_ or the `format()` method!

To specify a string as an f-string, simply put an `f` in front of the string literal, and add curly brackets `{}` as placeholders for variables and other operations:
```python
age = 36  
txt = f"My name is John, I am {age}"  
print(txt)
```
> A placeholder can contain variables, operations, functions, and modifiers to format the value.

A modifier is included by adding a colon `:` followed by a legal formatting type, like `.2f` which means fixed point number with 2 decimals:
```python
price = 59  
txt = f"The price is {price:.2f} dollars"  
print(txt)
```

A placeholder can contain Python code, like math operations:
```python
txt = f"The price is {20 * 59} dollars"  
print(txt)
```

### Escape Characters
To insert characters that are illegal in a string, use an escape character.
An escape character is a backslash `\` followed by the character you want to insert.

| Code  | Result          |
| ----- | --------------- |
| \\'   | Single Quote    |
| \\\   | Backslash       |
| \\n   | New Line        |
| \\r   | Carriage Return |
| \\t   | Tab             |
| \\b   | Backspace       |
| \\f   | Form Feed       |
| \\ooo | Octal Value     |
| \\xhh | Hex Value       |
### String Methods
Python has a set of built-in methods that you can use on strings.

|Method|Description|
|---|---|
|[capitalize()](https://www.w3schools.com/python/ref_string_capitalize.asp)|Converts the first character to upper case|
|[casefold()](https://www.w3schools.com/python/ref_string_casefold.asp)|Converts string into lower case|
|[center()](https://www.w3schools.com/python/ref_string_center.asp)|Returns a centered string|
|[count()](https://www.w3schools.com/python/ref_string_count.asp)|Returns the number of times a specified value occurs in a string|
|[encode()](https://www.w3schools.com/python/ref_string_encode.asp)|Returns an encoded version of the string|
|[endswith()](https://www.w3schools.com/python/ref_string_endswith.asp)|Returns true if the string ends with the specified value|
|[expandtabs()](https://www.w3schools.com/python/ref_string_expandtabs.asp)|Sets the tab size of the string|
|[find()](https://www.w3schools.com/python/ref_string_find.asp)|Searches the string for a specified value and returns the position of where it was found|
|[format()](https://www.w3schools.com/python/ref_string_format.asp)|Formats specified values in a string|
|format_map()|Formats specified values in a string|
|[index()](https://www.w3schools.com/python/ref_string_index.asp)|Searches the string for a specified value and returns the position of where it was found|
|[isalnum()](https://www.w3schools.com/python/ref_string_isalnum.asp)|Returns True if all characters in the string are alphanumeric|
|[isalpha()](https://www.w3schools.com/python/ref_string_isalpha.asp)|Returns True if all characters in the string are in the alphabet|
|[isascii()](https://www.w3schools.com/python/ref_string_isascii.asp)|Returns True if all characters in the string are ascii characters|
|[isdecimal()](https://www.w3schools.com/python/ref_string_isdecimal.asp)|Returns True if all characters in the string are decimals|
|[isdigit()](https://www.w3schools.com/python/ref_string_isdigit.asp)|Returns True if all characters in the string are digits|
|[isidentifier()](https://www.w3schools.com/python/ref_string_isidentifier.asp)|Returns True if the string is an identifier|
|[islower()](https://www.w3schools.com/python/ref_string_islower.asp)|Returns True if all characters in the string are lower case|
|[isnumeric()](https://www.w3schools.com/python/ref_string_isnumeric.asp)|Returns True if all characters in the string are numeric|
|[isprintable()](https://www.w3schools.com/python/ref_string_isprintable.asp)|Returns True if all characters in the string are printable|
|[isspace()](https://www.w3schools.com/python/ref_string_isspace.asp)|Returns True if all characters in the string are whitespaces|
|[istitle()](https://www.w3schools.com/python/ref_string_istitle.asp)|Returns True if the string follows the rules of a title|
|[isupper()](https://www.w3schools.com/python/ref_string_isupper.asp)|Returns True if all characters in the string are upper case|
|[join()](https://www.w3schools.com/python/ref_string_join.asp)|Joins the elements of an iterable to the end of the string|
|[ljust()](https://www.w3schools.com/python/ref_string_ljust.asp)|Returns a left justified version of the string|
|[lower()](https://www.w3schools.com/python/ref_string_lower.asp)|Converts a string into lower case|
|[lstrip()](https://www.w3schools.com/python/ref_string_lstrip.asp)|Returns a left trim version of the string|
|[maketrans()](https://www.w3schools.com/python/ref_string_maketrans.asp)|Returns a translation table to be used in translations|
|[partition()](https://www.w3schools.com/python/ref_string_partition.asp)|Returns a tuple where the string is parted into three parts|
|[replace()](https://www.w3schools.com/python/ref_string_replace.asp)|Returns a string where a specified value is replaced with a specified value|
|[rfind()](https://www.w3schools.com/python/ref_string_rfind.asp)|Searches the string for a specified value and returns the last position of where it was found|
|[rindex()](https://www.w3schools.com/python/ref_string_rindex.asp)|Searches the string for a specified value and returns the last position of where it was found|
|[rjust()](https://www.w3schools.com/python/ref_string_rjust.asp)|Returns a right justified version of the string|
|[rpartition()](https://www.w3schools.com/python/ref_string_rpartition.asp)|Returns a tuple where the string is parted into three parts|
|[rsplit()](https://www.w3schools.com/python/ref_string_rsplit.asp)|Splits the string at the specified separator, and returns a list|
|[rstrip()](https://www.w3schools.com/python/ref_string_rstrip.asp)|Returns a right trim version of the string|
|[split()](https://www.w3schools.com/python/ref_string_split.asp)|Splits the string at the specified separator, and returns a list|
|[splitlines()](https://www.w3schools.com/python/ref_string_splitlines.asp)|Splits the string at line breaks and returns a list|
|[startswith()](https://www.w3schools.com/python/ref_string_startswith.asp)|Returns true if the string starts with the specified value|
|[strip()](https://www.w3schools.com/python/ref_string_strip.asp)|Returns a trimmed version of the string|
|[swapcase()](https://www.w3schools.com/python/ref_string_swapcase.asp)|Swaps cases, lower case becomes upper case and vice versa|
|[title()](https://www.w3schools.com/python/ref_string_title.asp)|Converts the first character of each word to upper case|
|[translate()](https://www.w3schools.com/python/ref_string_translate.asp)|Returns a translated string|
|[upper()](https://www.w3schools.com/python/ref_string_upper.asp)|Converts a string into upper case|
|[zfill()](https://www.w3schools.com/python/ref_string_zfill.asp)|Fills the string with a specified number of 0 values at the beginning
> All string methods return new values. They do not change the original string.

---

## Booleans
Booleans represent one of two values: `True` or `False`. In programming you often need to know if an expression is `True` or `False`.

You can evaluate any expression in Python, and get one of two answers, `True` or `False`. When you compare two values, the expression is evaluated and Python returns the Boolean answer:
```python
print(10 > 9)  
print(10 == 9)  
print(10 < 9)

a = 200
b = 33
if b > a:  
  print("b is greater than a")  
else:  
  print("b is not greater than a")
```

The `bool()` function allows you to evaluate any value, and give you `True` or `False` in return.
Almost any value is evaluated to `True` if it has some sort of content.
- Any string is `True`, except empty strings.
- Any number is `True`, except `0`.
- Any list, tuple, set, and dictionary are `True`, except empty ones.
```python
bool("abc")  
bool(123)  
bool(["apple", "cherry", "banana"])
```

In fact, there are not many values that evaluate to `False`, except empty values, such as `()`, `[]`, `{}`, `""`, the number `0`, and the value `None`. And of course the value `False` evaluates to `False`.
```python
bool(False)  
bool(None)  
bool(0)  
bool("")  
bool(())  
bool([])  
bool({})
```

One more value, or object in this case, evaluates to `False`, and that is if you have an object that is made from a class with a `__len__` function that returns `0` or `False`:
```python
class myclass():  
  def __len__(self):  
    return 0  
  
myobj = myclass()  
print(bool(myobj))
```

You can create functions that returns a Boolean Value:
```python
def myFunction() :  
  return True  
  
if myFunction():  
  print("YES!")  
else:  
  print("NO!")
```

Python also has many built-in functions that return a boolean value, like the `isinstance()` function, which can be used to determine if an object is of a certain data type:
```python
x = 200  
print(isinstance(x, int))
```

---
## Operators
Operators are used to perform operations on variables and values.
Python divides the operators in the following groups:
- Arithmetic operators
- Assignment operators
- Comparison operators
- Logical operators
- Identity operators
- Membership operators
- Bitwise operators

### Arithmetic Operators
Arithmetic operators are used with numeric values to perform common mathematical operations:

| Operator | Name           | Example |
| -------- | -------------- | ------- |
| +        | Addition       | x + y   |
| -        | Subtraction    | x - y   |
| *        | Multiplication | x * y   |
| /        | Division       | x / y   |
| %        | Modulus        | x % y   |
| **       | Exponentiation | x ** y  |
| //       | Floor Division | x // y  |

### Assignment Operators
Assignment operators are used to assign values to variables:

| Operator | Example       | Same As           |
| -------- | ------------- | ----------------- |
| =        | x = 5         | x = 5             |
| +=       | x += 5        | x = x + 5         |
| -=       | x -= 5        | x = x - 5         |
| *=       | x *= 5        | x = x + 5         |
| /=       | x /= 5        | x = x / 5         |
| %=       | x %= 5        | x = x % 5         |
| //=      | x //= 5       | x = x // 5        |
| **=      | x **= 5       | x = x ** 5        |
| &=       | x &= 5        | x = x & 5         |
| \|=      | x \|= 5       | x = x \| 5        |
| ^=       | x ^= 5        | x = x ^ 5         |
| >>=      | x >>= 5       | x = x >> 5        |
| <<=      | x <<= 5       | x = x << 5        |
| :=       | print(x := 5) | x = 5<br>print(x) |
### Comparison Operators
Comparison operators are used to compare two values:

| Operator | Name             | Example |
| -------- | ---------------- | ------- |
| ==       | Equal            | x == y  |
| !=       | Not Equal        | x != y  |
| >        | Greater Than     | x > y   |
| <        | Less Than        | x < y   |
| >=       | Greater or Equal | x >= y  |
| <=       | Less or Equal    | x <= y  |

### Logical Operators
Logical operators are used to combine conditional statements:

| Operator | Description                                             | Example               |
| -------- | ------------------------------------------------------- | --------------------- |
| and      | Returns True if both statements are true                | x < 5 and x < 10      |
| or       | Returns True if one of the statements is true           | x < 5 or x > 4        |
| not      | Reverse the result, returns False if the result is True | not(x < 5 and x < 10) |

### Identity Operators
Identity operators are used to compare the objects, not if they are equal, but if they are actually the same object, with the same memory location:

| Operator | Description                                            | Example    |
| -------- | ------------------------------------------------------ | ---------- |
| is       | Returns True if both variables are the same object     | x is y     |
| is not   | Returns True if both variables are not the same object | x is not y |

### Membership Operators
Membership operators are used to test if a sequence is presented in an object:

| Operator | Description                                                                      | Example    |
| -------- | -------------------------------------------------------------------------------- | ---------- |
| in       | Returns True if a sequence with the specified value is present in the object     | x in y     |
| not in   | Returns True if a sequence with the specified value is not present in the object | x not in y |

### Bitwise Operators

| Operator | Name                  | Description                                                                      | Example |
| -------- | --------------------- | -------------------------------------------------------------------------------- | ------- |
| &        | AND                   | Sets each bit to 1 if both bits are 1                                            | x & y   |
| \|       | OR                    | Sets each bit to 1 if one of bits is 1                                           | x \| y  |
| ^        | XOR                   | Sets each bit to 1 if only one of bits is 1                                      | x ^ y   |
| ~        | NOT                   | Inverts all the bits                                                             | ~x      |
| <<       | Zero fill left shift  | Shift left by pushing zeros in from the right and let the leftmost bits fall off | x << 2  |
| >>       | Zero fill right shift | Shift left by pushing zeros in from the left and let the rightmost bits fall off | x >> 2  |

### Operator Precedence
Operator precedence describes the order in which operations are performed.

Parentheses has the highest precedence, meaning that expressions inside parentheses must be evaluated first:
```python
print((6 + 3) - (6 + 3))
```

Multiplication `*` has higher precedence than addition `+`, and therefore multiplications are evaluated before additions:
```python
print(100 + 5 * 3)
```

The precedence order is described in the table below, starting with the highest precedence at the top:

| Operator                                                 | Name                                                  |
| -------------------------------------------------------- | ----------------------------------------------------- |
| `()`                                                     | Parentheses                                           |
| `**`                                                     | Exponentiation                                        |
| `+x` `-x` `~x`                                           | Unary Plus, Unary Minus, and Bitwise NOT              |
| `*` `/` `//` `%`                                         | Multiplication, Division, Floor Division, and Modulus |
| `+` `-`                                                  | Addition and Subtraction                              |
| `<<` `>>`                                                | Bitwise Left and Right Shifts                         |
| `&`                                                      | Bitwise AND                                           |
| `^`                                                      | Bitwise XOR                                           |
| \|                                                       | Bitwise OR                                            |
| `==` `!=` `>` `>=` `<` `<=` `is`  `is not` `in` `not in` | Comparison, Identity, and Membership Operators        |
| `not`                                                    | Logical NOT                                           |
| `and`                                                    | Logical AND                                           |
| `or`                                                     | Logical OR                                            |
> If two operators have the same precedence, the expression is evaluated from left to right.

---

## Lists, Tuples, Sets, and Dictionaries
n Python, **lists**, **tuples**, **sets**, and **dictionaries** are built-in data structures that serve different purposes and have different properties.

### Lists
1) Lists are used to store multiple items in a single variable.
2) Lists are created using square brackets: `thislist = ["apple", "banana", "cherry"]` 
3) List items are indexed.
4) List items are ordered, changeable, and allow duplicate values.
	- When we say that lists are ordered, it means that the items have a defined order, and that order will not change. If you add new items to a list, the new items will be placed at the end of the list.
	- The list is changeable, meaning that we can change, add, and remove items in a list after it has been created.
	- Since lists are indexed, lists can have items with the same value: `thislist = ["apple", "banana", "cherry", "apple", "cherry"]
5) To determine how many items a list has, use the `len()` function: `print(len(thislist))`
6) List items can be of any data type, and can contain different types: `thislist = ["abc", 34, True, 40, "male"]`
7) From Python's perspective, lists are defined as objects with the data type 'list': `<class 'list'>`
8) It is also possible to use the list() constructor when creating a new list: `thislist = list(("apple", "banana", "cherry"))`
9) List items are indexed and you can access them by referring to the index number.
	- Print the second item of the list: `print(thislist[1])`
	- Print the last item of the list: `print(thislist[-1])`
	- You can specify a range of indexes by specifying where to start and where to end the range: `print(thislist[2:5])`
	- To determine if a specified item is present in a list use the `in` keyword: `if "apple" in thislist:`
10) To change the value of a specific item, refer to the index number:
	- Change the second item: `thislist[1] = "nigger"`
	- To change the value of items within a specific range, define a list with the new values, and refer to the range of index numbers where you want to insert the new values: `thislist[1:3] = ["embrace", "racism"]`
	- If you insert _more_ items than you replace, the new items will be inserted where you specified, and the remaining items will move accordingly: `thislist[1:2] = ["blackcurrant", "watermelon"]`
	- If you insert _less_ items than you replace, the new items will be inserted where you specified, and the remaining items will be deleted: `thislist[1:] = ["watermelon"]` _this leaves first item and watermelon only_
11) To add new items without touching others, use:
	- `append()` to add an item to  the end of the list: `target_list.append("israil")`
	- `insert()` to insert an item to specified index: `thislist.insert(1, "orange")`
	- `extend()` to append elements from _another list_: `list1.extend(list2)`
	- The `extend()` method does not have to append _lists_, you can add any iterable object (tuples, sets, dictionaries etc.): `thislist.extend(thistuple)`
12) 
