function configButtonPushed()
global g
global d
global s
   [filename, pathname] = uigetfile('*.cfg', 'Pick a configuration file to load');
    if isequal(filename,0) || isequal(pathname,0)
       disp('User pressed cancel')
    else
       fname= fullfile(pathname, filename);
       load(fname,'-mat','s')
    end

  if isempty(s.answer)
           s.answer{1}='[s11 s21;s21 s22]';
           for i=2:7
                s.answer{i}='[-50 0]';
          end
 end


T=[];
 prompt={
     'Enter the plot format',...
     'Enter the ylim size for parameter1',...
     'Enter the ylim size for parameter2',...
     'Enter the ylim size for parameter3',...
     'Enter the ylim size for parameter4',...
     'Enter the ylim size for parameter5',...
     'Enter the ylim size for parameter6'};
   name='Parameter setup';
   numlines=1;
   defaultanswer=s.answer;
   s.answer=inputdlg(prompt,name,numlines,defaultanswer);
   g.txt_input1.Value=s.answer{1}
 % save the current input back to the configuraiton file and default
 % load file
 save(fname,'-mat', 's') 
 save('default.mat','-mat','s')