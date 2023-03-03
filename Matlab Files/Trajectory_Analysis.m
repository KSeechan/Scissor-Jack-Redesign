%% Proposed mechanism trajectory analysis
close all; % closes all figures
clear all; % clears all variables from memory
clc;       % clears all calculations from the Matlab workspace

% Plot Parameters: these will be used to set the axis limits on the figure
xmin= -20; % leftmost window edge
xmax= 40;  % rightmost window edge
ymin= -10; % bottom window edge
ymax= 35;  % top window edge


V_h=0.25;% Horizontal velocity
V_v =0.118;% vertical velocity


% Displacement time
increments =50;   % number of increments required in the time vector
time =linspace(0,100,increments); %creating a time vector that will be iterated through

%% set up figure
figure(1);                         %create new figure
%set(1,'WindowStyle','Docked')      %dock the figure

for i=1:increments                               % step through motion of the mechanism
% Draw screw link
Ax(i) = 0;  %Origin x-pos
Ay(i) = 0;  %Origin y-pos
Bx(i) = 25; %Screw x-pos
By(i) = 0;  %Screw y-pos
plot([Ax(i),Bx(i)],[Ay(i),By(i)],'color','m','LineWidth',3) %Plot of Screw
hold on;

% Draw link 2
Cx(i) = 0 + V_h * time(i); %Slider x-pos on link 2
Cy(i) = 0;                 %Slider y-pos on link 2
Dx(i) = 0 + V_h * time(i);  %Top x-pos of link 2
Dy(i) = 15;                 %Top y-pos of link 2

plot(Cx(i), Cy(i),'mo','MarkerFaceColor','w') %plot of center circle on link 2 slider
rectangle('position', [Cx(i) - 1, Cy(i) - 0.5, 2, 1]) %plot of rectangle as link 2 slider
plot([Cx(i),Dx(i)],[Cy(i),Dy(i)],'color','r','LineWidth',3) %plot of link 2

% Draw link 1
Ex(i) = 0; % Ground link x origin
Ey(i) = 0.0; % Ground link y origin
Fx(i) = 25; % Ground link x position
Fy(i) = 25 * tan((5*pi)/36); % Ground link y position

plot([Ex(i),Fx(i)],[Ey(i),Fy(i)],'color','g','LineWidth',3)% Plot the ground link

% Draw link 4
Gx(i) = 0 + V_h * time(i);%link 4 x position
Gy(i) = 0 + V_v * time(i);% link 4 y position
plot(Gx(i), Gy(i),'mo','MarkerFaceColor','w')% Plot a circle on link 4
rectangle('position',[Gx(i) - 1, Gy(i) - 0.5, 2, 1])% Plot link 4

% Draw Link 3 (Horizontal)
Hx(i) = -7.15; % link 3(horizontal) origin
Hy(i) = 0 + V_v * time(i);% link 3(horizontal) y position
Ix(i) = 25; % link 3(horizontal) x position
Iy(i) = 0 + V_v * time(i);% link 3(horizontal) y position

plot([Hx(i),Ix(i)],[Hy(i),Iy(i)],'color','k','LineWidth',3)% Plot link 3(horizntal)

% Draw Link 3 (Vertical)
Jx(i) = -7;% link 3(vertical) origin
Jy(i) = 0 + V_v * time(i);% link 3(vertical) y position
Kx(i) = -7;  % link 3(vertical) x position
Ky(i) = 5 + V_v * time(i);% link 3(vertical) y position

rectangle('position',[Kx(i) - 2, Ky(i), 4, 2])%Draw rectangle on link 3
plot([Jx(i),Kx(i)],[Jy(i),Ky(i)],'color','k','LineWidth',3)% Plot link 3(vertical)

% Draw Support A:
    recsz = 1.5;                                  % size of drawn base pivot
    plot([0,recsz],[0,-recsz],'r');                 % draw base pivot
    plot([0,-recsz],[0,-recsz],'r');                % draw base pivot
    plot(0,0,'ro','MarkerFaceColor','w');           % draw a small circle at the base pivot point
    plot(Ax(i), Ay(i), 'bo','MarkerFaceColor','w'); % draw a small circle at B
    text(Ax(i)-10, Ay(i), 'Support A','Color','b');       % label pivot A
    
    % Draw Support B:                               
    plot([25,25 + recsz],[0,-recsz],'r');                 % draw base pivot
    plot([25,25 - recsz],[0,-recsz],'r');                % draw base pivot
    plot(25,0,'ro','MarkerFaceColor','w');           % draw a small circle at the base pivot point
    plot(Bx(i), By(i), 'bo','MarkerFaceColor','w'); % draw a small circle at B
    text(Bx(i)+1, By(i), 'Support B','Color','b');       % label pivot B

    text(10,-2,'\uparrow Input Screw') % label the input screw
    text(12.5,5,'\leftarrow Ground Link')% label the ground link
    
    xlabel('X-Position (cm)', 'fontsize', 15);   % axis label
    ylabel('Y-Position (cm)', 'fontsize', 15);   % axil label 
    title('Trajectory Analysis for Proposed Design');            % add a title to the figure
    axis equal;                         % make sure the figure is not stretched
    
    axis( [xmin xmax ymin ymax] );% set the figure axis limits
hold off;
pause(0.1);
end

hold on
plot(Kx - 2, Ky + 2, '--','Color', 'b')% Trace the left path of link 3
plot(Kx + 2, Ky + 2, '--', 'Color', 'b')% Trace the right path of link 3
text(26,7.5,'\leftarrow Link 2') % label link 2
text(9,13,'\downarrow Link 3 (Output)') % label link 3
text(26.5,12,'\leftarrow Slider Link 4') %label slider link 4

 