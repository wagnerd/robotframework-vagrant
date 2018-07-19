# Example 1: Simple Browser Test
To run this example cd to the example1 folder 
```
cd /vagrantsync/examples/example1
```

And run the provisioning script
```
resources/provision_example1.sh
```

Then run the example testsuite
```
robot --outputdir logs example1.robot
```

The shell output will look like this
```
==============================================================================
Example1 :: A test suite with a single test for Open Page.                    
==============================================================================
Open Page                                                             | PASS |
------------------------------------------------------------------------------
Example1 :: A test suite with a single test for Open Page.            | PASS |
1 critical test, 1 passed, 0 failed
1 test total, 1 passed, 0 failed
==============================================================================
Output:  /vagrantsync/examples/example1/logs/output.xml
Log:     /vagrantsync/examples/example1/logs/log.html
Report:  /vagrantsync/examples/example1/logs/report.html
```

You can now open the __report.html__ and check the detailed results.
