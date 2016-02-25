P1=[666 358; 737 358; 683 270];
P2=[666 322; 791 322; 791 197];
% P1 = [-1 0; 0 0; 0 1];
% P2 = [1 0; 2 0; 1.5 1];
% P1 = [1 1;3 2;2 3];
% P2 = [4 2;6 1;5 5];
m = [];
c =[];
m(1) = (P1(2,2)-P1(1,2)) / (P1(2,1)-P1(1,1));
if (m(1)==Inf)
    c(1) = P1(1,1);
else 
    c(1) = P1(1,2)- m(1)*P1(1,1);
end

m(2) = (P1(3,2)-P1(2,2)) / (P1(3,1)-P1(2,1));
if (m(2)==Inf)
    c(2) = P1(2,1);
else 
    c(2) = P1(2,2)- m(2)*P1(2,1);
end

m(3) = (P1(3,2)-P1(1,2) )/ (P1(3,1)-P1(1,1));
if (m(3)==Inf)
    c(3) = P1(1,1);
else 
    c(3) = P1(1,2)- m(3)*P1(1,1); 
end
%second triangle begins here
m(4) = (P2(2,2)-P2(1,2) )/ (P2(2,1)-P2(1,1));
if (m(4)==Inf)
    c(4) = P2(1,1);
else
    c(4) = P2(1,2)- m(4)*P2(1,1);    
end

m(5) = (P2(3,2)-P2(2,2)) / (P2(3,1)-P2(2,1));
if (m(5)==Inf)
    c(5) = P2(2,1);
else
    c(5) = P2(2,2)- m(5)*P2(2,1);
end

m(6) = (P2(3,2)-P2(1,2))/ (P2(3,1)-P2(1,1));
if(m(6)==Inf)
    c(6) = P2(1,1);
else
    c(6) = P2(1,2)- m(6)*P2(1,1); 
end
% display('correct till here')
%checking for vertices of tri 2 with eqns of tri 1
s = [];
i=1;
j=1;
for j = 1:3 %looping for eqns
    for i=1:3 %looping for vertices
        if (m(j)==Inf)
            s(i,j) = P2(i,1) - c(j);
        else
            s(i,j) = (P2(i,2) - m(j)*P2(i,1) - c(j));
        end
    end
end
%third vertex for P1
o1 = [];
if (m(1)==Inf)
     o1(1) = (P1(3,1) - c(1));
else
     o1(1) = (P1(3,2) - m(1)*P1(3,1) - c(1));
end

if (m(2)==Inf)
     o1(2) = (P1(1,1) - c(2));
else
     o1(2) = (P1(1,2) - m(2)*P1(1,1) - c(2));
end

if (m(3)==Inf)
     o1(3) = (P1(2,1) - c(3));
else
     o1(3) = (P1(2,2) - m(3)*P1(2,1) - c(3));
end
o1 = o1';
i=1;
new = NaN(3,3);
for i=1:3
    new(:,i) = s(:,i).*o1(i);
end
new2 = (new<0); 
k = 1;
for k =1:3
    if all(new2(:,k)==1)
        flag = false;
        break;
    else
        flag = true;
    end
end
display(flag)
%flag is false if the triangls don't intersect
