function [Intersect] = SAT(P1,P2)

P1 = [P1;P1(1,:)];
P2 = [P2,;P2(1,:)];
Intersect = true;

for j = 2:4
    x = P1(j,1) - P1(j-1,1);
    y = P1(j,2) - P1(j-1,2); 
    
    x_ref = P1(j-1,1);
    y_ref = P1(j-1,2);
    
    x_rot = -y;
    y_rot = x;
    Intersect = CheckSide(P1, P2, x_rot, y_rot,x_ref,y_ref);   
  if (Intersect == false)
    break;
  end
end
    if (Intersect == true)
        for j=2:4
            x = P2(j,1) - P2(j-1,1); 
            y = P2(j,2) - P2(j-1,2);
            x_ref = P2(j-1,1);
            y_ref = P2(j-1,2);
    
    % compute the perpendcular to the edge vector
            x_rot = -y;
            y_rot = x;
            Intersect = CheckSide(P1,P2, x_rot,y_rot,x_ref,y_ref);
    if (Intersect == false)
      break;
    end    
        end  
    end
end

function intersect = CheckSide(P1,P2,x_rot,y_rot,x_ref,y_ref)
    
    intersect = true;
    side1 = zeros(1,3);
    side2 = zeros(1,3);
    for k=1:3
        side1(k) = sign(x_rot * (P1(k,1) - x_ref) + y_rot * (P1(k,2) - y_ref));    
    end
    for k=1:3
        side2(k) = sign(x_rot * (P2(k,1) - x_ref) + y_rot * (P2(k,2) - y_ref));    
    end
    if ( min(side1) > -1 && max(side2) < 1) || ( max(side1) < 1 && min(side2) > -1)
        intersect = 0;
    end
end