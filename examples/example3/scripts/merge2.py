from robot import rebot

with open('/vagrantsync/examples/example3/logs/example3_stdout_log.txt', 'w') as stdout:
    rebot('/vagrantsync/examples/example3/logs/3/output.xml', '/vagrantsync/examples/example3/logs/3.1/output.xml', report='logs/merge2/twologs.html', log='NONE', stdout=stdout)