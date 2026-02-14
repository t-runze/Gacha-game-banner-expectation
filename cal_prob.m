%计算第n抽出货概率
function prob = cal_prob(num,prob_basic,prob_increase_num,prob_step)
    prob = prob_basic * ((1 - prob_basic)^(num-1));
    prob(num==1) =  prob_basic; 
    prob_delta = prob_basic * ((1 - prob_basic)^(prob_increase_num-1));
    prob_must = prob_increase_num + (1-prob_basic)/prob_step;
    if num > prob_increase_num
        prob = prob_delta;
        for i = (prob_increase_num+1):prob_must
            prob = (1-((prob_basic + (i-1-prob_increase_num)*prob_step)))/(prob_basic + (i-1-prob_increase_num)*prob_step)*prob * (prob_basic + (i-prob_increase_num)*prob_step);
            if i == num
                return
            end
        end
    end
end