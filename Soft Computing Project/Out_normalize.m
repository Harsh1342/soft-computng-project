function ans= Out_normalize()
data = load('inputes.txt');
output = load('output.txt');
z = data(3);
p = data(5);


for i = 1:z
a = output(:,i);
c = min(a);
b = max(a)-min(a);
for j = 1:p
ans(j,i)= 0.1 + 0.8*(a(j)-c)/b;


end

end
ans;