[img1,img2]=getVisionScanner();
ximg1 = img1;
ximg2 = img2;
%theta = (-135*pi/180):((135.2*pi/180)/300):0
%scn = (fliplr([ximg1(1:240),ximg2(end-233:end)]));
scn = ([ximg2,ximg1,zeros(1,64)]);
%scn = scn(60:536)
dtheta = 0.0085
    %dtheta = 0.0085;
    currentAngle = (-135*pi)/180;
    currentAngle2 = (135*pi)/180;
    %currentAngle = 0;
    %currentAngle2 = 0;
    x = zeros(1,size(scn,2));
    y = zeros(1,size(scn,2));
    x1 = zeros(1,size(scn,2));
    y1 = zeros(1,size(scn,2));
    for i=1:size(ximg1,2)
        currentAngle = currentAngle + dtheta;
        currentAngle2 = currentAngle2 - dtheta;
        x(i) = ximg1(i)*cos(-currentAngle);
        y(i) = ximg1(i)*sin(-currentAngle);
        % Skew
%         x(i) = ximg1(i)*cos(currentAngle)+y(i)*-0.8;
%         y(i) = ximg1(i)*cos(currentAngle)+x(i)*-4;
        x1(i) = ximg2(i)*cos(-currentAngle2);
        y1(i) = ximg2(i)*sin(-currentAngle2);
%         x1(i) = ximg2(i)*cos(currentAngle)+y1(i)*0.8;
%         y1(i) = ximg2(i)*cos(currentAngle)+x1(i)*4;
    end
    
    
    %theta = 0:(((rho*2*pi)/180)/size(scn,2)):(rho*2*pi/180);
    %plot(scn)
    subplot(1,2,1)
    fill(x1,y1,'r')
    subplot(1,2,2)
    fill(fliplr(x),fliplr(y),'r')
    pause(0.1)
    drawnow
    %plot(x)
    %plot(scn)
