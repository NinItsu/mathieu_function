function y=mM_d(n,j,u,q,nmax)
    plus=find(n>=0);
    minus=find(n<0);
    if plus
        y(plus,:)=m_Mc_d(n(plus),j,u,q,nmax);
    end
    if minus
        y(minus,:)=m_Ms_d(-n(minus),j,u,q,nmax).*((-1).^(n(minus))*ones(1,length(u)));
    end
end