function ans = Normalize()

data = load('inputes.txt');
inp = load('feature.txt');

z = data(1);
p = data(5);

 
for i = 1:z
a = inp(:,i)
c = min(a);
b = max(a)-min(a);
for j = 1:p
ans(j,i)= 0.1 + 0.8*(a(j)-c)/b;


end

end
ans
