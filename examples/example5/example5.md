# Example 5: Store Results in Database using DbBot

This example is based on the documentation for DbBot on [Github](https://github.com/robotframework/DbBot).

To run this example cd to the example5 folder 
```
cd /vagrantsync/examples/example5
```

And run the provisioning script
```
scripts/provision_example5.sh
```

Then run the example testsuites
```
robot --outputdir logs/5 example5.robot
```

The default database is a file named robot_results.db.
But here we store the db file in /tmp/ since during the creation of this example I always had a ```sqlite3.OperationalError: disk I/O error``` when I tried to store the db in the /vagrantsync/ folder.
So to store the db just run:
```
python -m dbbot.run  -b /tmp/my_own_database.db /vagrantsync/examples/example5/logs/5/output.xml
```

In order to show the current content of the db run the following commands:
```
$ sqlite3 /tmp/my_own_database.db

sqlite> .tables
arguments        suite_status     test_run_errors  tests
keyword_status   suites           test_run_status
keywords         tag_status       test_runs
messages         tags             test_status

sqlite> SELECT count(), tests.id, tests.name
        FROM tests, test_status
        WHERE tests.id == test_status.test_id AND
        test_status.status == "FAIL"
        GROUP BY tests.name;
```
The output of the query will lokk like this:
```
1|1|Failing Example
1|2|Good Example
```

Type .quit or use Ctrl+D to leave sqlite3 console
```
robot --outputdir logs/5.1 example5.robot
```

```
python -m dbbot.run -b /tmp/my_own_database.db /vagrantsync/examples/example5/logs/5.1/output.xml
```

```
$ sqlite3 /tmp/my_own_database.db

sqlite> .tables
arguments        suite_status     test_run_errors  tests
keyword_status   suites           test_run_status
keywords         tag_status       test_runs
messages         tags             test_status

sqlite> SELECT count(), tests.id, tests.name
        FROM tests, test_status
        WHERE tests.id == test_status.test_id AND
        test_status.status == "FAIL"
        GROUP BY tests.name;
```
The output of the query will now look like this:
```
2|1|Failing Example
2|2|Good Example
```
This is because now we have two results for each test case.

You can also show the suite name to the test case name:
```
sqlite> SELECT count(), tests.id, tests.name, suites.name
        FROM tests, test_status, suites
        WHERE tests.id == test_status.test_id AND
        test_status.status == "FAIL"
        GROUP BY tests.name;
```
With the output:
```
2|1|Failing Example|Example5
2|2|Good Example|Example
```


```
robot --outputdir logs/5.2 example5.2.robot
```

```
python -m dbbot.run -b /tmp/my_own_database.db /vagrantsync/examples/example5/logs/5.2/output.xml
```

Now when we have a second suite, run the command again:
```
sqlite> SELECT count(), tests.id, tests.name, suites.name
        FROM tests, test_status, suites
        WHERE tests.id == test_status.test_id AND
        test_status.status == "FAIL"
        GROUP BY tests.name;
```
But the output looks odd:
```
6|3|Failing Example|Example5.2
6|4|Good Example|Example5.2
```

Adapt the query to
```
sqlite> SELECT count(), suites.name
        FROM tests, test_status, suites
        WHERE tests.id == test_status.test_id AND test_status.status == "FAIL" AND tests.suite_id == suites.id
        GROUP BY suites.name;
```

This for example will show us how many results we have for each suite:
```
4|Example5
2|Example5.2
```

Now as a last example, show the number of test runs:
```
sqlite> SELECT count(), test_runs.source_file, test_runs.started_at, test_runs.finished_at
        FROM test_runs
        GROUP BY test_runs.id;
```
The number of test runs per imported file with start and end time:
```
1|/vagrantsync/examples/example5/logs/5/output.xml|2018-07-30 19:10:05.896000|2018-07-30 19:10:05.913000
1|/vagrantsync/examples/example5/logs/5.1/output.xml|2018-07-30 19:53:36.684000|2018-07-30 19:53:36.702000
1|/vagrantsync/examples/example5/logs/5.2/output.xml|2018-07-30 20:03:30.761000|2018-07-30 20:03:30.779000
```