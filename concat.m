function one = concat (a, X)
% a - поле, предназначенное для объединения в единую матрицу
% Х - размер изображения
N = size(a,1); % N - размер сегмента
one = a(:,:,1);
for kk = 2:(X/N)
    one = [one; a(:,:,kk)];
end;
for ii = (X/N)+1:(X/N):size(a,3)
    column = a(:,:,ii);
    for jj = ii+1:ii+(X/N-1)
        column = [column; a(:,:,jj)];
    end;
    one = [one column];
end;