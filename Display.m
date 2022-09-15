function Display(Optimal,d)

s=[num2str(Optimal(2)) '(' num2str(0) ')-->'];
for i=3:length(Optimal)
    if Optimal(i)~=0
        s=[s num2str(Optimal(i)) '(' num2str(d(Optimal(i))) ')-->'];
    elseif Optimal(i)==0
        s=s(1:end-3); % Cut '-->' which are not needed 
        s=[s char(13,10)']; % char(13,10)' is a newline symbol, which can achieve a newline effect when a string of strings is finally output 
    end
end
s=s(1:end-3); % Cut last '-->'
s=strtrim(s);
disp(s);