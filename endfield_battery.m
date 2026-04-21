%% 设置需求
accuracy = 10;
power_demand = 4735;   

%% parameters
power_base = 200;
belt_speed = 30;  %单位/分钟
battery.burn_time = 40;
battery.power = 3200;

%% 分流器设置
BeltSpeedInSecond = belt_speed/60;
PowerInSecond = BeltSpeedInSecond * battery.power * battery.burn_time;
PowerNeed = mod(power_demand-200,battery.power);
count = floor((power_demand-200)/battery.power);

remain = PowerNeed/PowerInSecond;  %供需比例
bits = zeros(1,accuracy);
PowerSupply = battery.power * count + 200;
k = ceil(remain * 2^accuracy);     % 放大并上取整
for i = accuracy:-1:1
    bits(i) = mod(k, 2);
    k = floor(k / 2);
    PowerSupply = PowerSupply + PowerInSecond * 1/(2^i) * bits(i);
end

disp("实际产出" + PowerSupply)
disp("分流器配置位置")
disp(bits)


