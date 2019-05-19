# Vagrant - Robot Framework

Setup a virtualbox vm with ubuntu-18.04-desktop and [RobotFramework](http://robotframework.org/) preinstalled.

These examples were generated and tested using:
* **Host OS:** Windows 10
* **VM OS:** Ubuntu 18.04
* **VirtualBox:** 5.2.12r122591
* **Vagrant:** 2.1.1

The examples are based on the [official examples](http://robotframework.org/#examples), experience and experiments.

## Prerequisites
* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)

## How to use
Provision and run the vagrant box inside this folder with:

```
vagrant up
```

You can stop the VM by running:

```
vagrant halt
```

Or remove/reset it completly with:

```
vagrant destroy
```

## Examples

### Example 1: Simple Browser Test
See detailes about example1 [here](examples/example1/example1.md)
The example will run a simple browser test example and create a report which you can inspect.

### Example 2: Run tests from VM to Host
See detailes about example2 [here](examples/example2/example2.md)
The example will run a simple test example from the VM to the host machine and create a report which you can inspect.

### Example 3: Merge Reports
See detailes about example3 [here](examples/example3/example3.md)
The example will run a simple browser test example and create a report which then will be merged with other reports.

### Example 4: Import ExampleLibrary
See detailes about example4 [here](examples/example4/example4.md)
The example will create a simple custom ExampleLibrary in python and use it inside the robot framework test suite.

### Example 5: Store Results in Database using DbBot
See detailes about example5 [here](examples/example5/example5.md)
The example will let you create some example test results and store them inside a database using [DbBot](https://github.com/robotframework/DbBot).

### Example 6: Add variables from different sources
See detailes about example6 [here](examples/example6/example6.md)
So this example will show some posibilities to load resource files in your test suites.

### Example 7: Run RobotFramework inside a docker container
See detailes about example7 [here](examples/example7/example7.md)
Now we are creating a simple docker container to run RobotFramework inside of it and use it to run our examples tests.