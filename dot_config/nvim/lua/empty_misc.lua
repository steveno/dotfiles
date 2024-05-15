-- Any copyright is dedicated to the Public Domain.
--
-- https://creativecommons.org/publicdomain/zero/1.0/

function file_exists(file)
  -- some error codes:
  -- 13 : EACCES - Permission denied
  -- 17 : EEXIST - File exists
  -- 20	: ENOTDIR - Not a directory
  -- 21	: EISDIR - Is a directory
  --
  local isok, errstr, errcode = os.rename(file, file)
  if isok == nil then
     if errcode == 13 then 
        -- Permission denied, but it exists
        return true
     end
     return false
  end
  return true
end

function dir_exists(path)
  return file_exists(path .. "/")
end
