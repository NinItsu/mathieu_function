function y=mM(n,j,u,q,nmax)
    plus=find(n>=0);
    minus=find(n<0);
    if plus
        y(plus,:)=m_Mc(n(plus),j,u,q,nmax);
    end
    if minus
        y(minus,:)=m_Ms(-n(minus),j,u,q,nmax).*((-1).^(n(minus))*ones(1,length(u)));
    end
end