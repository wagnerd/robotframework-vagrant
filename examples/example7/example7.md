# Example 7: Run RobotFramework inside a docker container

In general it is quite easy to deploy RobotFramework and additional libaries
to different environments.
You can use pip or prepare complete runtime environments which just get installed/copied when needed.

Another possibility is to run RobotFramework inside a docker container.

For this example we will use a different vagrant box than for the other examples. See subfolder [vagrant](vagrant/).
The difference here is that we do not install RobotFramework using vagrant. 

To check if docker is installed correctly, just run:

```bash
sudo docker run hello-world
```

Ok now we can do some steps to create our own container
where we just pass our robot file to run.

First content of our Dockerfile will be:

```
FROM python:3

RUN python3 -m pip install robotframework
```

This will use python:3 and install RobotFramework.

> Hint: To change the python version inside the container, just adapt the tag in the first line. Let's say you want to use Python 3.6, just write  
> ```FROM python:3.6```  
> To see all available tags, go to [dockerhub python](https://hub.docker.com/_/python).

Build the container:

```
vagrant@linux:/vagrantsync/docker$ sudo docker build -t output/robot-docker .
```

And run it:

```
docker run --name test -ti output/robot-docker bash
```

This will open a bash inside your container. You can run ```root@5eb451dcacbf:/# python3 -m robot --help```
to test this.

Since we started the container interactively, to leave we have to use __Strg + d__

Outside of the container you can check that the robot
command will not work:

```bash
vagrant@linux:/vagrantsync/docker$ python3 -m robot --help
/usr/bin/python3: No module named robot
```

Remove the container:
```
sudo docker rm /test
```

Now, run it directly in the background by starting it in detached mode with __-d__.

```
sudo docker run -d --name test -ti output/robot-docker
```

And by running the following command this will print the
RobotFramework help:

```
sudo docker exec test sh -c "python3 -m robot --help"
```

Stop and remove the container:

```
sudo docker stop /test
sudo docker rm /test
```

Now we add ```ENTRYPOINT ["python3", "-m", "robot"]``` to our Dockerfile. 

Rebuild the container again:
```
sudo docker build -t output/robot-docker .
```

And run it to print the help:

```
sudo docker run -ti output/robot-docker --help
```

And now we can just run our robot file with the container:
```
sudo docker run -v `pwd`:`pwd` -w `pwd` -ti output/robot-docker example7.robot
```

Take care of your current working directory on the host. Else
you will see:

```
vagrant@linux:/vagrantsync/docker$ sudo docker run -v `pwd`:`pwd` -w `pwd` -ti output/robot-docker example7.robot
[ ERROR ] Parsing 'example7.robot' failed: Data source does not exist.

Try --help for usage information.
```

So change the directory to __/vagrantsync__ and run the container their since our 
robot file is located here.
```
vagrant@linux:/vagrantsync$ ls
docker  example7.robot  provision.sh  Vagrantfile
```

Since we mounted the currend working directory, we already get the logs:

```
vagrant@linux:/vagrantsync$ sudo docker run -v `pwd`:`pwd` -w `pwd` -ti output/robot-docker example7.robot
==============================================================================
Example7                                                                      
==============================================================================
Good Example                                                          | PASS |
------------------------------------------------------------------------------
Example7                                                              | PASS |
1 critical test, 1 passed, 0 failed
1 test total, 1 passed, 0 failed
==============================================================================
Output:  /vagrantsync/output.xml
Log:     /vagrantsync/log.html
Report:  /vagrantsync/report.html
vagrant@linux:/vagrantsync$ ls
docker  example7.robot  log.html  output.xml  provision.sh  report.html  Vagrantfile
```

But we can just pass more arguments to RobotFramework to save the log files in a better way:

```
vagrant@linux:/vagrantsync$ sudo docker run -v `pwd`:`pwd` -w `pwd` -ti output/robot-docker --outputdir logs/7 example7.robot
==============================================================================
Example7                                                                      
==============================================================================
Good Example                                                          | PASS |
------------------------------------------------------------------------------
Example7                                                              | PASS |
1 critical test, 1 passed, 0 failed
1 test total, 1 passed, 0 failed
==============================================================================
Output:  /vagrantsync/logs/7/output.xml
Log:     /vagrantsync/logs/7/log.html
Report:  /vagrantsync/logs/7/report.html

vagrant@linux:/vagrantsync$ ls
docker  example7.robot  log.html  logs  output.xml  provision.sh  report.html  Vagrantfile

vagrant@linux:/vagrantsync$ ls logs/7/
log.html  output.xml  report.html
```
