startup-shutdown
shutdown
| aPid aSignal|
aSignal := 9.
aPid := theDescriptor at: 1.
	 self ffiCall: #( int kill(int aPid, int aSignal) )