function ans = Testout_Normalize()

data = load('inputes.txt');
out = load('Test_output.txt');

z = data(3);
p = data(6);

 
for i = 1:z
a = out(:,i);
c = min(a);
b = max(a)-min(a);
for j = 1:p
ans(j,i)= 0.1 + 0.8*(a(j)-c)/b;


end

end
