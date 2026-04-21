%% init%
expactation = 0;
banner.prob_basic = 0.006;
banner.prob_StepWidth = 0.06;
banner.prob_IncreaseNum = 73;
banner.prob_must = ceil(banner.prob_IncreaseNum + (1-banner.prob_basic)/banner.prob_StepWidth);
pdf = zeros(banner.prob_must);
cdf = zeros(banner.prob_must);
test = 1;
%% calculation
for i = 1:banner.prob_must
    pdf(i) = cal_prob( i , banner.prob_basic , banner.prob_IncreaseNum , banner.prob_StepWidth);
    if i==1
        cdf(i) = pdf(i);
    else
        cdf(i) = cdf(i-1) + pdf(i);
    end
    if test~=0 && (cdf(i)-0.9)>0
        test = 0;
        num_prob90 = i;
    end
    expactation = expactation + i * pdf(i);
end

%% visualization
f1 = subplot(1,2,1);
plot(pdf)
title('第n抽出货概率')
text(10,0.025,['期望抽数为',num2str(expactation)],'fontsize',16)
xlabel('抽数')
set(f1,'position',[0.1,0.35,0.4,0.4])

f2 = subplot(1,2,2);
plot(cdf)
line([0,banner.prob_must],[0.9,0.9])
text(10,0.94,'90%','fontsize',12)
text(num_prob90-5,0.94,num2str(num_prob90),'fontsize',12)
title('累计分布')
xlabel('抽数')
set(f2,'position',[0.55,0.35,0.4,0.4])


