# 1. Code Style Guide

- [1. Code Style Guide](#1-code-style-guide)
  - [1.1. Naming](#11-naming)
    - [1.1.1. Files](#111-files)
    - [1.1.2. Functions](#112-functions)
    - [1.1.3. Variables](#113-variables)
    - [1.1.4. Constants](#114-constants)
  - [1.2. Comments](#12-comments)
    - [1.2.1. Placement](#121-placement)
    - [1.2.2. Comment Type](#122-comment-type)
    - [1.2.3. Usage](#123-usage)
    - [1.2.4. TODO Comments](#124-todo-comments)
    - [1.2.5. Variable Comments](#125-variable-comments)
    - [1.2.6. Function Comments](#126-function-comments)
      - [1.2.6.1. Function Declarations](#1261-function-declarations)
      - [1.2.6.2. Function Definitions](#1262-function-definitions)
  - [1.3. Formatting](#13-formatting)
    - [1.3.1. Spaces vs Tabs](#131-spaces-vs-tabs)
    - [1.3.2. Function Declarations and Definitions](#132-function-declarations-and-definitions)
      - [1.3.2.1. Styling Notes](#1321-styling-notes)
    - [1.3.3. Floating Points](#133-floating-points)

Based off of the [Google Style Guide](https://google.github.io/styleguide/cppguide.html#Naming)

## 1.1. Naming

### 1.1.1. Files

Filenames should be lowercase and spaces should be replaced with `_`.

In general, make your filenames very specific. For example, use `http_server_logs.h` rather than `logs.h`

### 1.1.2. Functions

Functions should be named using PascalCase.

`KalmanFilter()`

### 1.1.3. Variables

Variable names should be written in camelCase.

`int time_to_launch` -> Bad

`int time-to-launch` -> Bad

`int TimeToLaunch` -> Bad

`int timetolaunch` -> Bad

`int Timetolaunch` -> Bad

`int timeToLaunch` -> Good

Where capitalisation cannot be used to delimit a word, underscores may be used:

`string pathForVersion2_0_0 = "...";`

### 1.1.4. Constants

Variables declared as const should be preceded by a `k` and then use mixed case.

`const int kHoursInADay = 24;`

## 1.2. Comments

### 1.2.1. Placement

Comments should appear **before** the line of text they are describing, **not** after.

### 1.2.2. Comment Type

Don't use `/* ... */` multi line comments. Add `//` to each line, so even in black and white, it is clear at a glance that the line in question is a comment.

### 1.2.3. Usage

Comments should not tell the reviewer WHAT the code it doing, they should say WHY. Comments can lie, but code cannot, so write self-documenting code and write comments that matter. See <https://google.github.io/styleguide/cppguide.html#Naming> for an example for self describing code.

### 1.2.4. TODO Comments

Use `TODO` comments as a todo list.

TODOs should include the string TODO in all caps, followed by the name of the person with the best context about the problem referenced by the TODO.

The main purpose is to have a consistent TODO that can be searched to find out how to get more details upon request.

**A TODO is not a commitment that the person referenced will fix the problem.** Thus when you create a TODO with a name, it is almost always your name that is given.

```cpp
// TODO(John) change this to use relations.
// TODO(Adam): remove the "Last visitors" feature.
```

### 1.2.5. Variable Comments

Variable names should be descriptive enough to not require explanatory comments.

### 1.2.6. Function Comments

#### 1.2.6.1. Function Declarations

Almost every function declaration should have comments immediately preceding it that describe what the function does and how to use it. If the function can be considered  simple and obvious, then the comment may be omitted. In general, these comments do not describe how the function performs its task. Instead, that should be left to comments in the function definition.

Things to mention:

- Inputs and Outputs.
- For each pointer argument, whether it is allowed to be null and what happens if it is.

Below is an example from the C++ style guide from [Google](https://google.github.io/styleguide/cppguide.html#Function_Comments):

```cpp
// Returns an iterator for this table, positioned at the first entry
// lexically greater than or equal to `start_word`. If there is no
// such entry, returns a null pointer. The client must not use the
// iterator after the underlying GargantuanTable has been destroyed.
//
// This method is equivalent to:
//    std::unique_ptr<Iterator> iter = table->NewIterator();
//    iter->Seek(start_word);
//    return iter;
std::unique_ptr<Iterator> GetIterator(absl::string_view start_word) const;
```

Do not be unnecessarily verbose or state the completely obvious.

#### 1.2.6.2. Function Definitions

## 1.3. Formatting

### 1.3.1. Spaces vs Tabs

Use only spaces, and indent 2 spaces at a time.

This can be set in your editor.

### 1.3.2. Function Declarations and Definitions

Function should be kept on one line where possible.

```cpp
ReturnType ClassName::FunctionName(Type par_name1, Type par_name2) {
  DoSomething();
  ...
}
```

If the function has a long name, or a large number of parameters, wrap the parameters onto separate lines. Indenting should also match the style shown below.

```cpp
ReturnType LongClassName::LongFunctionName(
    Type par_name1,  // 4 space indent
    Type par_name2,
    Type par_name3) {
  DoSomething();  // 2 space indent
  ...
}
```

#### 1.3.2.1. Styling Notes

- Opening braces should always be on the same line as the function name, never on the start of a new line.
- Closing braces should either be on the last line of the function definition, or on the same line as the opening brace.
- There should not be a space between the function name and the opening bracket.
- There should be a space between the close bracket and the open curly brace.
- There is never a space between the brackets and the parameters.

### 1.3.3. Floating Points

floating-point literals should always have a radix point, with digits on both sides, even if they use exponential notation. This helps readability and stops the value being mistaken for an integer.

Bad:

```cpp
float f = 1.f;
long double ld = -.5L;
double d = 1248e6;
```

Good:

```cpp
float f = 1.0f;
float f2 = 1;   // Also OK
long double ld = -0.5L;
double d = 1248.0e6;
```
