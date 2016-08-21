decl
	integer status;
	integer option;
	integer newseek;
	string name;
	string word;
enddecl
integer main()
{
	print("option");
	read(option);
	print ("filename");	
	read(name);
	if (option==1) then     //CREATE
		status = Create(name);
		print(status);
	else 
		if (option==2) then  //OPEN
			status=Open(name);
			print(status);
		endif;
		if (option==3) then     //OPEN->CLOSE
			status=Open(name);
			print(status);
			print("Opened");
			option=Close(status);
			print(option);
		endif;
	endif;	
	if (option==4) then   //DELETE
		status=Delete(name);
		print(status);
	endif;
	if (option==5) then   //OPEN->DELETE->CLOSE->DELETE
		status=Open(name);
		print(status);
		option=Delete(name);
		print(option);
		option=Close(status);
		print(option);
		option=Delete(name);
		print(option);
	endif;
	if (option==6) then //WRITE
		status=Open(name);
		print(status);
		print("New Word");
		read(name);
		option=Write(status,name);
		print(option);
	endif;
	if (option==7) then //SEEK
		status=Open(name);
		print(status);
		print("New Word");
		read(name);
		print("newSeek");
		read(newseek);
		option=Seek(status,newseek);
		print(option);
		option=Write(status,name);
		print(option);
		print("New Word");
		read(name);
		print("newSeek");
		read(newseek);
		option=Seek(status,newseek);
		print(option);
		option=Write(status,name);
		print(option);
	endif;
	if (option==8) then
		status=Open(name);
		print(status);
		print("newSeek");
		read(newseek);
		option=Seek(status,newseek);
		option=Read(status,word);
		print(word);
		print(status);
	endif;
	return 0;
}
