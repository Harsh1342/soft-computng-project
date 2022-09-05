function b = tan_sigmoid(x)


b = (1-exp(-2.*x))./(1+exp(-2.*x));