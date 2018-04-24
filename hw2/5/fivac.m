A = imread('C:\Users\harik\Desktop\EAS596\hw3\UB.png')
redChannel = A(:,:,1); % Red channel
greenChannel = A(:,:,2); % Green channel
blueChannel = A(:,:,3); % Blue channel

r=double(redChannel);
g=double(greenChannel);
b=double(blueChannel);

[U_R_SVD, S_R_SVD, V_R_SVD] = svd(r);
[U_G_SVD, S_G_SVD, V_G_SVD] = svd(g);
[U_B_SVD, S_B_SVD, V_B_SVD] = svd(b);

for i=1:50:200

    k= i;
    rank_R = U_R_SVD(:, 1: k)* S_R_SVD(1:k, 1:k)* V_R_SVD(:, 1:k)';
    rank_G = U_G_SVD(:, 1:k) * S_G_SVD(1:k, 1:k) * V_G_SVD(:, 1:k)';
    rank_B = U_B_SVD(:, 1:k) * S_B_SVD(1:k, 1:k) * V_B_SVD(:, 1:k)';
    
    rank_image = cat(3,rank_R,rank_G,rank_B);
    figure
    imshow(uint8(rank_image))
end
