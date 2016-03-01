function route = GradientBasedPlanner (f, start_coords, end_coords, max_its)
% GradientBasedPlanner : This function plans a path through a 2D
% environment from a start to a destination based on the gradient of the
% function f which is passed in as a 2D array. The two arguments
% start_coords and end_coords denote the coordinates of the start and end
% positions respectively in the array while max_its indicates an upper
% bound on the number of iterations that the system can use before giving
% up.
% The output, route, is an array with 2 columns and n rows where the rows
% correspond to the coordinates of the robot as it moves along the route.
% The first column corresponds to the x coordinate and the second to the y coordinate
 [gy, gx] = gradient (-f);
 route = start_coords; 
 current = start_coords ; 
for k=1:max_its 
	% new position of robot = start_cords + gradient 
	i = round(current(1)); 
	j = round(current(2)); 
	gx_current = gx(j,i) ; 
	gy_current = gy(j,i) ; 
    ngy = gx_current/norm([gx_current gy_current]) ; 
    ngx = gy_current/norm([gx_current gy_current]) ;
    %ngx = gx_current(1)/norm([gx_current gy_current]) ; 
	%ngy = gy_current(2)/norm([gx_current gy_current]) ; 
	%new_p = current ; 
	new_p(1) = current(1) + ngx ; 
	new_p(2) = current(2) + ngy ; 
	route = [route ; new_p]
	if (pdist([new_p ; end_coords],'euclidean') < 2 ) 
		break ; 
	end 
	current = new_p ; 
end
% *******************************************************************
end
