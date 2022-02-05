function o = JRD_modeling_LisaProject_wTraining_IndData(JRDs,actualLocs)

% % reorganizing and aggregating stuff
% allPointingErrors = reshape(JRDs(:,2),96,67);
% allGroupAssignments = reshape(JRDs(:,5),96,67);
% allLocations = reshape(JRDs(:,3),96,67);
% for i = 1:1:length(allPointingErrors(1,:))
%     for i3 = 1:1:4
%         for i4 = 1:1:24
%             orgErrors(i,i3,i4) = allPointingErrors(((i3.*24)+(i4-24)),i);
%             orgGroupAssignments(i,i3,i4) = allGroupAssignments(((i3.*24)+(i4-24)),i);
%             orgLocations(i,i3,i4) = allLocations(((i3.*24)+(i4-24)),i);
%         end
%     end
% end
% sumsA = zeros(23,4);
% nsA = zeros(23,4);
% pnA = 0;
% sumsE = zeros(21,4);
% nsE = zeros(21,4);
% pnE = 0;
% sumsC = zeros(23,4);
% nsC = zeros(23,4);
% pnC = 0;
% for i5 = 1:1:length(orgErrors(:,1,1))
%     if orgGroupAssignments(i5,1,1) == 0
%         pnA = pnA+1;
%     elseif orgGroupAssignments(i5,1,1) == 1
%         pnE = pnE+1;
%     elseif orgGroupAssignments(i5,1,1) == 2
%         pnC = pnC+1;
%     end
%     for i7 = 1:1:4
%         for i8 = 1:1:24
%             if orgGroupAssignments(i5,i7,1) == 0
%                 nsA(pnA,i7) = nsA(pnA,i7)+1;
%                 sumsA(pnA,i7) = sumsA(pnA,i7)+orgErrors(i5,i7,i8);
%             elseif orgGroupAssignments(i5,i7,1) == 1
%                 nsE(pnE,i7) = nsE(pnE,i7)+1;
%                 sumsE(pnE,i7) = sumsE(pnE,i7)+orgErrors(i5,i7,i8);
%             elseif orgGroupAssignments(i5,i7,1) == 2
%                 nsC(pnC,i7) = nsC(pnC,i7)+1;
%                 sumsC(pnC,i7) = sumsC(pnC,i7)+orgErrors(i5,i7,i8);
%             end
%         end
%     end
% end
% meansA = sumsA./nsA;
% meansE = sumsE./nsE;
% meansC = sumsC./nsC;

