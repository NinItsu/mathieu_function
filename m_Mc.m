function y=m_Mc(n,j,u,q,nmax)
switch j
    case 1
u1=sqrt(q).*exp(-u);
u2=sqrt(q).*exp(u);
Aen=mathieu_A(n,q,nmax);
m=[0:nmax].';
im=(-1).^m;
im=repmat(im,[1,size(u)]);
m=repmat(m,[1,size(u)]);
u1=repmat(u1.',[nmax+1,1]);
u2=repmat(u2.',[nmax+1,1]);
if length(n)==1
if rem(n,2)==0
    y=(-1).^(n/2)./Aen(1,1).*Aen.'*(im.*besselj(m,u1).*besselj(m,u2));
%     y=(-1).^(n/2)./Aen(3,1).*Aen.'*(im.*(besselj(m-1,u1).*besselj(m+1,u2)+besselj(m+1,u1).*besselj(m-1,u2)));
else
    y=(-1).^((n-1)/2)./Aen(1,1).*Aen.'*(im.*(besselj(m,u1).*besselj(m+1,u2)+besselj(m,u2).*besselj(m+1,u1)));
end
else
    for idx=1:length(n)
        if rem(n(idx),2)==0
            y(idx,:)=(-1).^(n(idx)./2)./Aen(1,idx).*Aen(:,idx).'*(im.*besselj(m,u1).*besselj(m,u2));
%             y(idx,:)=(-1).^(n(idx)./2)./Aen(3,idx).*Aen(:,idx).'*(im.*(besselj(m-1,u1).*besselj(m+1,u2)+besselj(m+1,u1).*besselj(m-1,u2)));
        else
            y(idx,:)=(-1).^((n(idx)-1)./2)./Aen(1,idx).*Aen(:,idx).'*(im.*(besselj(m,u1).*besselj(m+1,u2)+besselj(m,u2).*besselj(m+1,u1)));
        end
    end
end

    case 2
u1=sqrt(q).*exp(-u);
u2=sqrt(q).*exp(u);
Aen=mathieu_A(n,q,nmax);
m=[0:nmax].';
im=(-1).^m;
im=repmat(im,[1,size(u)]);
m=repmat(m,[1,size(u)]);
u1=repmat(u1.',[nmax+1,1]);
u2=repmat(u2.',[nmax+1,1]);
if length(n)==1
if rem(n,2)==0
    y=(-1).^(n/2)./Aen(1,1).*Aen.'*(im.*besselj(m,u1).*bessely(m,u2));
else
    y=(-1).^((n-1)/2)./Aen(1,1).*Aen.'*(im.*(besselj(m,u1).*bessely(m+1,u2)+bessely(m,u2).*besselj(m+1,u1)));
end
else
    for idx=1:length(n)
        if rem(n(idx),2)==0
            y(idx,:)=(-1).^(n(idx)./2)./Aen(1,idx).*Aen(:,idx).'*(im.*besselj(m,u1).*bessely(m,u2));
%             y(idx,:)=(-1).^(n(idx)./2)./Aen(3,idx).*Aen(:,idx).'*(im.*(besselj(m-1,u1).*bessely(m+1,u2)+besselj(m+1,u1).*bessely(m-1,u2)));
        else
            y(idx,:)=(-1).^((n(idx)-1)./2)./Aen(1,idx).*Aen(:,idx).'*(im.*(besselj(m,u1).*bessely(m+1,u2)+bessely(m,u2).*besselj(m+1,u1)));
        end
    end
end
        
    case 3
y=m_Mc(n,1,u,q,nmax)+1i.*m_Mc(n,2,u,q,nmax);

    case 4
y=m_Mc(n,1,u,q,nmax)-1i.*m_Mc(n,2,u,q,nmax);
end
end