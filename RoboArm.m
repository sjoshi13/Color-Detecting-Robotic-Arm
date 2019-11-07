clear all

a=arduino();
w=webcam(2);
s1=servo(a,'D6');
s2=servo(a,'D8');
s3=servo(a,'D7');
s4=servo(a,'D9');
while(1)
 writePosition(s1,0)
 pause(.5)
  writePosition(s2,0.5)
   pause(.5)
   writePosition(s3,0.2)
    pause(.5)
    writePosition(s4,0)%initial
pause(2)
 writePosition(s2,0.2)%grip
  pause(.9)
  writePosition(s3,0.3)
   pause(1)
   writePosition(s4,.2)%open
   pause(1)
  writePosition(s4,0)%hold
  pause(1)
  
  writePosition(s3,0)
  writePosition(s2,0.5)

  writePosition(s1,.5)%turn to laptop
 
pause(3)
a=snapshot(w);
imshow(a)
a1=rgb2gray(a);
r=im2bw(a(:,:,1)-a1,.21);
figure,imshow(r)
g=im2bw(a(:,:,2)-a1,.21);
figure,imshow(g)
b=im2bw(a(:,:,3)-a1,.21);
figure,imshow(b)
[rr rc]=size(r);
cr=0;
[gr gc]=size(g);
cg=0;
[br bc]=size(b);
cb=0;
for i=1:rr
    for j=1:rc
        if r(i,j)==1
            cr=cr+1;
        end 
    end
end
for i=1:gr
    for j=1:gc
        if g(i,j)==1
            cg=cg+1;
        end 
    end
end
for i=1:br
    for j=1:bc
        if b(i,j)==1
            cb=cb+1;
        end 
    end
end
y=[cr cg cb];
x=max(y);
if x==cr
    disp('red')
    writePosition(s1,.3);%red box at .3
     pause(1)
    writePosition(s2,0.2) 
    pause(1)
  writePosition(s3,0.3)
   pause(1)
   writePosition(s4,.2)
   pause(2) 
  writePosition(s2,0.5)
   pause(1)
   writePosition(s3,0.2)
    pause(1)
    writePosition(s4,0)%in
    writePosition(s1,0)
 
end
    if x==cg
        disp('green')
        writePosition(s1,.8);%blue box at .3
     pause(1)
    writePosition(s2,0.2) 
    pause(1)
  writePosition(s3,0.3)
   pause(1)
   writePosition(s4,.2)
    pause(2)
  writePosition(s2,0.5)
   pause(1)
   writePosition(s3,0.2)
    pause(1)
    writePosition(s4,0)%in
    writePosition(s1,0)
    
    end 
        if x==cb
            disp('blue')
           writePosition(s1,1);%blue box at .3
     pause(1)
    writePosition(s2,0.2) 
    pause(1)
  writePosition(s3,0.3)
   pause(1)
   writePosition(s4,.2)
    pause(2)
  writePosition(s2,0.5)
   pause(1)
   writePosition(s3,0.2)
    pause(1)
    writePosition(s4,0)%in
    writePosition(s1,0)
   
        end
end