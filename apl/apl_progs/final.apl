integer main()
{
	integer childpid, retval;
	childpid = Fork();
	print("brkpoint rec");
	breakpoint;
	if(childpid == -2) then
		print("AFDF");
		retval = Exec("final.xsm");
		print(retval);
	else
		//while(childpid != -1) do
			print(childpid);
			print("adafd");
		//endwhile;
	endif;
	return 0;
}
