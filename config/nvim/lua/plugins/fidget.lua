local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
  vim.notify("Failed to load fidget", "error")
  return
end

fidget.setup {
  window = {
    blend = 0,
  },
}