function seg = segdiv(a)
% a - �������� ����������� (��� ��� �����)
X = size(a,1); % � - ������ �����������
Nc = (X.^2)/64; % Nc - ����� ��������� ����������� �, ��� ���������,
% ���������� ���������� ����������� � ����������� ��� ���
seg(:,:,1) = a(1:8,1:8);
seg(:,:,Nc) = a(X-7:X,X-7:X);
for b = 2:(Nc-1)
    if rem(b,sqrt(Nc))==0
        seg(:,:,b) = a(X-7:X,8*(ceil(b/sqrt(Nc))-1)+1:8*(ceil(b/sqrt(Nc))-1)+8);
    else
        seg(:,:,b) = a(8*(b-sqrt(Nc)*floor(b/sqrt(Nc))-1)+1:8*(b-sqrt(Nc)*floor(b/sqrt(Nc))-1)+8,8*(ceil(b/sqrt(Nc))-1)+1:8*(ceil(b/sqrt(Nc))-1)+8);
    end
end
