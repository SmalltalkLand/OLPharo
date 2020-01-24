startup-shutdown
startup
| theString a p |
theString := './built'.
	a := self ffiCall: #(int fork()) .
	self ffiCall: #(int pipe(int[]* p)).
	(a = 0) ifTrue: [ | p0 b |
		p0 := p at: 1.
		b := 3.
		self ffiCall: #(int dup2(int p0, int b)). ^self ffiCall: #(void execl(char* theString)) 
		].
	theDescriptor := {a. p}