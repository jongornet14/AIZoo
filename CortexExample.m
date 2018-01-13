Neurons.Ipop = 50;
Neurons.Epop = 50;

Neurons.A = 0;

pop = Neurons.Ipop + Neurons.Epop;

TimeParams.time = 100;
TimeParams.dt   = 0.01;

T = length(0:TimeParams.dt:TimeParams.time);

Neurons.I = ones(pop,T);
Neurons.I(1,1) = 1;

K = 10;

% WI = -1.*(rand(pop,Neurons.Ipop) <= K./pop);
% WE = rand(pop,Neurons.Epop) <= K./pop;

% WI = -rand(pop,Neurons.Ipop).*(rand(pop,Neurons.Ipop) <= K./pop);
% WE = rand(pop,Neurons.Epop).*(rand(pop,Neurons.Epop) <= K./pop);

% WI = -1.*(lognrnd(0,1,[pop,Neurons.Ipop]) <= K./pop);
% WE = lognrnd(0,1,[pop,Neurons.Epop]) <= K./pop;

% WI = -lognrnd(0,1,[pop,Neurons.Ipop]).*(lognrnd(0,1,[pop,Neurons.Ipop]) <= K./pop);
% WE = lognrnd(0,1,[pop,Neurons.Epop]).*(lognrnd(0,1,[pop,Neurons.Epop]) <= K./pop);

% WI = -1.*(rand(pop,Neurons.Ipop));
% WE = 1.*(rand(pop,Neurons.Epop));

% Neurons.W = ones(pop,pop);
% Neurons.W(1:pop,1:Neurons.Epop)     = WE;
% Neurons.W(1:pop,Neurons.Epop+1:pop) = WI;

%Neurons.W = (rand(pop,pop) <= K./pop) - (rand(pop,pop) <= K./pop);

Neurons.W = (rand(pop) - rand(pop));

Neurons.tau = ones(pop,1);
%Neurons.tau(1:Neurons.Epop,1) = 100.*(Neurons.tau(1:Neurons.Epop,1));

Neurons.syn = 1000.*ones(pop,1);
%Neurons.syn(Neurons.Epop+1:pop,1) = 0.5.*(Neurons.syn(Neurons.Epop+1:pop,1));

[Values] = CortexNet(TimeParams,Neurons);

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



