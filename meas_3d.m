imgs = dir('D:\crystal_measrurement\lext4000_measurements\*.csv');
num_imgs = size(imgs, 1);
im_dc = zeros(num_imgs, 1);
for img_iter=1:num_imgs
    im_path = ['D:\crystal_measrurement\lext4000_measurements\' imgs(img_iter).name];    
    im = csvread(im_path, 15, 2);
    im_dc(img_iter) = meas_dc_img(im);
end
figure;
plot(im_dc,'r*');
xlim([0, num_imgs + 1]);
xlabel('Image number');
ylabel('Extracted DC');
title('Duty cycle analysis');