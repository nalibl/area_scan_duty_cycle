function [dc_result] = meas_dc_img(im)
%MEAS_DC_IMG Summary of this function goes here
%   Detailed explanation goes here
% Filter yellow
% yellow_mask = (im(:,:,3)~=0);
yellow_mask = importdata('D:\crystal_measrurement\text_mask.mat');
% Get gray
im_gray = sqrt(sum(im.^2,3));
% Calc DC - method 1
im_gray_filt = im_gray.*yellow_mask;
dc_fun = @(block_sruct) sum(block_sruct.data(:)>mean(block_sruct.data(block_sruct.data>0)))/sum(block_sruct.data(:)>0);
block_size = [100, 100];
out_dc = blockproc(im_gray_filt,block_size, dc_fun);
dc_result_raw = median(out_dc(:));
if dc_result_raw > 0.5
    dc_result = 1 - dc_result_raw;
else
    dc_result = dc_result_raw;
end
end

