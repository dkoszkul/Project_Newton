function [ result ,wyznaczniki_podmacierzy] = checkSubmatrices( M )
[m,n]=size(M);
wyznaczniki_podmacierzy=zeros(m,1);
result='local maximum';
size_M=m;
M_temp=M;
%%%%%%%%%%%%%COUNTING DETERMINANTS OF SUBMATRICES%%%%%%%%%%%%%%%%
for i=1:1:size_M
    wyznaczniki_podmacierzy(i)=det(M_temp);
    M_temp(:,n)=[];
    M_temp(m,:)=[];
    [m,n]=size(M_temp);
end
[x,y]=size(wyznaczniki_podmacierzy);
%%%%%%%%%%%%%CHECK WHETHER IS IT A LOCAL MINIMUM%%%%%%%%%%%%%%%%
if(min(wyznaczniki_podmacierzy)>0)
    result='local minimum';
else
    %%%%%%%%%%%%%CHECK WHETHER IS IT A LOCAL MAXIMUM%%%%%%%%%%%%%%%%
    for i=x:-1:1
        numberOfSubmatrix = (x - i)+1;
        if(mod(numberOfSubmatrix,2) == 0 && wyznaczniki_podmacierzy(i) < 0) %if i is even
            result='local minimum or maximum not achieved';
            break;
        else if(mod(numberOfSubmatrix,2) == 1 && wyznaczniki_podmacierzy(i) > 0)
                result='local minimum or maximum not achieved';
                break;
            end
        end
    end
end
end

