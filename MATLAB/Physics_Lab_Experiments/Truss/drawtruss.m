function  drawtruss(J, B, F, R)
%DRAWTRUSS draws a truss
clf
njoints = length(J(:,1)); %number of joints
nbars   = length(B(:,1)); %number of bars

basex = J(B(:,2),2);    basey = J(B(:,2),3);
tipx  = J(B(:,3),2);    tipy  = J(B(:,3),3);

hold on

for i = 1:nbars
  %draw bars
  plot([basex(i) tipx(i)],...
       [basey(i) tipy(i)])
   
  %put bar numbers near middle of bars
  r = .6; %(so bar #'s don't land on top of each other
  text( (basex(i)*r + tipx(i)*(1-r)),...%ave. x
        (basey(i)*r + tipy(i)*(1-r)),...%ave. y
        [num2str(B(i,1))],...
        'FontSize',18                     )
   
  %put circles around numbers
   plot( (basex(i)*r + tipx(i)*(1-r)),...
         (basey(i)*r + tipy(i)*(1-r)),...
         'o','MarkerSize',25,'Color','k'  )
end


for j = 1:njoints
%Number the joints in red    
text( J(j,2),J(j,3),...           %location of joint
      [num2str(J(j,1)) ' '],...   %number of joint
      'FontSize',18, 'Color','r'     )

%Put squares around joint numbers
   plot( J(j,2),J(j,3),...
         's','MarkerSize',25,'Color','r'   )
end


hold off
axis('equal')
title( {'Sketch of truss', ...
        'Bar numbers black, Joint numbers red'},...
        'FontSize', 18                                  )
end

