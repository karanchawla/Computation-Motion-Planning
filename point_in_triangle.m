function out = point_in_triangle(A,B,C,P)
    x = C(1)-A(1);
    y = C(2)-A(2);
    v0 = [x,y];
    v1 = [B(1)-A(1), B(2)-A(2)];
    v2 = [P(1)-A(1), P(2)-A(2)];
    cross =  @(u,v) u(1)*v(2)-u(2)*v(1);
    u = cross(v2,v0);
    v = cross(v1,v2);
    d = cross(v1,v0);
    if d<0
        u = -u;
        v = -v;
        d = -d;
        
    end
    out = u>=0 && v>=0 && (u+v) <= d;
end
