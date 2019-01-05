options = optimset('GradObj','on','LargeScale','off','HessUpdate','steepdesc','Display','iter');

func.options = options;
func.x0 = [3,-5];
func.objective = @calculatef;
func.solver = 'fminunc';

z = fminunc(func)

function [f,g] = calculatef(x)

    f = (x(1) - 1)^2 + (x(2) - 3)^2 - 1.8*(x(1) - 1)*(x(2) - 3)

    g = [2*(x(1) - 1) - 1.8*(x(2) - 3); 2*(x(2) - 3) - 1.8*(x(1) - 1)];
end