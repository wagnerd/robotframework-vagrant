# Example 2: Run tests from VM to Host

This example is based on information and examples at [Github robotframework/PythonRemoteServer](https://github.com/robotframework/PythonRemoteServer)

As a prerequisite the port 8270 is forwarded between host and guest (see [Vagrantfile](../../Vagrantfile))

## Host operating system
Windows 10

## Guest operating system
Ubuntu 18.04

In order to provision your host system, run:
```
examples/example2/resources/provision_host.sh
```

On the host system run:
```
python examples/example2/examplelibrary.py     # Start library on Python
```

Check running remote server with (open another command line)
```
python -m robotremoteserver test
```

The output should look like
```
Remote server running at http://127.0.0.1:8270.
```

And inside the guest VM run:
```
cd /vagrantsync/examples/example2             # cd to example directory
robot --outputdir logs tests.robot            # Execute with the `robot` command
```

The output will like like this:
```
==============================================================================
Tests                                                                         
==============================================================================
Count Items in Directory Guest                                        | FAIL |
FileNotFoundError: [WinError 3] Das System kann den angegebenen Pfad nicht finden: '/vagrantsync/examples/example2'
------------------------------------------------------------------------------
Count Items in Directory Host                                         | PASS |
------------------------------------------------------------------------------
Failing Example                                                       | FAIL |
Given strings are not equal.
------------------------------------------------------------------------------
Tests                                                                 | FAIL |
3 critical tests, 1 passed, 2 failed
3 tests total, 1 passed, 2 failed
==============================================================================
Output:  /vagrantsync/examples/example2/logs/output.xml
Log:     /vagrantsync/examples/example2/logs/log.html
Report:  /vagrantsync/examples/example2/logs/report.html
```

In detail this is completely reasonable
```
Count Items in Directory Guest                                        | FAIL |
FileNotFoundError: [WinError 3] Das System kann den angegebenen Pfad nicht finden: '/vagrantsync/examples/example2'
```
Since the test is executed on the guest system, which is linux, this path can simply not exist on the windows host system

Thats why we have the second test case __Count Items in Directory Host__, which uses windows compatible paths, see [tests.robot](examples/example2/tests.robot)
```
${HOSTDIR1}    E:\\
${HOSTDIR2}    F:\\
```
If your host system does not have these paths, just adapt them to actually existing paths.

# Stop Remote Server
Go to the command shell you started the remote server and stop it with Strg^C, the output will be:
```
Robot Framework remote server at 127.0.0.1:8270 started.
Robot Framework remote server at 127.0.0.1:8270 stopped.
```