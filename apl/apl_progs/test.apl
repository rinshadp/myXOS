decl
	integer a;
enddecl
integer main(){
	a=Create("a.dat");
	a=Create("b.dat");
	a=Create("c.dat");
	a=Create("d.dat");
	a=Open("a.dat");
	a=Open("b.dat");
	a=Open("c.dat");
	a=Open("d.dat");
	breakpoint;
	return 0;
}
