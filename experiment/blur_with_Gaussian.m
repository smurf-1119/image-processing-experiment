function [H] = filter_mohu(m,n,k)
%blur_with_Gaussian
%   
for u=1:m
   for v=1:n 
        H(u,v)=exp((-k)*(((u-m/2)^2+(v-n/2)^2)^(5/6)));
   end
end  
end

