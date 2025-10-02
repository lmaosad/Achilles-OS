local utils = {}

function utils.center(text, width)
  local pad = math.floor((width - #text) / 2)
  return string.rep(" ", pad) .. text
end

return utils
