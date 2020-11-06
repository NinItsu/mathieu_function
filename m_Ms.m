function y=m_Ms(n,j,u,q,nmax)
switch j
    case 1
u1=sqrt(q).*exp(-u);
u2=sqrt(q).*exp(u);
Aon=mathieu_B(n,q,nmax);
m=[0:nmax].';
im=(-1).^m;
im=repmat(im,[1,size(u)]);
m=repmat(m,[1,size(u)]);
u1=repmat(u1.',[nmax+1,1]);
u2=repmat(u2.',[nmax+1,1]);
if length(n)==1
if rem(n,2)==0
    y=(-1).^(n/2)./Aon(1,1).*Aon.'*(im.*(-1).*(besselj(m,u1).*besselj(m+2,u2)-besselj(m,u2).*besselj(m+2,u1)));
else
    y=(-1).^((n-1)/2)./Aon(1,1).*Aon.'*(im.*(besselj(m,u1).*besselj(m+1,u2)-besselj(m,u2).*besselj(m+1,u1)));
end
else
    for idx=1:length(n)
        if rem(n(idx),2)==0
            y(idx,:)=(-1).^(n(idx)./2)./Aon(1,idx).*Aon(:,idx).'*(im.*(-1).*(besselj(m,u1).*besselj(m+2,u2)-besselj(m,u2).*besselj(m+2,u1)));
        else
            y(idx,:)=(-1).^((n(idx)-1)./2)./Aon(1,idx).*Aon(:,idx).'*(im.*(besselj(m,u1).*besselj(m+1,u2)-besselj(m,u2).*besselj(m+1,u1)));
        end
    end
end

    case 2
u1=sqrt(q).*exp(-u);
u2=sqrt(q).*exp(u);
Aon=mathieu_B(n,q,nmax);
m=[0:nmax].';
im=(-1).^m;
im=repmat(im,[1,size(u)]);
m=repmat(m,[1,size(u)]);
u1=repmat(u1.',[nmax+1,1]);
u2=repmat(u2.',[nmax+1,1]);
if length(n)==1
if rem(n,2)==0
    y=(-1).^(n/2)./Aon(1,1).*Aon.'*(im.*(-1).*(besselj(m,u1).*bessely(m+2,u2)-bessely(m,u2).*besselj(m+2,u1)));
else
    y=(-1).^((n-1)/2)./Aon(1,1).*Aon.'*(im.*(besselj(m,u1).*bessely(m+1,u2)-bessely(m,u2).*besselj(m+1,u1)));
end
else
    for idx=1:length(n)
        if rem(n(idx),2)==0
            y(idx,:)=(-1).^(n(idx)./2)./Aon(1,idx).*Aon(:,idx).'*(im.*(-1).*(besselj(m,u1).*bessely(m+2,u2)-bessely(m,u2).*besselj(m+2,u1)));
        else
            y(idx,:)=(-1).^((n(idx)-1)./2)./Aon(1,idx).*Aon(:,idx).'*(im.*(besselj(m,u1).*bessely(m+1,u2)-bessely(m,u2).*besselj(m+1,u1)));
        end
    end
end
        
    case 3
y=m_Ms(n,1,u,q,nmax)+1i.*m_Ms(n,2,u,q,nmax);

    case 4
y=m_Ms(n,1,u,q,nmax)-1i.*m_Ms(n,2,u,q,nmax);
end
end