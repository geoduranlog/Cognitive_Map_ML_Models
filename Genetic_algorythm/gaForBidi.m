function gabidi = gaForBidi(numGen,predCoords,critCoords)

% randomly generate starting values for each parameter (14 bits each)
allBitStrings = zeros(1000,56);
bestFit = [0,0,0,0,0];
for i5 = 1:1:1000
    for i2 = 1:1:56
        temp = rand();
        if temp < 0.5
            allBitStrings(i5,i2) = 0;
        else
            allBitStrings(i5,i2) = 1;
        end
    end
end
for i = 1:1:numGen
    xBidi = i
    %convert bits to dec and calculate r-squared
    allParameterValues = zeros(1000,4);
    rSquared = zeros(1000,1);
    for i3 = 1:1:1000
        allParameterValues(i3,1) = bin2dec(strcat(num2str(allBitStrings(i3,1)),num2str(allBitStrings(i3,2)),num2str(allBitStrings(i3,3)),num2str(allBitStrings(i3,4)),num2str(allBitStrings(i3,5)),num2str(allBitStrings(i3,6)),num2str(allBitStrings(i3,7)),num2str(allBitStrings(i3,8)),num2str(allBitStrings(i3,9)),num2str(allBitStrings(i3,10)),num2str(allBitStrings(i3,11)),num2str(allBitStrings(i3,12)),num2str(allBitStrings(i3,13)),num2str(allBitStrings(i3,14))))-8191.5;
        allParameterValues(i3,2) = bin2dec(strcat(num2str(allBitStrings(i3,15)),num2str(allBitStrings(i3,16)),num2str(allBitStrings(i3,17)),num2str(allBitStrings(i3,18)),num2str(allBitStrings(i3,19)),num2str(allBitStrings(i3,20)),num2str(allBitStrings(i3,21)),num2str(allBitStrings(i3,22)),num2str(allBitStrings(i3,23)),num2str(allBitStrings(i3,24)),num2str(allBitStrings(i3,25)),num2str(allBitStrings(i3,26)),num2str(allBitStrings(i3,27)),num2str(allBitStrings(i3,28))))-8191.5;
        allParameterValues(i3,3) = (bin2dec(strcat(num2str(allBitStrings(i3,29)),num2str(allBitStrings(i3,30)),num2str(allBitStrings(i3,31)),num2str(allBitStrings(i3,32)),num2str(allBitStrings(i3,33)),num2str(allBitStrings(i3,34)),num2str(allBitStrings(i3,35)),num2str(allBitStrings(i3,36)),num2str(allBitStrings(i3,37)),num2str(allBitStrings(i3,38)),num2str(allBitStrings(i3,39)),num2str(allBitStrings(i3,40)),num2str(allBitStrings(i3,41)),num2str(allBitStrings(i3,42))))./1000)-8.1915;
        allParameterValues(i3,4) = (bin2dec(strcat(num2str(allBitStrings(i3,43)),num2str(allBitStrings(i3,44)),num2str(allBitStrings(i3,45)),num2str(allBitStrings(i3,46)),num2str(allBitStrings(i3,47)),num2str(allBitStrings(i3,48)),num2str(allBitStrings(i3,49)),num2str(allBitStrings(i3,50)),num2str(allBitStrings(i3,51)),num2str(allBitStrings(i3,52)),num2str(allBitStrings(i3,53)),num2str(allBitStrings(i3,54)),num2str(allBitStrings(i3,55)),num2str(allBitStrings(i3,56))))./1000)-8.1915;
        predABs = zeros(length(critCoords(:,1)),2);
        numerator = zeros(length(critCoords(:,1)),1);
        denominator = zeros(length(critCoords(:,1)),1);
        Amean = mean(critCoords(:,1));
        Bmean = mean(critCoords(:,2));
        for i40 = 1:1:length(critCoords(:,1))
            predABs(i40,1:2) = [allParameterValues(i3,1);allParameterValues(i3,2)] + ([allParameterValues(i3,3),(-allParameterValues(i3,4)); allParameterValues(i3,4),allParameterValues(i3,3)] * [predCoords(i40,1);predCoords(i40,2)]);
            numerator(i40,1) = ((critCoords(i40,1)-predABs(i40,1)).^2) + ((critCoords(i40,2)-predABs(i40,2)).^2);
            denominator(i40,1) = ((predABs(i40,1)-Amean).^2) + ((predABs(i40,2)-Bmean).^2);
        end
        rSquared(i3) = (1-(sum(numerator)./sum(denominator)));
        if rSquared(i3) > bestFit(5)
            bestFit = [allParameterValues(i3,:),rSquared(i3)];
        end
    end
    % tournament selection: best of every eight bit strings continue
    for i6 = 1:8:1000
        tempI = find(rSquared(i6:(i6+7))==max(rSquared(i6:(i6+7))),1);
        for i10 = 0:1:7
            allBitStrings((i6+i10),:) = allBitStrings(tempI,:);
        end
    end
    % randomize order of bits strings and randomly mutate individual bits
    orderI = randperm(1000);
    tempBitStrings = zeros(1000,56);
    for i7 = 1:1:1000
        tempBitStrings(i7,:) = allBitStrings(orderI(i7),:);
        for i9 = 1:1:56
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
        cp = randi(56);
        allBitStrings(i8,1:cp) = tempBitStrings((i8+1),1:cp);
        allBitStrings(i8,(cp+1):56) = tempBitStrings(i8,(cp+1):56);
        allBitStrings((i8+1),1:cp) = tempBitStrings(i8,1:cp);
        allBitStrings((i8+1),(cp+1):56) = tempBitStrings((i8+1),(cp+1):56);
    end
end

gabidi = bestFit;