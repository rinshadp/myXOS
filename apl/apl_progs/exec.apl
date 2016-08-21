integer main()
{
	integer pid;
	print("Before Exec");
	pid = Exec("even.xsm");
	print("After Exec");
	return 0;
}
