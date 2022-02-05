function c = gaForCoordsFromJRDs(meanJRDs,numGen)

% randomly generate starting values for each coordinate (14 bits each)
allBitStrings = zeros(1000,112);
bestFit = [0,0,0,0,0,0,0,0,1000000000];
for i5 = 1:1:1000
    for i2 = 1:1:112
        temp = rand();
        if temp < 0.5
            allBitStrings(i5,i2) = 0;
        else
            allBitStrings(i5,i2) = 1;
        end
    end
end
for i = 1:1:numGen
    x = i
    %convert coordinates to "predicted" JRDs and calculate SSE between
    %predicted and observed JRDs for each string
    allParameterValues = zeros(1000,8);
    SSEs = zeros(1000,1);
    for i3 = 1:1:1000
        i9 = 0;
        for i4 = 1:14:112
            i9 = i9+1;
            allParameterValues(i3,i9) = bin2dec(strcat(num2str(allBitStrings(i3,i4)),num2str(allBitStrings(i3,(i4+1))),num2str(allBitStrings(i3,(i4+2))),num2str(allBitStrings(i3,(i4+3))),num2str(allBitStrings(i3,(i4+4))),num2str(allBitStrings(i3,(i4+5))),num2str(allBitStrings(i3,(i4+6))),num2str(allBitStrings(i3,(i4+7))),num2str(allBitStrings(i3,(i4+8))),num2str(allBitStrings(i3,(i4+9))),num2str(allBitStrings(i3,(i4+10))),num2str(allBitStrings(i3,(i4+11))),num2str(allBitStrings(i3,(i4+12))),num2str(allBitStrings(i3,(i4+13)))));
        end
        tempJRDs = zeros(1,24);
        tempJRDs(1) = abs(mod(rad2deg(atan((allParameterValues(i3,6)-allParameterValues(i3,5))./(allParameterValues(i3,2)-allParameterValues(i3,1)))) - rad2deg(atan((allParameterValues(i3,7)-allParameterValues(i3,5))./(allParameterValues(i3,3)-allParameterValues(i3,1)))),360)-180)./180;
        tempJRDs(2) = abs(mod(rad2deg(atan((allParameterValues(i3,6)-allParameterValues(i3,5))./(allParameterValues(i3,2)-allParameterValues(i3,1)))) - rad2deg(atan((allParameterValues(i3,8)-allParameterValues(i3,5))./(allParameterValues(i3,4)-allParameterValues(i3,1)))),360)-180)./180;
        tempJRDs(3) = abs(mod(rad2deg(atan((allParameterValues(i3,7)-allParameterValues(i3,5))./(allParameterValues(i3,3)-allParameterValues(i3,1)))) - rad2deg(atan((allParameterValues(i3,6)-allParameterValues(i3,5))./(allParameterValues(i3,2)-allParameterValues(i3,1)))),360)-180)./180;
        tempJRDs(4) = abs(mod(rad2deg(atan((allParameterValues(i3,7)-allParameterValues(i3,5))./(allParameterValues(i3,3)-allParameterValues(i3,1)))) - rad2deg(atan((allParameterValues(i3,8)-allParameterValues(i3,5))./(allParameterValues(i3,4)-allParameterValues(i3,1)))),360)-180)./180;
        tempJRDs(5) = abs(mod(rad2deg(atan((allParameterValues(i3,8)-allParameterValues(i3,5))./(allParameterValues(i3,4)-allParameterValues(i3,1)))) - rad2deg(atan((allParameterValues(i3,6)-allParameterValues(i3,5))./(allParameterValues(i3,2)-allParameterValues(i3,1)))),360)-180)./180;
        tempJRDs(6) = abs(mod(rad2deg(atan((allParameterValues(i3,8)-allParameterValues(i3,5))./(allParameterValues(i3,4)-allParameterValues(i3,1)))) - rad2deg(atan((allParameterValues(i3,7)-allParameterValues(i3,5))./(allParameterValues(i3,3)-allParameterValues(i3,1)))),360)-180)./180;
        tempJRDs(7) = abs(mod(rad2deg(atan((allParameterValues(i3,5)-allParameterValues(i3,6))./(allParameterValues(i3,1)-allParameterValues(i3,2)))) - rad2deg(atan((allParameterValues(i3,7)-allParameterValues(i3,6))./(allParameterValues(i3,3)-allParameterValues(i3,2)))),360)-180)./180;
        tempJRDs(8) = abs(mod(rad2deg(atan((allParameterValues(i3,5)-allParameterValues(i3,6))./(allParameterValues(i3,1)-allParameterValues(i3,2)))) - rad2deg(atan((allParameterValues(i3,8)-allParameterValues(i3,6))./(allParameterValues(i3,4)-allParameterValues(i3,2)))),360)-180)./180;
        tempJRDs(9) = abs(mod(rad2deg(atan((allParameterValues(i3,5)-allParameterValues(i3,7))./(allParameterValues(i3,1)-allParameterValues(i3,3)))) - rad2deg(atan((allParameterValues(i3,6)-allParameterValues(i3,7))./(allParameterValues(i3,2)-allParameterValues(i3,3)))),360)-180)./180;
        tempJRDs(10) = abs(mod(rad2deg(atan((allParameterValues(i3,5)-allParameterValues(i3,7))./(allParameterValues(i3,1)-allParameterValues(i3,3)))) - rad2deg(atan((allParameterValues(i3,8)-allParameterValues(i3,7))./(allParameterValues(i3,4)-allParameterValues(i3,3)))),360)-180)./180;
        tempJRDs(11) = abs(mod(rad2deg(atan((allParameterValues(i3,5)-allParameterValues(i3,8))./(allParameterValues(i3,1)-allParameterValues(i3,4)))) - rad2deg(atan((allParameterValues(i3,6)-allParameterValues(i3,8))./(allParameterValues(i3,2)-allParameterValues(i3,4)))),360)-180)./180;
        tempJRDs(12) = abs(mod(rad2deg(atan((allParameterValues(i3,5)-allParameterValues(i3,8))./(allParameterValues(i3,1)-allParameterValues(i3,4)))) - rad2deg(atan((allParameterValues(i3,7)-allParameterValues(i3,8))./(allParameterValues(i3,3)-allParameterValues(i3,4)))),360)-180)./180;
        tempJRDs(13) = abs(mod(rad2deg(atan((allParameterValues(i3,7)-allParameterValues(i3,6))./(allParameterValues(i3,3)-allParameterValues(i3,2)))) - rad2deg(atan((allParameterValues(i3,5)-allParameterValues(i3,6))./(allParameterValues(i3,1)-allParameterValues(i3,2)))),360)-180)./180;
        tempJRDs(14) = abs(mod(rad2deg(atan((allParameterValues(i3,8)-allParameterValues(i3,6))./(allParameterValues(i3,4)-allParameterValues(i3,2)))) - rad2deg(atan((allParameterValues(i3,5)-allParameterValues(i3,6))./(allParameterValues(i3,1)-allParameterValues(i3,2)))),360)-180)./180;
        tempJRDs(15) = abs(mod(rad2deg(atan((allParameterValues(i3,6)-allParameterValues(i3,7))./(allParameterValues(i3,2)-allParameterValues(i3,3)))) - rad2deg(atan((allParameterValues(i3,5)-allParameterValues(i3,7))./(allParameterValues(i3,1)-allParameterValues(i3,3)))),360)-180)./180;
        tempJRDs(16) = abs(mod(rad2deg(atan((allParameterValues(i3,8)-allParameterValues(i3,7))./(allParameterValues(i3,4)-allParameterValues(i3,3)))) - rad2deg(atan((allParameterValues(i3,5)-allParameterValues(i3,7))./(allParameterValues(i3,1)-allParameterValues(i3,3)))),360)-180)./180;
        tempJRDs(17) = abs(mod(rad2deg(atan((allParameterValues(i3,6)-allParameterValues(i3,8))./(allParameterValues(i3,2)-allParameterValues(i3,4)))) - rad2deg(atan((allParameterValues(i3,5)-allParameterValues(i3,8))./(allParameterValues(i3,1)-allParameterValues(i3,4)))),360)-180)./180;
        tempJRDs(18) = abs(mod(rad2deg(atan((allParameterValues(i3,7)-allParameterValues(i3,8))./(allParameterValues(i3,3)-allParameterValues(i3,4)))) - rad2deg(atan((allParameterValues(i3,5)-allParameterValues(i3,8))./(allParameterValues(i3,1)-allParameterValues(i3,4)))),360)-180)./180;
        tempJRDs(19) = abs(mod(rad2deg(atan((allParameterValues(i3,7)-allParameterValues(i3,6))./(allParameterValues(i3,3)-allParameterValues(i3,2)))) - rad2deg(atan((allParameterValues(i3,8)-allParameterValues(i3,6))./(allParameterValues(i3,4)-allParameterValues(i3,2)))),360)-180)./180;
        tempJRDs(20) = abs(mod(rad2deg(atan((allParameterValues(i3,8)-allParameterValues(i3,6))./(allParameterValues(i3,4)-allParameterValues(i3,2)))) - rad2deg(atan((allParameterValues(i3,7)-allParameterValues(i3,6))./(allParameterValues(i3,3)-allParameterValues(i3,2)))),360)-180)./180;
        tempJRDs(21) = abs(mod(rad2deg(atan((allParameterValues(i3,6)-allParameterValues(i3,7))./(allParameterValues(i3,2)-allParameterValues(i3,3)))) - rad2deg(atan((allParameterValues(i3,8)-allParameterValues(i3,7))./(allParameterValues(i3,4)-allParameterValues(i3,3)))),360)-180)./180;
        tempJRDs(22) = abs(mod(rad2deg(atan((allParameterValues(i3,8)-allParameterValues(i3,7))./(allParameterValues(i3,4)-allParameterValues(i3,3)))) - rad2deg(atan((allParameterValues(i3,6)-allParameterValues(i3,7))./(allParameterValues(i3,2)-allParameterValues(i3,3)))),360)-180)./180;
        tempJRDs(23) = abs(mod(rad2deg(atan((allParameterValues(i3,6)-allParameterValues(i3,8))./(allParameterValues(i3,2)-allParameterValues(i3,4)))) - rad2deg(atan((allParameterValues(i3,7)-allParameterValues(i3,8))./(allParameterValues(i3,3)-allParameterValues(i3,4)))),360)-180)./180;
        tempJRDs(24) = abs(mod(rad2deg(atan((allParameterValues(i3,7)-allParameterValues(i3,8))./(allParameterValues(i3,3)-allParameterValues(i3,4)))) - rad2deg(atan((allParameterValues(i3,6)-allParameterValues(i3,8))./(allParameterValues(i3,2)-allParameterValues(i3,4)))),360)-180)./180;
        for i11 = 1:1:24
            SSEs(i3) = SSEs(i3) + ((tempJRDs(i11)-meanJRDs(i11)).^2);
        end
        if SSEs(i3) < bestFit(9)
            bestFit = [allParameterValues(i3,:),SSEs(i3)];
        end
    end
    % tournament selection: best of every eight bit strings continue
    for i6 = 1:8:1000
        tempI = find(SSEs(i6:(i6+7))==min(SSEs(i6:(i6+7))),1);
        for i10 = 0:1:7
            allBitStrings((i6+i10),:) = allBitStrings(tempI,:);
        end
    end
    % randomize order of bit strings and randomly mutate individual bits
    orderI = randperm(1000);
    tempBitStrings = zeros(1000,112);
    for i7 = 1:1:1000
        tempBitStrings(i7,:) = allBitStrings(orderI(i7),:);
        for i9 = 1:1:112
            tempR = rand();
            if tempR < 0.005
                if tempBitStrings(i7,i9) == 0
                    tempBitStrings(i7,i9) = 1;
                elseif tempBitStrings(i7,i9) == 1
                    tempBitStrings(i7,i9) = 0;
                end
            end
        end
    end
    % for each pair of bit strings, determine random crossover point and
    % exchange bits below that point
    for i8 = 1:2:1000
        cp = randi(112);
        allBitStrings(i8,1:cp) = tempBitStrings((i8+1),1:cp);
        allBitStrings(i8,(cp+1):112) = tempBitStrings(i8,(cp+1):112);
        allBitStrings((i8+1),1:cp) = tempBitStrings(i8,1:cp);
        allBitStrings((i8+1),(cp+1):112) = tempBitStrings((i8+1),(cp+1):112);        
    end
end

c = bestFit;
