function ans = Testout_denormalize(vec)


data = load('inputes.txt');
out = load('Test_output.txt');

z = data(3);
p = data(6);

 

for i = 1:z
a = out(:,i);
c = min(a);
b = max(a)-min(a);
for j = 1:p
 ans = ((vec- 0.1)*b/0.8)+c ;


end

end
end