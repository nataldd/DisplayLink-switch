function one = concat (a, X)
% a - ����, ��������������� ��� ����������� � ������ �������
% � - ������ �����������
N = size(a,1); % N - ������ ��������
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