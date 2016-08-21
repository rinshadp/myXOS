decl
	integer prime(integer k),i,n,p;
enddecl
integer prime(integer k){
	integer j,m;
	j=2;
	m=1;
	while(j<=k/2) do
		if(k%j==0) then
			m=0;
			break;
		endif;
		j=j+1;
	endwhile;
	return m;
}
integer main(){
	breakpoint;
	read(n);
	i=2;
	while(i<=n) do
		p=prime(i);
		if(p==1) then
			print(i);
		endif;
		i=i+1;
	endwhile;
	return 0;
}
