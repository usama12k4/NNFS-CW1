data=importdata('breast-cancer-wisconsin.data');
list=[100,200,300,400,500,600];
inputData=data(:,2:10);
outputData=data(:,11);
inputtraindatafirst=inputData(1:list(1)/2,:);
inputtraindatalast=inputData(size(inputData)-list(1)/2+1:size(inputData),:);
targetdatafirst=outputData(1:list(1)/2,:);
targetdatalast=outputData(size(outputData)-list(1)/2+1:size(outputData),:);
concattraininginput = cat(1,inputtraindatafirst,inputtraindatalast);
concattrainingoutput  = cat(1,targetdatafirst,targetdatalast);
testinputData=inputData(list(1)/2+1:size(inputData)-list(1)/2,:);
testoutputData=outputData(list(1)/2+1:size(outputData)-list(1)/2,:);
net = newff(concattraininginput',concattrainingoutput',20, {'tansig' 'tansig'}, 'trainr', 'learngd', 'mse');
net.trainParam.goal = 0.01;
net.trainParam.epochs = 100;
net = train(net, concattraininginput',concattrainingoutput');
Arsenal=net(testinputData');
sanchez=Arsenal';
counter=0;
for i=1:size(sanchez)
if (sanchez(i)<=3)
sanchez(i)=2;
else
sanchez(i)=4;
end
if(sanchez(i)== testouputData(i))
counter=counter+1;
end
end
percentage=counter/size(testoutputData,1)*100;
disp(percentage);