local status_ok, numb = pcall(require, "numb")
if not status_ok then
  require "notify"("Failed to load numb", "error")
  return
end

numb.setup {}