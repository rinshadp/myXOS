decl
	integer statusA;
	integer seekA;
	integer seekB;
	integer seekC;
	integer countA;
	integer countB;
	integer statusB;
	integer i;
	integer a;
	integer b;
	integer statusC;
enddecl
integer main(){
	statusA=Open("a.dat");
	statusB=Open("b.dat");
	seekA=1;
	seekB=1;
	countA=0;
	countB=0;
	statusC=Create("c.dat");
	statusC=Open("c.dat");
	while(countA!=200 && countB!=200) do
		seekA=Read(statusA,a);
		seekB=Read(statusB,b);
		if(seekA==-1 || seekB==-1) then
			break;
		endif;
		if(a>b) then
			seekC=Write(statusC,b);
			seekA=Seek(statusA,-1);
			countB=countB+1;
		else
			seekC=Write(statusC,a);
			seekB=Seek(statusB,-1);
			countA=countA+1;
		endif;
	endwhile;
	if(countA==200) then
		while(countB!=200) do
			seekC=Write(statusC,b);
			seekB=Read(statusB,b);
			countB=countB+1;
		endwhile;
	else
		while(countA!=200) do
			seekC=Write(statusC,a);
			seekA=Read(statusA,a);
			countA=countA+1;
		endwhile;
	endif;
	seekC=Close(statusC);
	seekA=Close(statusA);
	seekB=Close(statusB);
	seekA=Signal();
	return 0;
}
