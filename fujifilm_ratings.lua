-- fujifilm_ratings-0.1
-- Apply Fujifilm in-camera ratings during import

-- Author: Ben Mendis (ben.mendis@gmail.com)
-- License: GPLv2

darktable = require "darktable"

local function detect_rating(event, image)
	local RAF_filename = tostring(image)
	local JPEG_filename = string.gsub(RAF_filename, "%.RAF$", ".JPG")
	local command = "exiftool -Rating " .. JPEG_filename
	darktable.print_error(command)
	local output = io.popen(command)
	local jpeg_result = output:read("*all")
	output:close()
	if string.len(jpeg_result) > 0 then
		jpeg_result = string.gsub(jpeg_result, "^Rating.*(%d)", "%1")
		image.rating = tonumber(jpeg_result)
		darktable.print_error("Using JPEG Rating: " .. tostring(jpeg_result))
		return
	end
	command = "exiftool -Rating " .. RAF_filename
	darktable.print_error(command)
	output = io.popen(command)
	local raf_result = output:read("*all")
	output:close()
	if string.len(raf_result) > 0 then
		raf_result = string.gsub(raf_result, "^Rating.*(%d)", "%1")
		image.rating = tonumber(raf_result)
		darktable.print_error("Using RAF Rating: " .. tostring(raf_result))
	end
end

darktable.register_event("post-import-image", detect_rating)

darktable.print_error("fujifilm_ratings loaded.")
