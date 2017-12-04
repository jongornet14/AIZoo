Neurons.Ipop = 2;
Neurons.Epop = 2;

Neurons.A = 10;

pop = Neurons.Ipop + Neurons.Epop;

TimeParams.time = 500;
TimeParams.dt   = 0.01;

T = length(0:TimeParams.dt:TimeParams.time);

Neurons.b = ones(pop,T);
%Neurons.b = sin(linspace(0,TimeParams.time,T));
%Neurons.b(:,1) = 100;
%Neurons.b(:,250/TimeParams.dt) = 1;

K = 50;

% WI = -1.*(rand(pop,Neurons.Ipop) <= K./pop);
% WE = rand(pop,Neurons.Epop) <= K./pop;

% WI = -rand(pop,Neurons.Ipop).*(rand(pop,Neurons.Ipop) <= K./pop);
% WE = rand(pop,Neurons.Epop).*(rand(pop,Neurons.Epop) <= K./pop);

% WI = -1.*(lognrnd(0,1,[pop,Neurons.Ipop]) <= K./pop);
% WE = lognrnd(0,1,[pop,Neurons.Epop]) <= K./pop;

% WI = -lognrnd(0,1,[pop,Neurons.Ipop]).*(lognrnd(0,1,[pop,Neurons.Ipop]) <= K./pop);
% WE = lognrnd(0,1,[pop,Neurons.Epop]).*(lognrnd(0,1,[pop,Neurons.Epop]) <= K./pop);

WI = -1.*rand(pop,Neurons.Ipop);
WE = rand(pop,Neurons.Epop);

%Neurons.W = ones(pop,pop);
Neurons.W(1:pop,1:Neurons.Epop)     = WE;
Neurons.W(1:pop,Neurons.Epop+1:pop) = WI;

Neurons.tau = ones(pop,1);
Neurons.tau(1:Neurons.Epop,1) = 1.*(Neurons.tau(1:Neurons.Epop,1));

Neurons.syn = 10.*ones(pop,1);
Neurons.syn(Neurons.Epop+1:pop,1) = 0.5.*(Neurons.syn(Neurons.Epop+1:pop,1));

[Values] = AutoEncoder(TimeParams,Neurons);

%%
figure
subplot(2,1,1)
plot(Values.t,Values.x,'k');
subplot(2,1,2)
plot(Values.t,Values.f,'r');

figure
subplot(2,1,1);
plot(Values.t,Values.x(1:Neurons.Epop,:),'b');
subplot(2,1,2);
plot(Values.t,Values.x(Neurons.Epop+1:pop,:),'r');

figure
imagesc(Values.x)



