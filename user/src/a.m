clear all
clc
tic

%% 参数设置
maxgen=100; %迭代次数
sizepop=20; %种群大小
c=1.49445; %速度更新参数，c1=c2
wmax=0.9; %惯性权重
wmin=0.4;
popmax=[1.1 8 5]; %发电机节点电压、变压器分接头、电容器投入组数上限
popmin=[0.95 0 0]; %发电机节点电压、变压器分接头、电容器投入组数下限
vmax=[0.2 2 2]; %速度上限
vmin=[-0.2 -2 -2]; %速度下限
dim=[6 4 2]; %变量维数
shuju=case_ieee30; %得到30节点的数据

%% 初始化种群
for i=1:sizepop
	pop(i,1:dim(1)) =rand(1,dim(1))*(popmax(1)-popmin(1))+popmin(1); %初始化节点电压
	pop(i,dim(1)+1:dim(1)+dim(2)) =round(popmax(2)*rand(1,dim(2))); %初始化分接头位置，取整
	pop(i,dim(1)+dim(2)+1:dim(1)+dim(2)+dim(3)) =round(popmax(3)*rand(1,dim(3))); %初始化投入组数，取整
	v(i,1:dim(1)) =0.2*rands(1,dim(1));
	v(i,dim(1)+1:dim(1)+dim(2)) =2*rands(1,dim(2));
	v(i,dim(1)+dim(2)+1:dim(1)+dim(2)+dim(3)) =2*rands(1,dim(3));
	
	%计算网损大小
	shuju.bus([1 2 5 8 11 13],8) =pop(i,1:dim(1)); %改30节点中的节点电压
	shuju.gen(:,6) =pop(i,1:dim(1)); %改30节点中的节点电压
	shuju.branch([11 12 15 36],9) =pop(i,dim(1)+1:dim(1)+dim(2))*0.025+0.9; %改变压器变比
	shuju.bus([10 24],6) =pop(i,dim(1)+dim(2)+1:dim(1)+dim(2)+dim(3))*10; %改电容器容量
	
	% [basemva bus gen branch success et] =runpf(shuju); %显示迭代过程
	[MVAbase, bus, gen, branch, success, et] =runpf(shuju,mpoption('OUT_ALL', 0,'VERBOSE', 0)); %不显示迭代过程
	fitness(i) =sum(branch(:,14)+branch(:,16)); %计算出网损大小
	% fitness(i)=f1(shuju);
end

[best, index]=min(fitness);
gtsite=pop; %个体最佳位置
gtfit=fitness; %个体最佳适应度
popsite=pop(index,:); %全局最佳位置
popfit=fitness(index); %全局最佳适应度
trace(1)=popfit;
for j=1:maxgen
	w=wmax-(wmax-wmin)/maxgen*j;
	for i=1:sizepop
		
		%速度更新
		v(i,:)=w*v(i,:)+c*rand*(gtsite(i,:)-pop(i,:))+c*rand*(popsite-pop(i,:));
		
		%限制微粒速度
		v1=v(i,1:dim(1)); %节点电压速度
		v2=v(i,dim(1)+1:dim(1)+dim(2)); %变比速度
		v3=v(i,dim(1)+dim(2)+1:dim(1)+dim(2)+dim(3)); %电容器容量速度
		temp1=v1>vmax(1);
		v1(temp1)=0.2*rands(1,sum(temp1));
		temp1=v1<vmin(1);
		v1(temp1)=-0.2*rands(1,sum(temp1));
		temp2=v2>vmax(2);
		v2(temp2)=2*rands(1,sum(temp2));
		temp2=v2<vmin(2);
		v2(temp2)=-2*rands(1,sum(temp2));
		temp3=v3>vmax(3);
		v3(temp3)=2*rands(1,sum(temp3));
		temp3=v3<vmin(3);
		v3(temp3)=-2*rands(1,sum(temp3));
		% v1(find(v1>vmax(1)))=vmax(1);
		% v1(find(v1<vmin(1)))=vmin(1);
		% v2(find(v2>vmax(2)))=vmax(2);
		% v2(find(v2<vmin(2)))=vmin(2);
		% v3(find(v3>vmax(3)))=vmax(3);
		% v3(find(v3<vmin(3)))=vmin(3);
		v(i,:)=[v1 v2 v3];
		
		%位置更新
		pop(i,:)=pop(i,:)+v(i,:);
		
		%限制微粒位置
		pop1=pop(i,1:dim(1));
		pop2=pop(i,dim(1)+1:dim(1)+dim(2));
		pop3=pop(i,dim(1)+dim(2)+1:dim(1)+dim(2)+dim(3));
		pop1(pop1>popmax(1))=popmax(1);
		pop1(pop1<popmin(1))=popmin(1);
		pop2(pop2>popmax(2))=popmax(2);
		pop2(pop2<popmin(2))=popmin(2);
		pop3(pop3>popmax(3))=popmax(3);
		pop3(pop3<popmin(3))=popmin(3);
		pop2=round(pop2);
		pop3=round(pop3);
		pop(i,:)=[pop1 pop2 pop3];
	end
	for i=1:sizepop
		
		%计算适应度
		shuju.bus([1 2 5 8 11 13],8) =pop(i,1:dim(1)); %改30节点中的节点电压
		shuju.gen(:,6) =pop(i,1:dim(1)); %改30节点中的节点电压
		shuju.branch([11 12 15 36],9) =pop(i,dim(1)+1:dim(1)+dim(2))*0.025+0.9; %改变压器变比
		shuju.bus([10 24],6) =pop(i,dim(1)+dim(2)+1:dim(1)+dim(2)+dim(3))*10; %改电容器容量
		[basemva bus gen branch success et] =runpf(shuju);
		fitness =sum(branch(:,14)+branch(:,16)); %计算出网损大小
		% [MVAbase, bus, gen, branch, success, et] =runpf(shuju,mpoption('OUT_ALL', 0,'VERBOSE', 0)); %不显示迭代过程
		% fitness=f1(shuju);
		
		%个体适应度及位置更新
		if fitness<gtfit(i)
			gtfit(i)=fitness;
			gtsite(i,:)=pop(i,:);
		end
		
		%全局适应度及位置更新
		if fitness<popfit
			popfit=fitness;
			popsite=pop(i,:);
		end
	end
	trace(j+1)=popfit; %记录每次迭代的最佳值
end

figure
plot(trace)
toc
