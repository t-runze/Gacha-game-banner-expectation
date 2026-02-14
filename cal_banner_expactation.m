%% init%
expactation = 0;
banner.prob_basic = 0.02;
banner.prob_StepWidth = 0.02;
banner.prob_IncreaseNum = 50;
banner.prob_must = banner.prob_IncreaseNum + (1-banner.prob_basic)/banner.prob_StepWidth;
prob = zeros(banner.prob_must);


%% calculation
for i = 1:banner.prob_must
    prob(i) = cal_prob( i , banner.prob_basic , banner.prob_IncreaseNum , banner.prob_StepWidth);
    expactation = expactation + i * prob(i);
end

%% visualization
plot(prob)
title('第n抽出货概率')
text(20,0.03,['期望抽数为',num2str(expactation)],'fontsize',18)
xlabel('抽数')

