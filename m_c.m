function y=m_c(s,n,q,nmax)
% c_s^n(q)
    if rem(s,2)~=0
        y=0;
    else
        if n>=0
            A=mathieu_A(n,q,nmax);
            if n+s==0
                if rem(n,2)==1
                    y=0;
                else
                    y=sqrt(2)*A(1);
                end
            elseif n+s>0
                y=1/sqrt(2)*A(floor((n+s)/2)+1);
            elseif n+s<0
                y=1/sqrt(2)*A(floor((-n-s)/2)+1);
            end
        else
            B=mathieu_B(-n,q,nmax);
            if n+s==0
                y=0;
            elseif n+s>0
                y=-1/sqrt(2)*B(floor(((n+s)+1)/2));
            elseif n+s<0
                y=1/sqrt(2)*B(floor(((-n-s)+1)/2));
            end
        end    
    end
end