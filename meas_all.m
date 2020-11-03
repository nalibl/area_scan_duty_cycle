imgs = dir('D:\crystal_measrurement\lext4000_measurements/*.bmp');
num_imgs = size(imgs, 1);
im_dc = zeros(num_imgs, 1);
for img_iter=1:num_imgs
    im_path = ['D:\crystal_measrurement\lext4000_measurements/' imgs(img_iter).name];
    im = double(imread(im_path));
    im_dc(img_iter) = meas_dc_img(im);
end
figure;
plot(im_dc,'r*');
xlim([0, num_imgs + 1]);
xlabel('Image number');
ylabel('Extracted DC');
title('Duty cycle analysis');
%% Single image example
sample_img = double(imread(['D:\crystal_measrurement\lext4000_measurements/' imgs(4).name]));
im_gray = sqrt(sum(sample_img.^2,3));
figure;
imagesc(im_gray);
