integer main()
{
	integer pid;
	print("Before Fork");
	pid = Fork();
	if(pid==-2) then
		print("Child");
	else
		print("Parent");
	endif;
	return 0;
}
