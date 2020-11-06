function Son=m_se(n,v,q,nmax)
v=v.';
if length(n)==1
if rem(n,2)==0
    m=[1:nmax+1].';
    Aon=mathieu_B(n,q,nmax);
    Son=Aon.'*sin(2*m*v);
else
    m=[0:nmax].';
    Aon=mathieu_B(n,q,nmax);
    Son=Aon.'*sin((2*m+1)*v);
end
else
    Aon=mathieu_B(n,q,nmax);
    m=[0:nmax].';
    for idx=1:length(n)
        if rem(n(idx),2)==0
            Son(idx,:)=Aon(:,idx).'*sin(2*(m+1)*v);
        else
            Son(idx,:)=Aon(:,idx).'*sin((2*m+1)*v);
        end
    end
end