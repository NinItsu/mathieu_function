function Sen=m_ce(n,v,q,nmax)
v=v.';
if length(n)==1
if rem(n,2)==0
    m=[0:nmax].';
    Aen=mathieu_A(n,q,nmax);
    Sen=Aen.'*cos(2*m*v);
else
    m=[0:nmax].';
    Aen=mathieu_A(n,q,nmax);
    Sen=Aen.'*cos((2*m+1)*v);
end
else
    Aen=mathieu_A(n,q,nmax);
    m=[0:nmax].';
    for idx=1:length(n)
        if rem(n(idx),2)==0
            Sen(idx,:)=Aen(:,idx).'*cos(2*m*v);
        else
            Sen(idx,:)=Aen(:,idx).'*cos((2*m+1)*v);
        end
    end
end