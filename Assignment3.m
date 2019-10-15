



%%
%TaskA.2
T=input('Enter the flip sequence in the form +-++-... within quotes ');
PostArray=PostProb(T);
display (T);
display(PostArray);

%%
%Task B.2
clc;
clear;

PY(1)= bernoulli_pdf(0,0.5);
PY(1)= bernoulli_pdf(1,0.5);
PY(1)= bernoulli_pdf(0,0.25);
PY(1)= bernoulli_pdf(1,0.25);

stem(PY,'Filled','linewidth',1);
xticks([1 2 3 4]);
xticklabels({'Y=0,theta=0.5','Y=1,theta=0.5','Y=0,theta=0.25','Y=1,theta=0.25'});

%%
%Task B.3
%the likelihood function for theta for y=1 and y=0

Y=1;
Y1=0;
theta=0;
L(1)=likelihood(Y,theta);
L1(1)=likelihood(Y1,theta);
for count=1:999
    theta=theta+0.001;
    L(count+1)= likelihood(Y,theta);
    L1(count+1)= likelihood(Y1,theta);
end
plot(L);
hold on;
plot(L1);
title('the likelihood function of theta');
legend ('y=1','y=0');

%%
%Task B.4.a
clc;
clear;
theta=0.5;
N=[10 100 1000 10000 100000];

for count1=1:length(N)
    L(count1)=likelihood(N(count1),theta);
end
plot(L,'-bo','linewidth',1);
xlabel('N');
ylabel('likelihood for theta=0.5');
xticks([1 2 3 4 5]);
xticklabels({'10','100','1000','10000','100000'});
%for large values of N, the likelihood function becomes 0

%%
clc;
clear;
theta=0.5;
N=[10 100 1000 10000 100000];

for count1=1:length(N)
    l(count1)=loglikelihood(N(count1),theta);
end
plot(l,'-bo','linewidth',1);
xlabel('N');
ylabel('loglikelihood for theta=0.5');
xticks([1 2 3 4 5]);
xticklabels({'10','100','1000','10000','100000'});

%%
%TaskB.4.c
for count1=1:length(N)
    lexp(count1)=exp(loglikelihood(N(count1),theta));
end
plot(lexp,'-bo','linewidth',1);
xlabel('N');
ylabel('loglikelihood for theta=0.5');
xticks([1 2 3 4 5]);
xticklabels({'10','100','1000','10000','100000'});
%exponentiating the value of N over 100 results in 0

%%
clc;
clear;
theta(1)=0;
y1=[1];
y2=[1,1];
y3=[1,1,0,1];
L1(1)=exp(sum(logbernoulli_pdf(y1,theta(1))));
L2(1)=exp(sum(logbernoulli_pdf(y2,theta(1))));
L3(3)=exp(sum(logbernoulli_pdf(y3,theta(1))));
for count=1:999
    theta(count+1)=theta(count)+0.001;
L1(count+1)=exp(sum(logbernoulli_pdf(y1,theta(count+1))));

L2(count+1)=exp(sum(logbernoulli_pdf(y2,theta(count+1))));

L3(count+1)=exp(sum(logbernoulli_pdf(y3,theta(count+1))));
end
plot(theta,L1,'linewidth',1);

hold on;
plot(theta,L2,'linewidth',1);
hold on;
plot(theta,L3,'linewidth',1);
xlabel('theta');
ylabel('likelihood');
legend('y=[1]','y=[1 1]','y=[1 1 0 1]');

%%
%TaskB.5.a.ii
clc;
clear;
a=1;
b=1;
theta=(0:0.001:1);
y1=[1];
z1=sum(y1);
N1=length(y1);
y2=[1 1];
z2=sum(y2);
N2=length(y2);
y3=[1 1 0 1];
z3=sum(y3);
N3=length(y3);

L1=exp(logpostbeta(z1,N1,a,b));
L2=exp(logpostbeta(z2,N2,a,b));
L3=exp(logpostbeta(z3,N3,a,b));

plot(theta,L1,'linewidth',1);
hold on;
plot(theta,L2,'linewidth',1);
hold on;
plot(theta,L3,'linewidth',1);
xlabel('theta');
ylabel('likelihood');
legend('y=[1]','y=[1 1]','y=[1 1 0 1]');

%%
%Task B.5.a.iii
%reproduce fig 6.4 in the book
clc;
clear;
theta=(0:0.001:1);
z=17;
N=20;
for count=1:length(theta)
likelihoodf(count)=theta(count)^z*(1-theta(count))^(N-z);
end

%column 1
a1=100;
b1=100;
for count=1:length(theta)
priorbeta1(count)=betapdf(theta(count),a1,b1);
end
L1=exp(logpostbeta(z,N,a1,b1));

subplot(3,3,1)
area(theta,priorbeta1);
title('prior beta;mode=0.5');
ylabel('beta(100,100)');

subplot(3,3,4)
area(theta,likelihoodf);
title('likelihood(bernoulli)');

subplot(3,3,7)
area(theta,L1);
title('posterior(beta)');
ylabel('beta(117,103)');

%column 2
a2=18.25;
b2=6.75;
for count=1:length(theta)
priorbeta2(count)=betapdf(theta(count),a2,b2);
end
L2=exp(logpostbeta(z,N,a2,b2));

subplot(3,3,2)
area(theta,priorbeta2);
title('prior beta;mode=0.75');
ylabel('beta(18.25,6.75)');

subplot(3,3,5)
area(theta,likelihoodf);
title('likelihood(bernoulli)');

subplot(3,3,8)
area(theta,L2);
title('posterior(beta)');
ylabel('beta(35.25,9.75)');

%column 3
a3=1;
b3=1;
for count=1:length(theta)
priorbeta3(count)=betapdf(theta(count),a3,b3);
end
L3=exp(logpostbeta(z,N,a3,b3));

subplot(3,3,3)
area(theta,priorbeta3);
title('prior beta');
ylabel('beta(1,1)');

subplot(3,3,6)
area(theta,likelihoodf);
title('likelihood(bernoulli)');

subplot(3,3,9)
area(theta,L3);
title('posterior(beta)');
ylabel('beta(18,4)');
