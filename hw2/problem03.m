pattern1 = [1 -1 1 -1];
pattern2 = [-1 1 -1 1];
pattern3 = [1 1 -1 -1];  
pattern4 = [-1 -1 1 1];
patterns = [1 -1 1 -1; -1 1 -1 1; 1 1 -1 -1; -1 -1 1 1];
targets = [-10 -10 10 10];

b = -4;

rate = 0.1;
w(1,:) = [10 10 10 10];

i = 0;
epochs = 100;
min_error = 0.01;

while (i < epochs)
    
    for k = 1:4

        a(k) = purelin(w*patterns(k,:)' + b); 
        w_new = w + 2*rate*(targets(k) - a(k))*patterns(k,:);
        b_new = b + 2*rate*(targets(k) - a(k));
        
        e(k) = targets(k) - a(k);
       
        w = w_new;
        b = b_new;
    end
    
    e = e.^2;
    sum_error = sum(e)
    if (sum_error < min_error)
        break;
    end
    
    plot(i,sum_error,'*');
    hold on;
    i = i + 1;
    

end

  