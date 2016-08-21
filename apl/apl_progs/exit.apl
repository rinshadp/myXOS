integer main()
{
	integer pid;
	print("Before Fork");
	pid = Fork();
	if(pid==-2) then
		pid=Exec("even.xsm");
	else
		print("Parent");
		pid=Open("sample.dat");
		Exit();
	endif;
	return 0;
}
