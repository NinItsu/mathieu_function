function y=m_Ms_d(n,j,u,q,nmax)
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
u=repmat(u.',[nmax+1,1]);
if length(n)==1
if rem(n,2)==0
    y=(-1).^(n/2)./Aon(1,1).*Aon.'*(im.*(-1).*(4.*m+4).*(besselj(m,u1).*besselj(m,u2)+cosh(2.*u).*besselj(m+1,u1).*besselj(m+1,u2)-(m+1).*(besselj(m+1,u1).*besselj(m,u2)./u1+besselj(m,u1).*besselj(m+1,u2)./u2)));
else
    y=(-1).^((n-1)/2)./Aon(1,1).*Aon.'*(im.*((u1+u2).*(besselj(m,u1).*besselj(m,u2)+besselj(m+1,u1).*besselj(m+1,u2))-(m.*2+1).*(besselj(m+1,u1).*besselj(m,u2)+besselj(m,u1).*besselj(m+1,u2))));
end
else
    for idx=1:length(n)
        if rem(n(idx),2)==0
            y(idx,:)=(-1).^(n(idx)./2)./Aon(1,idx).*Aon(:,idx).'*(im.*(-1).*(4.*m+4).*(besselj(m,u1).*besselj(m,u2)+cosh(2.*u).*besselj(m+1,u1).*besselj(m+1,u2)-(m+1).*(besselj(m+1,u1).*besselj(m,u2)./u1+besselj(m,u1).*besselj(m+1,u2)./u2)));
        else
            y(idx,:)=(-1).^((n(idx)-1)./2)./Aon(1,idx).*Aon(:,idx).'*(im.*((u1+u2).*(besselj(m,u1).*besselj(m,u2)+besselj(m+1,u1).*besselj(m+1,u2))-(m.*2+1).*(besselj(m+1,u1).*besselj(m,u2)+besselj(m,u1).*besselj(m+1,u2))));
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
u=repmat(u.',[nmax+1,1]);
if length(n)==1
if rem(n,2)==0
    y=(-1).^(n/2)./Aon(1,1).*Aon.'*(im.*(-1).*(4.*m+4).*(besselj(m,u1).*bessely(m,u2)+cosh(2.*u).*besselj(m+1,u1).*bessely(m+1,u2)-(m+1).*(besselj(m+1,u1).*bessely(m,u2)./u1+besselj(m,u1).*bessely(m+1,u2)./u2)));
else
    y=(-1).^((n-1)/2)./Aon(1,1).*Aon.'*(im.*((u1+u2).*(besselj(m,u1).*bessely(m,u2)+besselj(m+1,u1).*bessely(m+1,u2))-(m.*2+1).*(besselj(m+1,u1).*bessely(m,u2)+besselj(m,u1).*bessely(m+1,u2))));
end
else
    for idx=1:length(n)
        if rem(n(idx),2)==0
            y(idx,:)=(-1).^(n(idx)./2)./Aon(1,idx).*Aon(:,idx).'*(im.*(-1).*(4.*m+4).*(besselj(m,u1).*bessely(m,u2)+cosh(2.*u).*besselj(m+1,u1).*bessely(m+1,u2)-(m+1).*(besselj(m+1,u1).*bessely(m,u2)./u1+besselj(m,u1).*bessely(m+1,u2)./u2)));
        else
            y(idx,:)=(-1).^((n(idx)-1)./2)./Aon(1,idx).*Aon(:,idx).'*(im.*((u1+u2).*(besselj(m,u1).*bessely(m,u2)+besselj(m+1,u1).*bessely(m+1,u2))-(m.*2+1).*(besselj(m+1,u1).*bessely(m,u2)+besselj(m,u1).*bessely(m+1,u2))));
        end
    end
end
        
    case 3
y=m_Ms_d(n,1,u,q,nmax)+1i.*m_Ms_d(n,2,u,q,nmax);

    case 4
y=m_Ms_d(n,1,u,q,nmax)-1i.*m_Ms_d(n,2,u,q,nmax);
end
end