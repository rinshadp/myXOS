decl
	integer statusA;
	integer seekA;
	integer seekB;
	integer statusB;
	integer prod;
	integer i;
	integer a;
	integer b;
	integer statusC;
	integer seekC;
enddecl
integer main(){
	statusA=Create("a.dat");
	statusA=Open("a.dat");
	i=0;
	while(i<=1000) do
		prod=3*i;
		seekA=Write(statusA,prod);
		if(seekA==-1) then
			break;
		endif;
		i=i+1;
	endwhile;
	statusA=Close(statusA);
	statusB=Create("b.dat");
	statusB=Open("b.dat");
	i=0;
	while(i<=1000) do
		prod=5*i;
		seekA=Write(statusB,prod);
		if(seekB==-1) then
			break;
		endif;
		i=i+1;
	endwhile;
	statusB=Close(statusB);
	statusA=Open("a.dat");
	statusB=Open("b.dat");
	seekA=1;
	seekB=1;
	statusC=Create("c.dat");
	statusC=Open("c.dat");
	while(seekA!=-1 && seekB!=-1) do
		seekA=Read(statusA,a);
		seekB=Read(statusB,b);
		if(seekA==-1 || seekB==-1) then
			break;
		endif;
		if(a==3000) then
			seekC=Write(statusC,a);
			seekA=-1;
			break;
		endif;
		if(a>b) then
			seekC=Write(statusC,b);
			seekA=Seek(statusA,-1);
		else
			seekC=Write(statusC,a);
			seekB=Seek(statusB,-1);
		endif;
	endwhile;
	if(seekA==-1) then
		while(seekB!=-1) do
			seekC=Write(statusC,b);
			seekB=Read(statusB,b);
		endwhile;
	else
		while(seekA!=-1) do
			seekC=Write(statusC,a);
			seekA=Read(statusA,a);
		endwhile;
	endif;
	return 0;
}
