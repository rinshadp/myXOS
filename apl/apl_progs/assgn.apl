decl 
	integer x;
	integer num;
	integer status;
	integer statusA;
	integer statusB;
	integer i;
	integer j;
	integer A[200];
	integer B[200];
	integer seekA;
	integer pid;
enddecl
integer main(){
	x=5;
	i=0;
	status=Create("a.dat");
	status=Open("a.dat");
	while(i<200) do
		num=(x*x)% 1001;
		x=num;
		seekA=Write(status,num);
		if(seekA==-1) then
			break;
		endif;
		i=i+1;
	endwhile;
	print("a written");
	status=Close(status);
	x=18;
	i=0;
	status=Create("b.dat");
	status=Open("b.dat");
	while(i<200) do
		num=(x*x)% 1001;
		x=num;
		seekA=Write(status,num);
		if(seekA==-1) then
			break;
		endif;
		i=i+1;
	endwhile;
	status=Close(status);
	print("b written");
	//if(i==0) then
	breakpoint;
	status=Fork();
	breakpoint;
	if(status==-2) then
		i=0;
		statusA=Open("a.dat");
		while(i<200) do
			seekA=Read(statusA,num);
			A[i]=num;
			i=i+1;
		endwhile;
		i=0;
		while(i<199) do
			j=0;
			while (j<200-i-1) do
				if(A[j]>A[j+1]) then
					seekA=A[j];
					A[j]=A[j+1];
					A[j+1]=seekA;
				endif;
				j=j+1;
			endwhile;
			i=i+1;
		endwhile;
		//print(A[0]);
		//print(A[199]);
		seekA=Seek(statusA,-1);
		while(i>=0) do
			seekA=Write(statusA,A[i]);
			seekA=Seek(statusA,-2);
			i=i-1;
			//breakpoint;
		endwhile;
		print("a sorted");
		seekA=Close(statusA);
		seekA=Signal();
		Exit();
	else
		i=0;
		statusB=Open("b.dat");
		while(i<200) do
			seekA=Read(statusB,num);
			B[i]=num;
			i=i+1;
		endwhile;
		i=0;
		while(i<199) do
			j=0;
			while (j<200-i-1) do
				if(B[j]>B[j+1]) then
					seekA=B[j];
					B[j]=B[j+1];
					B[j+1]=seekA;
				endif;
				j=j+1;
			endwhile;
			i=i+1;
		endwhile;
		//print(B[0]);
		//print(B[199]);
		seekA=Seek(statusB,-1);
		while(i>=0) do
			seekA=Write(statusB,B[i]);
			seekA=Seek(statusB,-2);
			i=i-1;
			//breakpoint;
		endwhile;
		print("b sorted");
		seekA=Wait(status);
	endif;
	//endif;
	status=Fork();
	if(status==-2) then
		pid=Exec("merge.xsm");
	else
		seekA=Wait(status);
		//if(seekA==0) then
			print("merge complete");
		//endif;
	endif;
	return 0;
}
