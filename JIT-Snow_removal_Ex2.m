
 % A1, A2, A3 are three manufactures, G1, G2, G3, three comodities, B1, B2,
% B3, B4 four market loctions
S =[0 26 25;58 10 35; 42 24 18 ];  %supplies 
% S(i, j)  number of commodities Gj available in manufacture Ai
D = [25 0 0 ; 30 26 48 ; 20 20 10 ; 10 14 32 ]; % Demands 
% D(i,j) number of comodities of Gj  demanded by destination Bi, the last
% column represent due time
T= [ 10 9 8 5; 5 10 9 8; 4 7 13 6]; % shiping time
% T(i,j) transportation time to ship comodities from manufacture Ai to
% destination Bj
C = [8 12 14 17; 9 7 11 12; 13 14 9 17];  % unit transportation cost
% C(i, j) cost of shipping comodities from manufacture Ai to the
% destination Bj
DT = [ 5; 7; 9; 6]; % Due time 
% due times for goods demanded by Bj market locations
%syms x(i,j,l);
variables = {'x111','x121','x131','x141','x112','x122','x132','x142','x113','x123', 'x133','x143','x211','x221','x231','x241','x212','x222','x232','x242','x213','x223','x233','x243','x311','x321','x331','x341','x312','x322','x332','x342','x313','x323','x333','x343','p1','p2','n1','n2'};
N = length(variables) 
% create variables for indexing 
for v= 1:N 
   eval([variables{v},' = ', num2str(v),';']); 
end
 
% for i=1 : 3
%     for j= 1 :4
%        for l=1 : 3
%          M(i,j,l)=(T(i,j)-DT(j))*x(i,j,l);   
%        end
%     end 
% end
%  
% s=0; 
% for i=1:3
%     for j=1:4
%         for l=1:3
%             s=s+ C(i,j)* x(i,j,l);
%         end
%     end
% end
 
syms x(i,j,l)
% A_symsum=symsum(x(i,j,l),j,1,4);
% %first constraint<=ail for i and l
%  
% syms x(i,j,l)
% B_symsum=symsum(x(i,j,l),i,1,3);
 
 
 
for i=1:3
    for j=1:4
        
            t(i,j)= T(i,j)-DT(j);
        end
end
 
    for i=1:3
    for j=1:4
        
            d(i,j)= max (t(i,j), 0);
        end
    end
   d 
  
    F= max(max(d))  
    
  
  
f=0;
 for i=1:3
     for j=1:4
         for l=1:3
             f=f+ C(i,j)* x(i,j,l);
         end
     end 
 end 
 
f 
 
w1=3 %priority coefficient
 
w2=1  %priority coefficient
 
% syms p1;
% syms p2;
% syms n1;
% syms n2;
sym ('x',[1,333]);
 
 
 
Aeq=zeros(23,40);
Aeq(1,p1)=1;
Aeq(1,n1)=-1;
Aeq(2,[x111,x121,x131,x141,x112,x122,x132,x142,x113,x123, x133,x143,x211,x221,x231,x241,x212,x222,x232,x242,x213,x223,x233,x243,x311,x321,x331,x341,x312,x322,x332,x342,x313,x323,x333,x343,p1,p2,n1,n2])=[8,8,12,9,8,12,14,9,7,13,12,14,17,9,7,11,13,14,14,17,7,11,12,13,14,9,17,11,12,14,9,17,12,9,17,17,0,-1,0,1]; 
Aeq(3,[x111,x121,x131,x141])=[1,1,1,1];
Aeq(4,[x112,x122,x132,x142])=[1,1,1,1];
Aeq(5,[x113,x123,x133,x143])=[1,1,1,1];
Aeq(6,[x211,x221,x231,x241])=[1,1,1,1];
Aeq(7,[x212,x222,x232,x242])=[1,1,1,1];
Aeq(8,[x213,x223,x233,x243])=[1,1,1,1];
Aeq(9,[x311,x321,x331,x341])=[1,1,1,1];
Aeq(10,[x312,x322,x332,x342])=[1,1,1,1];
Aeq(11,[x313,x323,x333,x343])=[1,1,1,1];
Aeq(12,[x111,x211,x311])=[1,1,1];
Aeq(13,[x112,x212,x312])=[1,1,1];
Aeq(14,[x113,x213,x313])=[1,1,1];
Aeq(15,[x121,x221,x321])=[1,1,1];
Aeq(16,[x122,x222,x322])=[1,1,1];
Aeq(17,[x123,x223,x323])=[1,1,1];
Aeq(18,[x131,x231,x331])=[1,1,1];
Aeq(19,[x132,x232,x332])=[1,1,1];
Aeq(20,[x133,x233,x333])=[1,1,1];
Aeq(21,[x141,x241,x341])=[1,1,1];
Aeq(22,[x142,x242,x342])=[1,1,1];
Aeq(23,[x143,x243,x343])=[1,1,1];
 
Aeq
beq = zeros(23,1);
beq(1)=5;
beq(2)=0;
beq(3)=0;
beq(4)=26;
beq(5)=25;
beq(6)=58;
beq(7)=10;
beq(8)=35;
beq(9)=42;
beq(10)=24;
beq(11)=18;
beq(12)=25;
beq(13)=0;
beq(14)=0;
beq(15)=30;
beq(16)=26;
beq(17)=48;
beq(18)=20;
beq(19)=20;
beq(20)=10;
beq(21)=10;
beq(22)=14;
beq(23)=32;
 
beq
 
z= zeros(size(variables));
z([p1 p2]) = [3 1];
 
x=linprog(z,Aeq,beq)


	
