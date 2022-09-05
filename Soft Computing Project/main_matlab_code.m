clear all;clc;

data = load('inputes.txt');  %basic info. regarding ANN model


z = data(1);
x = data(2);
y = data(3);
n = data(4);

k = data(5);

inp = Inp_Normalize(); %%inputes of training patterns
out = Out_normalize(); %%output of the training patterns

V = rand(z+1 , x); %%random weights 
W = rand(x+1 , y);
MSE= 100; %% MeanSquare Error initialization
iter =0;
q=0;  %% initialization for momentum term
r=0;
alpa =0.7; %%momentum Coefficient

while MSE>0.001  %% iterate until MSE become less then 0.1% of Training set
    
    
for t = 1:k
I = [1 inp(t,:)];
T = out(t,:);

Ih = I*V;

Oh =[1 log_sigmoid(Ih)];  %%with bais addition


Io = Oh * W ;

Oo = log_sigmoid(Io);

error = T - Oo;

MSE = 0.5*(error*error');  %%vectoriz implimentation





DW = zeros(size(W));

for j = 1:x+1
    for k = 1:y
        DW(j,k) = n*(T(k)- Oo(k)).*Oo(k).*(1-Oo(k)).*Oh(j);
    end
end

W = W + DW + alpa*q; %% weight(hidden and output) Updatation of 
q= DW;
DV = zeros(size(V));
for i =1:z+1
    for j= 1:x
        for k = 1:y 
            DV(i,j) = DV(i,j) + n*(T(k)- Oo(k)).*Oo(k).*(1-Oo(k)).*Oh(j).*I(i).*W(j,k).*(1-Oh(j));
        end
    end
end
V = V + DV + alpa*r ;
r=DV;

I = [1 inp(t,:)];
T = out(t,:);

Ih = I*V;

Oh =[1 log_sigmoid(Ih)];


Io = Oh * W ;

Oo = log_sigmoid(Io);

error = T - Oo;

MSE = 0.5*(error*error');

end
iter = iter+1; %%counting iteration of while loop
end

%% Testing Of Neural Network:

inp = Testin_Normalize(); %% changing the input file and normalize the input data
out = Testout_Normalize();
 
MSE=0;  
k = data(6);
harsh = fopen('Network_Outputs.txt','w');
fprintf(harsh,'Test Pattern no.\tNetwork Output\tMean Sqare Error\n\n');
for t = 1:k
I = [1 inp(t,:)];
T = out(t,:);

Ih = I*V;

Oh =[1 log_sigmoid(Ih)];


Io = Oh * W ;

Oo = log_sigmoid(Io);
OO = Testout_denormalize(Oo);


error = T - Oo;

MSE1 = 0.5*(error*error');

fprintf(harsh,'\t%d\t\t%f\t%f\n',t,OO,MSE1);

MSE  = MSE + MSE1;
    

end
MSE = MSE/k ;

fprintf(harsh,'\n\nMean Square Error Of Test Set : %f \n',MSE);
fprintf(harsh,'Max No. Of Iterations on Training Pattern is : %d \n',iter);
fclose(harsh);
























