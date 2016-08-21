decl
	integer status;
	integer prod;
	integer n;
	integer i;
	integer seekA;
	integer seekB;
	integer statusB;
	string ch;
enddecl
integer main(){
	print("Enter n");
	read(n);
	i=1;
	prod=1;
	status=Create("a.dat");
	status=Open("a.dat");
	while(i<=1000) do
		prod=n*i;
		seekA=Write(status,prod);
		if(seekA==-1) then
			break;
		endif;
		i=i+1;
	endwhile;
	if(seekA!=-1) then
		print("WriteASucceess");
	else
		print("WriteAFailed");
	endif;
	status=Close(status);
	status=Open("a.dat");
	seekA=Seek(status,1000);
	statusB=Create("b.dat");
	statusB=Open("b.dat");
	seekA=Seek(status,-1);
	while(seekA!=-1) do
		seekB=Read(status,prod);
		breakpoint;
		seekB=Write(statusB,prod);
		breakpoint;
		seekA=Seek(status,-2);
	endwhile;
	if(seekB!=-1) then
		print("WriteBSucceess");
	else
		print("WriteBFailed");
	endif;
	print("Delete a?y/n");
	read(ch);
	if(ch=="y") then
		seekA=Close(status);
		seekA=Delete("a.dat");
	endif;	
	return 0;
}
