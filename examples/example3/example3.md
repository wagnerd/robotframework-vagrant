# Example 3: Merge Reports
To run this example cd to the example3 folder 
```
cd /vagrantsync/examples/example3
```

And run the provisioning script once before you test
```
resources/provision_example3.sh
```

Then run the example testsuites
```
robot --outputdir logs/3 example3.robot
robot --outputdir logs/3.1 example3.1.robot
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
Output:  /vagrantsync/examples/example3/logs/output.xml
Log:     /vagrantsync/examples/example3/logs/log.html
Report:  /vagrantsync/examples/example3/logs/report.html
```

You can now open the __report.html__ and check the detailed results.

Now you can merge the reports by running
```
rebot --log logs/merge/example3_merge_log.html --report logs/merge/example3_merge_report.html --ReportTitle example3_Title1 /vagrantsync/examples/example3/logs/3.1/output.xml /vagrantsync/examples/example3/logs/3/output.xml
```

You can also start the merge from within a python script. Some examples are placed inside the scripts folder.
You can run them like 
```
vagrant@localhost:/vagrantsync/examples/example3$ python ./scripts/merge1.py
```
This will create the report and log files inside the already existing logs folders.

Currently there are the following example scripts:  

| Name | Description |
|------ |------------------------- |
| merge1.py | Create a report using one output.xml file using rebot |
| merge2.py | Create a report using two output.xml file using rebot. Also redirect stdout to file. |
| merge3.py | Create a report using a generated list of output files using rebot. Also redirect stdout to file. |
| merge4.py | Create a report using a generated list of output files using rebot. Also redirect stdout to file. Get return value of rebot command. |
