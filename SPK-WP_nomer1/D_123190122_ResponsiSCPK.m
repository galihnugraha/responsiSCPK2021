clc; clear;
%untuk membersihkan jendela command windows

%awal mengambil data dari dataset
data = readtable('Real estate valuation data set.xlsx', 'PreserveVariableNames', true);
data2 = data(1:50,3:5);
data3 = data(1:50,8);
data4 = [data2 data3];
%akhir mengambil data dari dataset

x = table2array(data4); 
%variable x sebagai data rating kecocokan dari masing-masing alternatif
k = [0, 0, 1, 0];
%atribut tiap-tiap kriteria, dimana nilai 1 = keuntungan, dan 0 = biaya
w = [3, 5, 4, 1];
%Nilai bobot tiap kriteria (1=sangat buruk, 2=buruk, 3=cukup, 4=tinggi, 5=sangat tinggi)

%tahapan pertama, perbaikan bobot
[m, n]=size(x); %inisialisasi ukuran x
w = w ./ sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot

%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)
for j = 1:n
    if k(j) == 0, w(j) = -1*w(j);
    end
end
for i = 1:m
    s(i) = prod(x(i,:).^w);
end

%tahapan ketiga, proses perangkingan
v = s / sum(s);

%tahapan terakhir, menampilkan pada console
v = v.';

nomorRumah = data(1:50,1);
nomorRumah = table2array(nomorRumah);

v = [nomorRumah v];
v = sortrows(v, 2,'descend');
v = v(1:10,:);

indexNumber = [1 2 3 4 5 6 7 8 9 10];
indexNumber = indexNumber.';

v = [indexNumber v];

hasil = array2table(v,'VariableNames',{'No. Urut Rekomendasi','Nomor Rumah','Nilai Index SPK-WP'});

fprintf('10 Rumah terbaik rekomendasi oleh SPK-WP\n');
fprintf('Yang paling direkomendasikan oleh program adalah yang nilai indexnya paling besar\n\n');
disp(hasil);





