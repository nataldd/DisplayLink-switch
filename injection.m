function [enc,xys] = injection(dwm,a,P)
% enc - поле коэффициентов ДКП со встроенным сообщением ЦВЗ 
% xys - массив координат измененных коэффициентов 
% dwm - двоичное содержимое ЦВЗ 
% а - поле коэффициентов ДКП
% р - порог 
enc = a; 
c = 1;
xys = zeros(size(dwm,2),4);
for ii=1:size(dwm,1)    
    for jj=1:size(dwm,2)
        % Определение случайных координат первого коэффициента ДКП       
        y = rand;     
        z = rand;      
        if (round(y)==1) 
            u1 = round(z*7)+1; 
            v1 = 9-u1;        
        else
            u1 = round(z*6)+2;
            v1 = 10-u1;    
        end;   
        % Определение случайных координат второго коэффициента ДКП      
        u2 = u1;   
        while (u2==u1)
            y = rand;  
            z = rand;   
            if (round(y)==1) 
                u2 = round(z*7)+1; 
                v2 = 9-u2;         
            else
                u2 = round(z*6)+2;  
                v2 = 10-u2;         
            end;      
        end;     
        xys(c,1) = u1; 
        xys(c,2) = v1;     
        xys(c,3) = u2;  
        xys(c,4) = v2;  
        % Встраивание двоичного содержимого ЦВЗ в сегменты коэффициентов      
        % ДКП контейнера методом Коха-Жао     
        if dwm(ii,jj)==1          
            while (abs(enc(u1,v1,c))-abs(enc(u2,v2,c))>=-P)
                if (enc(u1,v1,c)>0 && enc(u2,v2,c)>0) || (enc(u1,v1,c)<0 && enc(u2,v2,c)<0)   
                    enc(u1,v1,c)=enc(u1,v1,c)-1;                 
                    enc(u2,v2,c)=enc(u2,v2,c)+1;
                elseif enc(u1,v1,c)<0  
                    enc(u1,v1,c)=enc(u1,v1,c)+1; 
                    enc(u2,v2,c)=enc(u2,v2,c)+1;  
                elseif enc(u2,v2,c)<0             
                    enc(u1,v1,c)=enc(u1,v1,c)-1;  
                    enc(u2,v2,c)=enc(u2,v2,c)-1;  
                end;   
            end;       
            c=c+1;     
        else
            while (abs(enc(u1,v1,c))-abs(enc(u2,v2,c))<=P)    
                if (enc(u1,v1,c)>0 && enc(u2,v2,c)>0) || (enc(u1,v1,c)<0 && enc(u2,v2,c)<0)    
                    enc(u1,v1,c)=enc(u1,v1,c)+1;              
                    enc(u2,v2,c)=enc(u2,v2,c)-1;          
                elseif enc(u1,v1,c)<0           
                    enc(u1,v1,c)=enc(u1,v1,c)-1;  
                    enc(u2,v2,c)=enc(u2,v2,c)-1;  
                elseif enc(u2,v2,c)<0             
                    enc(u1,v1,c)=enc(u1,v1,c)+1;  
                    enc(u2,v2,c)=enc(u2,v2,c)+1;    
                end;      
            end;          
            c=c+1;        
        end;   
    end; 
end
 
 