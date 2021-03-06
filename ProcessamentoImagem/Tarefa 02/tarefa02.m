%% Computa��o Gr�fica e Processamento Digital de Imagens - Tarefa 02

%  Descri��o
%  ------------
%
%  Este arquivo cont�m o c�digo para solu��o do arquivo tarefa02.pdf
%  Autor: Felipe Rodrigues Veludo Gouveia
%  Data: 24-10-2017
%
%  Fun��es associadas:
%  --------------------
%     grayscale.m
%
%
%   Obs: Os Warnings de imagens grandes foram desligados na linha 21 para
%   maior fluidez de execu��o.
%

%% Inicializa��o
clear ; close all; clc
warning('off', 'Images:initSize:adjustingMag'); % desligando warning de imagem muito grande

%% ==================== Quest�o 1: Implementar uma rotina para converter imagens para grayscale ===================
fprintf('Quest�o 1: Implementar uma rotina para converter imagens para grayscale.\n');
image_rgb = imread('C:\Users\Felipe\Desktop\tarefa02\starry_night.jpg'); %
[image_gray] = grayscale(image_rgb);

imwrite(image_gray, 'C:\Users\Felipe\Desktop\tarefa02\imagem_cinza.jpg', 'jpg')

figure('Name','Imagem Original x Imagem Cinza'), imshowpair(image_rgb, image_gray, 'montage')

fprintf('Programa pausado. Pressione ENTER para continuar para pr�xima quest�o.\n');
pause;

%% ==================== Quest�o 2: Implementar uma rotina para calcular e exibir o histograma da imagem cinza  ===================
fprintf('Quest�o 2: Implementar uma rotina para calcular e exibir o histograma da imagem cinza.\n');

figure;

histogram(image_gray), title('Histograma da Image Cinza');
    xlabel('Valores dos N�veis de Cinza', 'fontsize', 10);
    ylabel('Quantidade de Pixels da Imagem', 'fontsize', 10);

fprintf('Programa pausado. Pressione ENTER para continuar para pr�xima quest�o.\n');
pause;

%% ==================== Quest�o 3: Implementar uma rotina para Transforma��o de Intensidade, Histogramas  ===================
fprintf('Quest�o 3: Implementar uma rotina para Transforma��o de Intensidade, Histogramas.\n');

g1 = gamma_correction(image_gray, 1.5);
g2 = gamma_correction(image_gray, 0.5);

% Gamma = 1.5
figure('Name','Imagem Original x Imagem Transformada com Gamma = 1.5'), imshowpair(image_gray, g1, 'montage');
figure('Name','Histogramas da Imagem Original x Imagem Transformada com Gamma = 1.5');
subplot(1,2,1), histogram(image_gray), title('Histograma da Imagem Original');
subplot(1,2,2), histogram(g1), title('Histograma da Transforma��o de Intensidade com Gamma = 1.5');
imwrite(g1, 'C:\Users\Felipe\Desktop\tarefa02\transf_int_gamma15.jpg', 'jpg');

% Gamma = 0.5
figure('Name','Imagem Original x Imagem Transformada com Gamma = 0.5'), imshowpair(image_gray, g2, 'montage');
figure('Name','Histogramas da Imagem Original x Imagem Transformada com Gamma = 0.5');
subplot(1,2,1), histogram(image_gray), title('Histograma da Imagem Original');
subplot(1,2,2), histogram(g2), title('Histograma da Transforma��o de Intensidade com Gamma = 0.5');
imwrite(g2, 'C:\Users\Felipe\Desktop\tarefa02\transf_int_gamma05.jpg', 'jpg');

% Fun��es de Mapeamento?
figure;
subplot(1,2,1);plot(( 0:1:255).^1.5);axis tight;
legend('Para Gamma = 1.5');

subplot(1,2,2);plot(( 0:1:255).^0.5);axis tight;
legend('Para Gamma = 0.5');

fprintf('Programa pausado. Pressione ENTER para continuar para pr�xima quest�o.\n');
pause;

%% ==================== Quest�o 4: Implementar uma rotina para Equaliza��o de Histogramas  ===================
fprintf('Quest�o 4: Implementar uma rotina para Equaliza��o de Histogramas.\n');
imagem_equalizada = equalize_histogram(image_gray);

figure('Name','Imagem Original x Imagem Equalizada'), imshowpair(image_gray,imagem_equalizada,'montage');
figure('Name','Histogramas da Imagem Original x Imagem Equalizada');
subplot(1,2,1), histogram(image_gray), title('Histograma da Imagem Original');
subplot(1,2,2), histogram(imagem_equalizada), title('Histograma da Imagem Equalizada');

fprintf('Tarefa 02 conclu�da.\n');

