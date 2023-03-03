close all; % closes all figures
clear all; % clears all variables from memory
clc;       % clears all calculations from the Matlab workspace

% Plot Parameters: these will be used to set the axis limits on the figure
xmin= -30; % leftmost window edge
xmax= 30;  % rightmost window edge
ymin= 0; % bottom window edge
ymax= 55;  % top window edge

%% Link Parameters
turns = 90; % number of turns to calculate along mechanism rotation
max_rotation_theta = 70 *pi/180; % rotation limit of theta2, radians
theta2 = linspace(25*pi/180,max_rotation_theta,turns); % link 2 rotation into 'increments' number of angles
r1 = 24;          % link 1 length, cm
r2 = 24;          % link 2 length, cm
r3 = 24;          % link 3 length, cm
r4 = 24;          % link 4 length, cm
r5 = 45;          % link 5 length, cm

%%Set Up Figure
figure(1);

%% calculate mechanism motion and plot it 
     
  for i = 1:length(theta2)                          
        hold off;
        
        % Link Coordinates calculations:   
        Dx(i) = 0;                                      % pivot point of link D position
        Dy(i) = 0;                                      % pivot point of link D position
        Ax(i) = -r4*cos( theta2(i) );                   % point A 
        Ay(i) = r4*sin( theta2(i) );                    % point A (cm)
        Cx(i) = r3*cos( theta2(i) );                    % point C
        Cy(i) = r3*sin( theta2(i) );                    % point C
        Bx(i) = 0;                                      % point B
        By(i) = (sin(theta2(i))*24)*2;                  % point B
        
        if (true)
        %plot links
         plot( [Ax(i) Bx(i)], [Ay(i), By(i)],'Color','b','LineWidth',2 ); % link1
         hold on;            
         plot( [Bx(i), Cx(i)], [ By(i), Cy(i)],'Color','b','LineWidth',2 ); % link2
         plot( [Cx(i), Dx(i)], [ Cy(i), Dy(i)],'Color','b','LineWidth',2 ); % link3 
         plot( [Dx(i), Ax(i)], [ Dy(i), Ay(i)],'Color','b','LineWidth',2 ); % link4
         plot( [Ax(i), Cx(i)], [Ay(i), Cy(i)],'Color','k','LineWidth',3); % screw 
            
         % Draw Base Pivots:
         
         plot(0,0,'ro','MarkerFaceColor','w');               % draw a small circle at the base pivot point
         plot(Ax(i), Ay(i), 'ro','MarkerFaceColor','w');     % draw a small circle at A
         plot(Bx(i), By(i), 'ro','MarkerFaceColor','w');     % draw a small circle at B
         plot(Cx(i), Cy(i), 'ro','MarkerFaceColor','w');     % draw a small circle at C
         plot(Dx(i), Dy(i), 'ro', 'MarkerFaceColor','w');    % draw a small circle at D
         
         xlabel('x (cm)', 'fontsize', 15);   
         ylabel('y (cm)', 'fontsize', 15);    
         title('Scissor Jack Motion');            
         axis equal;                         
         grid on;
         axis( [xmin xmax ymin ymax] ); 
         
         text(-26,5,'Initial: A')
         text(-3.5,15,'Initial: B','Color','r')
         text(16,5,'Initial: C')
         text(-20,22,'Final: A')
         text(-1,51,'Final: B','Color','r')
         text(13,22,'Final: C')
         
         text(10,22.55,'\rightarrow')
         text(-12,22.55,'\leftarrow')
         text(21.75,8,'\downarrow')
         text(-21.75,8,'\downarrow')
         text(0,18,'\downarrow','Color','r')
         text(0,48,'\uparrow','Color','r')
         
         
  
         %% plot traveled Path of links on the same figure showing mechanism motion, figure(1)
         A_line_start_y = Ay(1);
         A_line_end_y = Ay(i);
         A_line_start_x = Ax(1);
         A_line_end_x = Ax(i);
         plot([A_line_start_x,A_line_end_x],[A_line_start_y,A_line_end_y],':bs','MarkerEdgeColor','k','MarkerFaceColor','w','Markersize',5,'LineWidth',2)
         
         B_line_start_y = By(1);
         B_line_end_y = By(i);
         B_line_start_xy = 0;
         plot([B_line_start_xy,B_line_start_xy],[B_line_start_y,B_line_end_y],':ro','MarkerEdgeColor','r','MarkerFaceColor','w','Markersize',5,'LineWidth',2)
    
         C_line_start_y = Cy(1);
         C_line_end_y = Cy(i);
         C_line_start_x = Cx(1);
         C_line_end_x = Cx(i);
         plot([C_line_start_x,C_line_end_x],[C_line_start_y,C_line_end_y],':bs','MarkerEdgeColor','k','MarkerFaceColor','w','Markersize',5,'LineWidth',2)
        end
  pause(0.01);       
  end
         
         
