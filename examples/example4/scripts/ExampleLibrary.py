class ExampleLibrary:
    # http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#test-library-scope
    # A new instance is created for every test suite. 
    # The lowest-level test suites, created from test case files and containing test cases, 
    # have instances of their own, and higher-level suites all get their own instances for their possible setups and teardowns.
    ROBOT_LIBRARY_SCOPE = 'TEST SUITE'

    def __init__(self):
        self._counter = 0

    def count(self):
        self._counter += 1
        print self._counter

    def clear_counter(self):
        self._counter = 0
    
    def _nokeyword(self):
        print "This is not a keyword because the functions starts with _"