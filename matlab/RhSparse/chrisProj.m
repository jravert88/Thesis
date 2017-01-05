a = [2 1]';
r = [2 2]';

(a'*r)/(a'*a)

figure(1); clf
quiver(0,0,a(1),a(2))
hold on
quiver(0,0,r(1),r(2))
axis square
legend(['a [' num2str(a(1)) ',' num2str(a(2)) ']'],['r [' num2str(a(1)) ',' num2str(a(2)) ']'],'Location','Best')
annotation('textbox',...
    [0 0 0.1 0.1],...
    'String',{num2str((a'*r)/(a'*a))});