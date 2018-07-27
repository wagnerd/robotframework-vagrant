from robot import rebot

testsuites_list = ['/vagrantsync/examples/example3/logs/3/output.xml', '/vagrantsync/examples/example3/logs/3.1/output.xml']
print("The normal list will have brackets:")
print(testsuites_list)
print("But we can not pass this list to rebot :(")
print("With the str and strip functions we can remove the brackets:")
testsuites_string = str(testsuites_list).strip('[]')
print(testsuites_string)
# Now we can use python (exec) to run rebot with a generated list of output files
exec("retVal = rebot(%s, report='logs/merge4/merge4_report.html', log='NONE')" % testsuites_string)

print("The return value was: [%d]" % retVal)