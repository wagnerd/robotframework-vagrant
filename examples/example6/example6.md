# Example 6: Add variables from different sources

In your robot files its possible to load common ressource
files which are shared between multiple test files.
These resource files can also be created during test
execution to contain IPs, dates etc.

So this example will show some posiibilities to load
resource files in your test suites.

[example6.robot](example6.robot) contains  the lines

```
*** Settings ***
# Resource    resources/extra_vars.resource #  Robot Framework 3.1
Resource    resources/extra_vars.robot
```

on top of the file.
This means that when we run the test suite or one of its test cases, RobotFramework
will load the file [resources/extra_vars.robot](resources/extra_vars.robot).

This file contains some extra variables. 
A simple test here then checks if the extra variables are loaded correctly and
compares them with the built in variables from the test suite.
Thats it.

To run this example cd to the example6 folder 
```
cd /vagrantsync/examples/example6
```

Then run the example testsuites
```
robot --outputdir logs/6 example6.robot
```