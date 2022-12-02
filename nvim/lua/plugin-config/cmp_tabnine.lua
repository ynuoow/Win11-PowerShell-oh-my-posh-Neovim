local status, tabnine = pcall(require, "cmp_tabnine")
if not status then
  vim.notify("没有找到 cmp_tabnine")
  return
end
 
tabnine.setup({
	max_lines = 1000;
	max_num_results = 20;
	sort = true;
	run_on_every_keystroke = true;
	snippet_placeholder = '異';
})