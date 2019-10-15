function B=logbernoulli_pdf(y,theta)
B= y*log(theta)+(1-y)*log(1-theta);
end