%-----------------------------------------------------------------------%
%   Import data from Excel and export it in the desired order
%                          as a Matlab file
%---------------------------------------------------------------------------
clear all 

npart=67; %Total of participants

data = xlsread('newJRD.xlsx'); %Read the ncal values from Excel file



%---%Sort rows in ascending order according to its trial No.--Run only once
B=ones(size(data));  %Prellocation for speed

for n=1:length(data(:,1))/12    %There are 12 trials per block & 4 blocks per participant
    
    a=1+12*(n-1);
B(a:a+11,:) = sortrows(data(a:a+11,:),3);  
end

%xlswrite('ordered_JRD.xlsx',B) ;


%-------Order Data in the desired form---------
A=ones(npart,48);  %Prellocation for speed
j=1;

    
   for n=1:length(data(:,1))/48  
    a=1+48*(n-1);
    

A(j,1:48)=B(a:a+47,2);
 
   j=j+1;
   
   end

xlswrite('ordered2_JRD.xlsx',A) ;

%% Use the complete Data Set and export it as a Matlab file

%Read the ncal values from Excel file
data_all = xlsread('Overral_AllData.xlsx'); 

%->SAVING THE DATA<-
%save DataAll.mat data_all

%test:
%load DataAll.mat 