% % aggregating observed JRD data by trial type
% sumsJrdA = zeros(23,24);
% nsJrdA = zeros(23,24);
% pnJrdA = 0;
% sumsJrdE = zeros(21,24);
% nsJrdE = zeros(21,24);
% pnJrdE = 0;
% sumsJrdC = zeros(23,24);
% nsJrdC = zeros(23,24);
% pnJrdC = 0;
% for i15 = 1:1:length(orgErrors(:,1,1))
%     if orgGroupAssignments(i15,1,1) == 0
%         pnJrdA = pnJrdA+1;
%         for i16 = 1:1:4
%             for i17 = 1:1:24
%                 if orgLocations(i15,i16,i17) == 12
%                     sumsJrdA(pnJrdA,1) = sumsJrdA(pnJrdA,1)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,1) = nsJrdA(pnJrdA,1)+1;
%                 elseif orgLocations(i15,i16,i17) == 13
%                     sumsJrdA(pnJrdA,2) = sumsJrdA(pnJrdA,2)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,2) = nsJrdA(pnJrdA,2)+1;
%                 elseif orgLocations(i15,i16,i17) == 21
%                     sumsJrdA(pnJrdA,3) = sumsJrdA(pnJrdA,3)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,3) = nsJrdA(pnJrdA,3)+1;
%                 elseif orgLocations(i15,i16,i17) == 23
%                     sumsJrdA(pnJrdA,4) = sumsJrdA(pnJrdA,4)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,4) = nsJrdA(pnJrdA,4)+1;
%                 elseif orgLocations(i15,i16,i17) == 31
%                     sumsJrdA(pnJrdA,5) = sumsJrdA(pnJrdA,5)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,5) = nsJrdA(pnJrdA,5)+1;
%                 elseif orgLocations(i15,i16,i17) == 32
%                     sumsJrdA(pnJrdA,6) = sumsJrdA(pnJrdA,6)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,6) = nsJrdA(pnJrdA,6)+1;
%                 elseif orgLocations(i15,i16,i17) == 102
%                     sumsJrdA(pnJrdA,7) = sumsJrdA(pnJrdA,7)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,7) = nsJrdA(pnJrdA,7)+1;
%                 elseif orgLocations(i15,i16,i17) == 103
%                     sumsJrdA(pnJrdA,8) = sumsJrdA(pnJrdA,8)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,8) = nsJrdA(pnJrdA,8)+1;
%                 elseif orgLocations(i15,i16,i17) == 201
%                     sumsJrdA(pnJrdA,9) = sumsJrdA(pnJrdA,9)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,9) = nsJrdA(pnJrdA,9)+1;
%                 elseif orgLocations(i15,i16,i17) == 203
%                     sumsJrdA(pnJrdA,10) = sumsJrdA(pnJrdA,10)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,10) = nsJrdA(pnJrdA,10)+1;
%                 elseif orgLocations(i15,i16,i17) == 301
%                     sumsJrdA(pnJrdA,11) = sumsJrdA(pnJrdA,11)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,11) = nsJrdA(pnJrdA,11)+1;
%                 elseif orgLocations(i15,i16,i17) == 302
%                     sumsJrdA(pnJrdA,12) = sumsJrdA(pnJrdA,12)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,12) = nsJrdA(pnJrdA,12)+1;
%                 elseif orgLocations(i15,i16,i17) == 120
%                     sumsJrdA(pnJrdA,13) = sumsJrdA(pnJrdA,13)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,13) = nsJrdA(pnJrdA,13)+1;
%                 elseif orgLocations(i15,i16,i17) == 130
%                     sumsJrdA(pnJrdA,14) = sumsJrdA(pnJrdA,14)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,14) = nsJrdA(pnJrdA,14)+1;
%                 elseif orgLocations(i15,i16,i17) == 210
%                     sumsJrdA(pnJrdA,15) = sumsJrdA(pnJrdA,15)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,15) = nsJrdA(pnJrdA,15)+1;
%                 elseif orgLocations(i15,i16,i17) == 230
%                     sumsJrdA(pnJrdA,16) = sumsJrdA(pnJrdA,16)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,16) = nsJrdA(pnJrdA,16)+1;
%                 elseif orgLocations(i15,i16,i17) == 310
%                     sumsJrdA(pnJrdA,17) = sumsJrdA(pnJrdA,17)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,17) = nsJrdA(pnJrdA,17)+1;
%                 elseif orgLocations(i15,i16,i17) == 320
%                     sumsJrdA(pnJrdA,18) = sumsJrdA(pnJrdA,18)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,18) = nsJrdA(pnJrdA,18)+1;
%                 elseif orgLocations(i15,i16,i17) == 123
%                     sumsJrdA(pnJrdA,19) = sumsJrdA(pnJrdA,19)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,19) = nsJrdA(pnJrdA,19)+1;
%                 elseif orgLocations(i15,i16,i17) == 132
%                     sumsJrdA(pnJrdA,20) = sumsJrdA(pnJrdA,20)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,20) = nsJrdA(pnJrdA,20)+1;
%                 elseif orgLocations(i15,i16,i17) == 213
%                     sumsJrdA(pnJrdA,21) = sumsJrdA(pnJrdA,21)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,21) = nsJrdA(pnJrdA,21)+1;
%                 elseif orgLocations(i15,i16,i17) == 231
%                     sumsJrdA(pnJrdA,22) = sumsJrdA(pnJrdA,22)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,22) = nsJrdA(pnJrdA,22)+1;
%                 elseif orgLocations(i15,i16,i17) == 312
%                     sumsJrdA(pnJrdA,23) = sumsJrdA(pnJrdA,23)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,23) = nsJrdA(pnJrdA,23)+1;
%                 elseif orgLocations(i15,i16,i17) == 321
%                     sumsJrdA(pnJrdA,24) = sumsJrdA(pnJrdA,24)+orgErrors(i15,i16,i17);
%                     nsJrdA(pnJrdA,24) = nsJrdA(pnJrdA,24)+1;
%                 end
%             end
%         end
%     elseif orgGroupAssignments(i15,1,1) == 1
%         pnJrdE = pnJrdE+1;
%         for i18 = 1:1:4
%             for i19 = 1:1:24
%                 if orgLocations(i15,i18,i19) == 12
%                     sumsJrdE(pnJrdE,1) = sumsJrdE(pnJrdE,1)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,1) = nsJrdE(pnJrdE,1)+1;
%                 elseif orgLocations(i15,i18,i19) == 13
%                     sumsJrdE(pnJrdE,2) = sumsJrdE(pnJrdE,2)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,2) = nsJrdE(pnJrdE,2)+1;
%                 elseif orgLocations(i15,i18,i19) == 21
%                     sumsJrdE(pnJrdE,3) = sumsJrdE(pnJrdE,3)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,3) = nsJrdE(pnJrdE,3)+1;
%                 elseif orgLocations(i15,i18,i19) == 23
%                     sumsJrdE(pnJrdE,4) = sumsJrdE(pnJrdE,4)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,4) = nsJrdE(pnJrdE,4)+1;
%                 elseif orgLocations(i15,i18,i19) == 31
%                     sumsJrdE(pnJrdE,5) = sumsJrdE(pnJrdE,5)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,5) = nsJrdE(pnJrdE,5)+1;
%                 elseif orgLocations(i15,i18,i19) == 32
%                     sumsJrdE(pnJrdE,6) = sumsJrdE(pnJrdE,6)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,6) = nsJrdE(pnJrdE,6)+1;
%                 elseif orgLocations(i15,i18,i19) == 102
%                     sumsJrdE(pnJrdE,7) = sumsJrdE(pnJrdE,7)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,7) = nsJrdE(pnJrdE,7)+1;
%                 elseif orgLocations(i15,i18,i19) == 103
%                     sumsJrdE(pnJrdE,8) = sumsJrdE(pnJrdE,8)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,8) = nsJrdE(pnJrdE,8)+1;
%                 elseif orgLocations(i15,i18,i19) == 201
%                     sumsJrdE(pnJrdE,9) = sumsJrdE(pnJrdE,9)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,9) = nsJrdE(pnJrdE,9)+1;
%                 elseif orgLocations(i15,i18,i19) == 203
%                     sumsJrdE(pnJrdE,10) = sumsJrdE(pnJrdE,10)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,10) = nsJrdE(pnJrdE,10)+1;
%                 elseif orgLocations(i15,i18,i19) == 301
%                     sumsJrdE(pnJrdE,11) = sumsJrdE(pnJrdE,11)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,11) = nsJrdE(pnJrdE,11)+1;
%                 elseif orgLocations(i15,i18,i19) == 302
%                     sumsJrdE(pnJrdE,12) = sumsJrdE(pnJrdE,12)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,12) = nsJrdE(pnJrdE,12)+1;
%                 elseif orgLocations(i15,i18,i19) == 120
%                     sumsJrdE(pnJrdE,13) = sumsJrdE(pnJrdE,13)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,13) = nsJrdE(pnJrdE,13)+1;
%                 elseif orgLocations(i15,i18,i19) == 130
%                     sumsJrdE(pnJrdE,14) = sumsJrdE(pnJrdE,14)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,14) = nsJrdE(pnJrdE,14)+1;
%                 elseif orgLocations(i15,i18,i19) == 210
%                     sumsJrdE(pnJrdE,15) = sumsJrdE(pnJrdE,15)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,15) = nsJrdE(pnJrdE,15)+1;
%                 elseif orgLocations(i15,i18,i19) == 230
%                     sumsJrdE(pnJrdE,16) = sumsJrdE(pnJrdE,16)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,16) = nsJrdE(pnJrdE,16)+1;
%                 elseif orgLocations(i15,i18,i19) == 310
%                     sumsJrdE(pnJrdE,17) = sumsJrdE(pnJrdE,17)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,17) = nsJrdE(pnJrdE,17)+1;
%                 elseif orgLocations(i15,i18,i19) == 320
%                     sumsJrdE(pnJrdE,18) = sumsJrdE(pnJrdE,18)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,18) = nsJrdE(pnJrdE,18)+1;
%                 elseif orgLocations(i15,i18,i19) == 123
%                     sumsJrdE(pnJrdE,19) = sumsJrdE(pnJrdE,19)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,19) = nsJrdE(pnJrdE,19)+1;
%                 elseif orgLocations(i15,i18,i19) == 132
%                     sumsJrdE(pnJrdE,20) = sumsJrdE(pnJrdE,20)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,20) = nsJrdE(pnJrdE,20)+1;
%                 elseif orgLocations(i15,i18,i19) == 213
%                     sumsJrdE(pnJrdE,21) = sumsJrdE(pnJrdE,21)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,21) = nsJrdE(pnJrdE,21)+1;
%                 elseif orgLocations(i15,i18,i19) == 231
%                     sumsJrdE(pnJrdE,22) = sumsJrdE(pnJrdE,22)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,22) = nsJrdE(pnJrdE,22)+1;
%                 elseif orgLocations(i15,i18,i19) == 312
%                     sumsJrdE(pnJrdE,23) = sumsJrdE(pnJrdE,23)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,23) = nsJrdE(pnJrdE,23)+1;
%                 elseif orgLocations(i15,i18,i19) == 321
%                     sumsJrdE(pnJrdE,24) = sumsJrdE(pnJrdE,24)+orgErrors(i15,i18,i19);
%                     nsJrdE(pnJrdE,24) = nsJrdE(pnJrdE,24)+1;
%                 end
%             end
%         end
%     elseif orgGroupAssignments(i15,1,1) == 2
%         pnJrdC = pnJrdC+1;
%         for i20 = 1:1:4
%             for i21 = 1:1:24
%                 if orgLocations(i15,i20,i21) == 12
%                     sumsJrdC(pnJrdC,1) = sumsJrdC(pnJrdC,1)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,1) = nsJrdC(pnJrdC,1)+1;
%                 elseif orgLocations(i15,i20,i21) == 13
%                     sumsJrdC(pnJrdC,2) = sumsJrdC(pnJrdC,2)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,2) = nsJrdC(pnJrdC,2)+1;
%                 elseif orgLocations(i15,i20,i21) == 21
%                     sumsJrdC(pnJrdC,3) = sumsJrdC(pnJrdC,3)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,3) = nsJrdC(pnJrdC,3)+1;
%                 elseif orgLocations(i15,i20,i21) == 23
%                     sumsJrdC(pnJrdC,4) = sumsJrdC(pnJrdC,4)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,4) = nsJrdC(pnJrdC,4)+1;
%                 elseif orgLocations(i15,i20,i21) == 31
%                     sumsJrdC(pnJrdC,5) = sumsJrdC(pnJrdC,5)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,5) = nsJrdC(pnJrdC,5)+1;
%                 elseif orgLocations(i15,i20,i21) == 32
%                     sumsJrdC(pnJrdC,6) = sumsJrdC(pnJrdC,6)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,6) = nsJrdC(pnJrdC,6)+1;
%                 elseif orgLocations(i15,i20,i21) == 102
%                     sumsJrdC(pnJrdC,7) = sumsJrdC(pnJrdC,7)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,7) = nsJrdC(pnJrdC,7)+1;
%                 elseif orgLocations(i15,i20,i21) == 103
%                     sumsJrdC(pnJrdC,8) = sumsJrdC(pnJrdC,8)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,8) = nsJrdC(pnJrdC,8)+1;
%                 elseif orgLocations(i15,i20,i21) == 201
%                     sumsJrdC(pnJrdC,9) = sumsJrdC(pnJrdC,9)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,9) = nsJrdC(pnJrdC,9)+1;
%                 elseif orgLocations(i15,i20,i21) == 203
%                     sumsJrdC(pnJrdC,10) = sumsJrdC(pnJrdC,10)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,10) = nsJrdC(pnJrdC,10)+1;
%                 elseif orgLocations(i15,i20,i21) == 301
%                     sumsJrdC(pnJrdC,11) = sumsJrdC(pnJrdC,11)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,11) = nsJrdC(pnJrdC,11)+1;
%                 elseif orgLocations(i15,i20,i21) == 302
%                     sumsJrdC(pnJrdC,12) = sumsJrdC(pnJrdC,12)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,12) = nsJrdC(pnJrdC,12)+1;
%                 elseif orgLocations(i15,i20,i21) == 120
%                     sumsJrdC(pnJrdC,13) = sumsJrdC(pnJrdC,13)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,13) = nsJrdC(pnJrdC,13)+1;
%                 elseif orgLocations(i15,i20,i21) == 130
%                     sumsJrdC(pnJrdC,14) = sumsJrdC(pnJrdC,14)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,14) = nsJrdC(pnJrdC,14)+1;
%                 elseif orgLocations(i15,i20,i21) == 210
%                     sumsJrdC(pnJrdC,15) = sumsJrdC(pnJrdC,15)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,15) = nsJrdC(pnJrdC,15)+1;
%                 elseif orgLocations(i15,i20,i21) == 230
%                     sumsJrdC(pnJrdC,16) = sumsJrdC(pnJrdC,16)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,16) = nsJrdC(pnJrdC,16)+1;
%                 elseif orgLocations(i15,i20,i21) == 310
%                     sumsJrdC(pnJrdC,17) = sumsJrdC(pnJrdC,17)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,17) = nsJrdC(pnJrdC,17)+1;
%                 elseif orgLocations(i15,i20,i21) == 320
%                     sumsJrdC(pnJrdC,18) = sumsJrdC(pnJrdC,18)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,18) = nsJrdC(pnJrdC,18)+1;
%                 elseif orgLocations(i15,i20,i21) == 123
%                     sumsJrdC(pnJrdC,19) = sumsJrdC(pnJrdC,19)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,19) = nsJrdC(pnJrdC,19)+1;
%                 elseif orgLocations(i15,i20,i21) == 132
%                     sumsJrdC(pnJrdC,20) = sumsJrdC(pnJrdC,20)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,20) = nsJrdC(pnJrdC,20)+1;
%                 elseif orgLocations(i15,i20,i21) == 213
%                     sumsJrdC(pnJrdC,21) = sumsJrdC(pnJrdC,21)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,21) = nsJrdC(pnJrdC,21)+1;
%                 elseif orgLocations(i15,i20,i21) == 231
%                     sumsJrdC(pnJrdC,22) = sumsJrdC(pnJrdC,22)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,22) = nsJrdC(pnJrdC,22)+1;
%                 elseif orgLocations(i15,i20,i21) == 312
%                     sumsJrdC(pnJrdC,23) = sumsJrdC(pnJrdC,23)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,23) = nsJrdC(pnJrdC,23)+1;
%                 elseif orgLocations(i15,i20,i21) == 321
%                     sumsJrdC(pnJrdC,24) = sumsJrdC(pnJrdC,24)+orgErrors(i15,i20,i21);
%                     nsJrdC(pnJrdC,24) = nsJrdC(pnJrdC,24)+1;
%                 end
%             end
%         end
%     end
% end
% meansJrdA = sumsJrdA./nsJrdA;
% meansJrdE = sumsJrdE./nsJrdE;
% meansJrdC = sumsJrdC./nsJrdC;

