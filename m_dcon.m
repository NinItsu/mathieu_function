function y=m_dcon(s,n,q,nmax)
    if rem(s,2)~=0
        y=0;
    else
        if n+s>=0
            A=mathieu_A(s+n,q,nmax);
            if n==0
                if rem(s,2)==1
                    y=0;
                else
                    y=(-1)^(s/2)*sqrt(2)*A(1);
                end
            elseif n>0
                y=(-1)^(s/2)*1/sqrt(2)*A(floor(n/2)+1);
            elseif n<0
                y=(-1)^(s/2)*1/sqrt(2)*A(floor(-n/2)+1);
            end
        else
            B=mathieu_B(-s-n,q,nmax);
            if n==0
                y=0;
            elseif n>0
                y=-(-1)^(s/2)*1/sqrt(2)*B(floor((n+1)/2));
            elseif n<0
                y=(-1)^(s/2)*1/sqrt(2)*B(floor((-n+1)/2));
            end
        end    
    end
end