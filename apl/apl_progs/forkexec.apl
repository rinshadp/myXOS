integer main()
{
	integer pid;
	print("Before Fork");
	pid = Fork();
	print("qw");
	breakpoint;
	if(pid==-2) then
		print("EX");
		pid=Exec("even.xsm");
	else
		print(1);
		breakpoint;
		print(3);
		print(5);
		print(7);
		print(9);
		print(11);
		print(13);
		print(15);
		print(17);
		print(19);
	endif;	
	breakpoint;
	return 0;
}
