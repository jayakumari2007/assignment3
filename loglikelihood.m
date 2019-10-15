function l=loglikelihood(N,theta)
tosses = rand(1,N);
for count=1:N
    
if tosses(count)>0.5
    tosses(count)=1;
else
    tosses(count)=0;
end
end
z=sum(tosses);
l=z*log(theta)+(N-z)*log(1-theta);
end