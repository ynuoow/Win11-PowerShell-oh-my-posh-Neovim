local status, copilot = pcall(require, "copilot")
if not status then
  vim.notify("没有找到 copilot")
  return
end

copilot.setup({
   vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]] 
})