%sort JRDs
tempJRDs = JRDs;
JRDs = zeros(24,1);
for i50 = 1:1:24
    if tempJRDs(i50,2) == 12
        JRDs(1,1) = JRDs(1,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 13
        JRDs(2,1) = JRDs(2,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 21
        JRDs(3,1) = JRDs(3,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 23
        JRDs(4,1) = JRDs(4,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 31
        JRDs(5,1) = JRDs(5,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 32
        JRDs(6,1) = JRDs(6,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 102
        JRDs(7,1) = JRDs(7,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 103
        JRDs(8,1) = JRDs(8,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 201
        JRDs(9,1) = JRDs(9,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 203
        JRDs(10,1) = JRDs(10,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 301
        JRDs(11,1) = JRDs(11,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 302
        JRDs(12,1) = JRDs(12,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 120
        JRDs(13,1) = JRDs(13,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 130
        JRDs(14,1) = JRDs(14,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 210
        JRDs(15,1) = JRDs(15,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 230
        JRDs(16,1) = JRDs(16,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 310
        JRDs(17,1) = JRDs(17,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 320
        JRDs(18,1) = JRDs(18,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 123
        JRDs(19,1) = JRDs(19,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 132
        JRDs(20,1) = JRDs(20,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 213
        JRDs(21,1) = JRDs(21,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 231
        JRDs(22,1) = JRDs(22,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 312
        JRDs(23,1) = JRDs(23,1) + tempJRDs(i50,1);
    elseif tempJRDs(i50,2) == 321
        JRDs(24,1) = JRDs(24,1) + tempJRDs(i50,1);
    end
end

%genetic algorithm for determining coordinates from observed JRD data
JRDs(:,1) = JRDs(:,1)./4;
meanMeansJrdA = JRDs(:,1)./180;
%meanMeansJrdE = mean(meansJrdE)./180;
%meanMeansJrdC = mean(meansJrdC)./180;
obsCoordsA = gaForCoordsFromJRDs(meanMeansJrdA,100);
%obsCoordsE = gaForCoordsFromJRDs(meanMeansJrdE,1);
%obsCoordsC = gaForCoordsFromJRDs(meanMeansJrdC,1);

% fitting the cognitive map framework (assumed Euclidean distances for now)
%observerA = [mean(actualLocs(:,1)),mean(actualLocs(:,2)),0];
observerA = [mean(actualLocs(:,1)),mean(actualLocs(:,2)),(165.7.*138.7./93)];
actualLocsA = [[actualLocs(1,1),actualLocs(1,2),0];[actualLocs(2,1),actualLocs(2,2),0];[actualLocs(3,1),actualLocs(3,2),0];[actualLocs(4,1),actualLocs(4,2),0]];
actualLocsA = vertcat(actualLocsA,observerA);
bestFit = [[0,0];[0,0];[0,0]];
r = 2;
for i32 = 0:0.1:3
%for i32 = 0:0.01:3
    c = i32
    similarityA = zeros((length(actualLocsA(:,1))-1),1);
    for i30 = 1:1:(length(actualLocsA(:,1))-1)
        sumDist = zeros(1,3);
        for i31 = 1:1:length(actualLocsA(:,1))
            sumDist(1) = sumDist(1) + (abs(actualLocsA(i30,1)-actualLocsA(i31,1)).^r);
            sumDist(2) = sumDist(2) + (abs(actualLocsA(i30,2)-actualLocsA(i31,2)).^r);
            sumDist(3) = sumDist(3) + (abs(actualLocsA(i30,3)-actualLocsA(i31,3)).^r);
        end
        aggrDistA = (sum(sumDist./3)).^(1./r);
        similarityA(i30) = exp((-c).*aggrDistA);
    end
    abstractionA = (similarityA./max(similarityA));
    imaginedHeading = zeros(2,24);
    imaginedHeading(:,1) = [abstractionA(3),mod((rad2deg(atan((actualLocsA(2,2)-actualLocsA(1,2))./(actualLocsA(2,1)-actualLocsA(1,1))))-90),360)-180];
    imaginedHeading(:,2) = [abstractionA(4),mod((rad2deg(atan((actualLocsA(2,2)-actualLocsA(1,2))./(actualLocsA(2,1)-actualLocsA(1,1))))-90),360)-180];
    imaginedHeading(:,3) = [abstractionA(2),mod((rad2deg(atan((actualLocsA(3,2)-actualLocsA(1,2))./(actualLocsA(3,1)-actualLocsA(1,1))))-90),360)-180];
    imaginedHeading(:,4) = [abstractionA(4),mod((rad2deg(atan((actualLocsA(3,2)-actualLocsA(1,2))./(actualLocsA(3,1)-actualLocsA(1,1))))-90),360)-180];
    imaginedHeading(:,5) = [abstractionA(2),mod((rad2deg(atan((actualLocsA(4,2)-actualLocsA(1,2))./(actualLocsA(4,1)-actualLocsA(1,1))))-90),360)-180];
    imaginedHeading(:,6) = [abstractionA(3),mod((rad2deg(atan((actualLocsA(4,2)-actualLocsA(1,2))./(actualLocsA(4,1)-actualLocsA(1,1))))-90),360)-180];
    imaginedHeading(:,7) = [abstractionA(3),mod((rad2deg(atan((actualLocsA(1,2)-actualLocsA(2,2))./(actualLocsA(1,1)-actualLocsA(2,1))))-90),360)-180];
    imaginedHeading(:,8) = [abstractionA(4),mod((rad2deg(atan((actualLocsA(1,2)-actualLocsA(2,2))./(actualLocsA(1,1)-actualLocsA(2,1))))-90),360)-180];
    imaginedHeading(:,9) = [abstractionA(2),mod((rad2deg(atan((actualLocsA(1,2)-actualLocsA(3,2))./(actualLocsA(1,1)-actualLocsA(3,1))))-90),360)-180];
    imaginedHeading(:,10) = [abstractionA(4),mod((rad2deg(atan((actualLocsA(1,2)-actualLocsA(3,2))./(actualLocsA(1,1)-actualLocsA(3,1))))-90),360)-180];
    imaginedHeading(:,11) = [abstractionA(2),mod((rad2deg(atan((actualLocsA(1,2)-actualLocsA(4,2))./(actualLocsA(1,1)-actualLocsA(4,1))))-90),360)-180];
    imaginedHeading(:,12) = [abstractionA(3),mod((rad2deg(atan((actualLocsA(1,2)-actualLocsA(4,2))./(actualLocsA(1,1)-actualLocsA(4,1))))-90),360)-180];
    imaginedHeading(:,13) = [abstractionA(1),mod((rad2deg(atan((actualLocsA(3,2)-actualLocsA(2,2))./(actualLocsA(3,1)-actualLocsA(2,1))))-90),360)-180];
    imaginedHeading(:,14) = [abstractionA(1),mod((rad2deg(atan((actualLocsA(4,2)-actualLocsA(2,2))./(actualLocsA(4,1)-actualLocsA(2,1))))-90),360)-180];
    imaginedHeading(:,15) = [abstractionA(1),mod((rad2deg(atan((actualLocsA(2,2)-actualLocsA(3,2))./(actualLocsA(2,1)-actualLocsA(3,1))))-90),360)-180];
    imaginedHeading(:,16) = [abstractionA(1),mod((rad2deg(atan((actualLocsA(4,2)-actualLocsA(3,2))./(actualLocsA(4,1)-actualLocsA(3,1))))-90),360)-180];
    imaginedHeading(:,17) = [abstractionA(1),mod((rad2deg(atan((actualLocsA(2,2)-actualLocsA(4,2))./(actualLocsA(2,1)-actualLocsA(4,1))))-90),360)-180];
    imaginedHeading(:,18) = [abstractionA(1),mod((rad2deg(atan((actualLocsA(3,2)-actualLocsA(4,2))./(actualLocsA(3,1)-actualLocsA(4,1))))-90),360)-180];
    imaginedHeading(:,19) = [abstractionA(4),mod((rad2deg(atan((actualLocsA(3,2)-actualLocsA(2,2))./(actualLocsA(3,1)-actualLocsA(2,1))))-90),360)-180];
    imaginedHeading(:,20) = [abstractionA(3),mod((rad2deg(atan((actualLocsA(4,2)-actualLocsA(2,2))./(actualLocsA(4,1)-actualLocsA(2,1))))-90),360)-180];
    imaginedHeading(:,21) = [abstractionA(4),mod((rad2deg(atan((actualLocsA(2,2)-actualLocsA(3,2))./(actualLocsA(2,1)-actualLocsA(3,1))))-90),360)-180];
    imaginedHeading(:,22) = [abstractionA(2),mod((rad2deg(atan((actualLocsA(4,2)-actualLocsA(3,2))./(actualLocsA(4,1)-actualLocsA(3,1))))-90),360)-180];
    imaginedHeading(:,23) = [abstractionA(3),mod((rad2deg(atan((actualLocsA(2,2)-actualLocsA(4,2))./(actualLocsA(2,1)-actualLocsA(4,1))))-90),360)-180];
    imaginedHeading(:,24) = [abstractionA(2),mod((rad2deg(atan((actualLocsA(3,2)-actualLocsA(4,2))./(actualLocsA(3,1)-actualLocsA(4,1))))-90),360)-180];
    modelJrdA = zeros(1,24);
    for i33 = 1:1:24
%        modelJrdA(i33) = circ_vmpdf(imaginedHeading(2,i33),0,0);
        modelJrdA(i33) = circ_vmpdf(imaginedHeading(2,i33),0,imaginedHeading(1,i33));
    end
    predCoordsA = gaForCoordsFromJRDs(modelJrdA,100);
    obsCoordsA = transpose([obsCoordsA(1:4);obsCoordsA(5:8)]);
    predCoordsA = transpose([predCoordsA(1:4);predCoordsA(5:8)]);
    currentFit = gaForBidi(100,obsCoordsA,predCoordsA);
    bf = bestFit
    if currentFit(5) > bestFit(1,2)
        bestFit(1,:) = [c,currentFit(5)]
        bestFitModelJRDs = modelJrdA;
    end
end



o = bestFitModelJRDs;