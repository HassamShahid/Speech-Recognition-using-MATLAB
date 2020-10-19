function Voice_Rec(~)
Fs = 70000;         			% Sample Frequency 
x=audioread('test147.wav');
%
% tag wave information 
%
voice=cov(x);
%

y0=audioread('denied.wav'); 	%'denied.wav' was used here as reference
y1=audioread('hassam171.wav');
y2=audioread('moiz147.wav');
y3=audioread('hamza157.wav');
y4=audioread('hassan165.wav');
y5=audioread('miss.wav');

h=audioread('allow.wav');


ref=cov(y0);
delta0 = abs(ref - voice);
sel = ref;
dif = abs(delta0);
 
% all allowed wave files must be loaded and compared 
% to the input, hassam171 at a time
%
hassam171=cov(y1);
delta1 = abs(hassam171 - voice);
if (delta1 <= dif) 
    sel = hassam171;
    dif = abs(delta1);
end
  
moiz147 = cov(y2);
delta2 = abs(moiz147 - voice);
if (delta2 <= dif) 
    sel = moiz147;
    dif = abs(delta2);
end 
     
hamza157 = cov(y3);
delta3 = abs(hamza157 - voice);
if (abs(delta3) <= dif) 
    sel = hamza157;
    dif = abs(delta3);
end
 
hassan165 = cov(y4);
delta4 = abs(hassan165 - voice);
if (delta4 <= dif) 
    sel = hassan165;
    dif = abs(delta4);
end 
 
miss= cov(y5);
delta5 = abs(miss- voice);
if (delta5 <= dif) 
    sel = miss;
    dif = abs(delta5);
end
 
 
if sel == hassam171
    soundsc(y1,Fs)
        soundsc(h,Fs)
elseif sel == moiz147
    soundsc(y2,Fs)
        soundsc(h,Fs)
elseif sel == hamza157
    soundsc(y3,Fs)
        soundsc(h,Fs)
elseif sel == hassan165
    soundsc(y4,Fs)
        soundsc(h,Fs)
elseif sel == miss
    soundsc(y5,Fs)
        soundsc(h,Fs)
else soundsc(audioread('denied.wav'),Fs)
   
end
