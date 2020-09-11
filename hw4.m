N=1503;                        %number of experiments
lambda=160;		       %lambda value 
p1=0.012; p2=0.79;	       %connection probabilities 	
totalshipmenta=zeros(N,1);      %vector for holding number of shipments for every experiment   
totalshipmentb=zeros(N,1);
ratioa=zeros(N,1);	       %vector for holding ratio of triangle number to triplet number for every experiment	
ratiob=zeros(N,1);




for k=1:N;
	edges=poissrnd(lambda);	 %random lambda values for number of edges
	X=0;  %number of triangles
	triplets=1;   %total number of triplets (i initially give 1 because triplets must be different than 0,because i apply X/triplets at the end of the loop) 
	if edges==0	%low probability but i also added this case, and if edges came 0,number of triangles is directly set to 0
		X=0;
	else
		triplets=edges*(edges-1)*(edges-2)/6;   %RHS equals C(edges,3) which is equal to total number of triplets
		matrix=zeros(edges,edges);     %creating edgesXedges matrix,and i will fill it in the loop
		for i=1:edges;
			U=rand(edges,1);			%create random vector
			B=(U<p1);				%filling vector with bernoulli trials
			matrix(i,1:edges)=B;			%filling ith row of matrix with that vector
		end;
		matrix= matrix- tril(matrix,-1) + triu(matrix);      %copy upper part to lower part to make it symmetric      
		output=matrix - diag(diag(matrix));		      %set diagonal elements to 0	
		X=trace(output^3)/6;				      %number of triangles	
	end
	totalshipmenta(k)=X;      %filling kth index of totalshipment vector with number of triangles
	ratioa(k)=X/triplets;      %filling kth index of ratio vector with ratio of last experiment
end;

probabilityship=mean(totalshipmenta<=1);     %Then,we find how many experiment gave us less than or equal to 1 triangle.And mean of this vector gives our probability.

fprintf('Part a probability = %f\n',probabilityship);
	







for k=1:N;
	edges=poissrnd(lambda);
	X=0;
	triplets=1;   %total number of triplets (i initially give 1 because triplets must be different than 0,because i apply X/triplets at the end of the loop) 
	if edges==0
		X=0;
	else
		triplets=edges*(edges-1)*(edges-2)/6;    %RHS equals C(edges,3) which is equal to total number of triplets
		matrix=zeros(edges,edges);            %rest is the same as part a      
		for i=1:edges;
			U=rand(edges,1);
			B=(U<p2);
			matrix(i,1:edges)=B;			    
		end;
		matrix= matrix- tril(matrix,-1) + triu(matrix);             
		output=matrix - diag(diag(matrix));		      	
		X=trace(output^3)/6;				       
	end
	totalshipmentb(k)=X;      %filling kth index of totalshipment vector with number of triangles
	ratiob(k)=X/triplets;         %filling kth index of ratio vector with ratio of last experiment
end;	

probabilityrate=mean(ratiob>0.5);     %Then,we find how many experiments gave us greater than 0.5 ratio.And mean of this vector gives our probability.

fprintf('Part b probability = %f\n',probabilityrate);








X_A=mean(totalshipmenta);     %Expected values are simply equal to mean of totalshipment and ratio vectors
X_B=mean(totalshipmentb);
Y_A=mean(ratioa);
Y_B=mean(ratiob);
fprintf('X_A = %f\n',X_A);
fprintf('X_B = %f\n',X_B);
fprintf('Y_A = %f\n',Y_A);
fprintf('Y_B = %f\n',Y_B);











stdxa=std(totalshipmenta);    %Standard deviations are simply equal to standard deviations of totalshipment and ratio vectors
stdxb=std(totalshipmentb);


stdya=std(ratioa);   
stdyb=std(ratiob);



fprintf('Standard deviation of X_A = %f\n',stdxa);
fprintf('Standard deviation of X_B = %f\n',stdxb);

fprintf('Standard deviation of Y_A = %f\n',stdya);
fprintf('Standard deviation of Y_B = %f\n',stdyb);
