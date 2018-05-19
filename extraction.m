function a = extraction(enc,xys)
% а - двоичное содержимое извлеченного ЦВЗ
% enc - поле коэффициентов ДКП со встроенным сообщением ЦВЗ
% xys - массив координат измененных коэффициентов
a = ones(sqrt(size(xys,1)));
c = 1;
d = 1;
for ii = 1:size(xys,1)
    if (abs(enc(xys(ii,1),xys(ii,2),ii)) - abs(enc(xys(ii,3),xys(ii,4),ii)))> 0
        a(c,d) = 0;
    else a(c,d) = 1;
    end;
    d = d + 1;
    if (d > sqrt(size(xys,1)))
        d = 1;
        c = c + 1;
    end;
end;