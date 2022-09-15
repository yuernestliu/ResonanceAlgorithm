function Display_alpha(Optimal,d)

% digit2alpha = {'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'Q' 'R' 'S'};
digit2alpha = {'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'J' 'K' 'L' 'M' 'N' 'P' 'Q' 'R' 'S'};

% s=[num2str(Optimal(2)) '(' num2str(0) ')-->'];
% for i=3:length(Optimal)
%     if Optimal(i)~=0
%         s=[s num2str(Optimal(i)) '(' num2str(d(Optimal(i))) ')-->'];
%     elseif Optimal(i)==0
%         s=s(1:end-3); % Cut '-->' which are not needed 
%         s=[s char(13,10)']; % char(13,10)' is a newline symbol, which can achieve a newline effect when a string of strings is finally output 
%     end
% end
% s=s(1:end-3); % Cut last '-->'
% s=strtrim(s);
% disp(s);

%%%
s=[num2str(digit2alpha{Optimal(2)}) '(' num2str(0) ')-->'];
for i=3:length(Optimal)
    if Optimal(i)~=0
        s=[s num2str(digit2alpha{Optimal(i)}) '(' num2str(d(Optimal(i))) ')-->'];
    elseif Optimal(i)==0
        s=s(1:end-3); % Cut '-->' which are not needed 
        s=[s char(13,10)']; % char(13,10)' is a newline symbol, which can achieve a newline effect when a string of strings is finally output 
    end
end
s=s(1:end-3); % Cut last '-->'
s=strtrim(s);
disp(s);