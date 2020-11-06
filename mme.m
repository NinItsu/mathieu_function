function y=mme(n,v,q,nmax)
    plus=find(n>=0);
    minus=find(n<0);
    if plus
        y(plus,:)=m_ce(n(plus),v,q,nmax).*2^(1/2);
    end
    if minus
        y(minus,:)=m_se(-n(minus),v,q,nmax)*2^(1/2)/1i;
    end
end