from robot import rebot

testsuites_list = ['/vagrantsync/examples/example3/logs/3/output.xml', '/vagrantsync/examples/example3/logs/3.1/output.xml']
# Rebot takes a pointer to the list
rebot (*testsuites_list, report='logs/merge3/merge3_report.html', log='NONE')