function l=logpostbeta(z,N,a,b)

theta=(0:0.001:1);
for count=1:length(theta)
l(count)=(z+a-1)*log(theta(count))+(N-z+b-1)*log(1-theta(count))-log(beta(z+a,N-z+b));
end