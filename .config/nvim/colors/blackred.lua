-- Black++ Red Forest port for Neovim
vim.cmd("highlight clear")
vim.g.colors_name = "blackred"
vim.o.termguicolors = true
vim.o.background = "dark"

local hi = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Core colors from Black++ Red Forest
local bg = "#000000"
local fg = "#fbfbfb"
local red = "#E60012"
local green = "#A3BE8C"
local yellow = "#EBCB8B"
local blue = "#81A1C1"
local cyan = "#88C0D0"
local teal = "#8FBCBB"
local orange = "#D08770"
local dimred = "#BF616A"
local comment = "#666666"
local gutter = "#333333"
local selection = "#2a0f0f"
local visual = "#3a1515"
local white = "#ECEFF4"
local lightgray = "#D8DEE9"

-- Editor
hi("Normal", { fg = fg, bg = bg })
hi("NormalFloat", { fg = fg, bg = "#0a0a0a" })
hi("FloatBorder", { fg = red, bg = "#0a0a0a" })
hi("Cursor", { fg = bg, bg = fg })
hi("CursorLine", { bg = "#0d0d0d" })
hi("CursorLineNr", { fg = red, bold = true })
hi("LineNr", { fg = gutter })
hi("SignColumn", { fg = gutter, bg = bg })
hi("ColorColumn", { bg = "#0d0d0d" })
hi("VertSplit", { fg = "#1a1a1a", bg = bg })
hi("WinSeparator", { fg = "#1a1a1a", bg = bg })
hi("StatusLine", { fg = fg, bg = "#0a0a0a" })
hi("StatusLineNC", { fg = comment, bg = "#0a0a0a" })
hi("TabLine", { fg = comment, bg = bg })
hi("TabLineFill", { bg = bg })
hi("TabLineSel", { fg = fg, bg = "#0a0a0a" })
hi("Pmenu", { fg = fg, bg = "#0a0a0a" })
hi("PmenuSel", { fg = fg, bg = visual })
hi("PmenuSbar", { bg = "#0a0a0a" })
hi("PmenuThumb", { bg = red })
hi("Visual", { bg = visual })
hi("VisualNOS", { bg = visual })
hi("Search", { fg = bg, bg = red })
hi("IncSearch", { fg = bg, bg = yellow })
hi("MatchParen", { fg = red, bold = true })
hi("Folded", { fg = comment, bg = "#0a0a0a" })
hi("FoldColumn", { fg = gutter, bg = bg })
hi("NonText", { fg = "#1a1a1a" })
hi("SpecialKey", { fg = "#1a1a1a" })
hi("Directory", { fg = red })
hi("Title", { fg = red, bold = true })
hi("ErrorMsg", { fg = dimred })
hi("WarningMsg", { fg = yellow })
hi("MoreMsg", { fg = green })
hi("ModeMsg", { fg = fg })
hi("Question", { fg = cyan })
hi("WildMenu", { fg = bg, bg = red })
hi("EndOfBuffer", { fg = bg })
hi("Whitespace", { fg = "#1a1a1a" })

-- Syntax
hi("Comment", { fg = comment, italic = true })
hi("Constant", { fg = blue })
hi("String", { fg = green })
hi("Character", { fg = yellow })
hi("Number", { fg = blue })
hi("Boolean", { fg = blue })
hi("Float", { fg = blue })
hi("Identifier", { fg = lightgray })
hi("Function", { fg = cyan })
hi("Statement", { fg = blue })
hi("Conditional", { fg = blue })
hi("Repeat", { fg = blue })
hi("Label", { fg = blue })
hi("Operator", { fg = blue })
hi("Keyword", { fg = blue })
hi("Exception", { fg = blue })
hi("PreProc", { fg = "#5E81AC" })
hi("Include", { fg = blue })
hi("Define", { fg = blue })
hi("Macro", { fg = blue })
hi("PreCondit", { fg = blue })
hi("Type", { fg = teal })
hi("StorageClass", { fg = blue })
hi("Structure", { fg = teal })
hi("Typedef", { fg = teal })
hi("Special", { fg = lightgray })
hi("SpecialChar", { fg = yellow })
hi("Tag", { fg = blue })
hi("Delimiter", { fg = white })
hi("SpecialComment", { fg = comment })
hi("Debug", { fg = fg })
hi("Underlined", { underline = true })
hi("Error", { fg = dimred })
hi("Todo", { fg = red, bold = true })

-- Treesitter
hi("@variable", { fg = lightgray })
hi("@variable.builtin", { fg = blue })
hi("@variable.parameter", { fg = lightgray })
hi("@variable.member", { fg = lightgray })
hi("@constant", { fg = red })
hi("@constant.builtin", { fg = blue })
hi("@module", { fg = teal })
hi("@string", { fg = green })
hi("@string.escape", { fg = yellow })
hi("@character", { fg = yellow })
hi("@number", { fg = blue })
hi("@boolean", { fg = blue })
hi("@float", { fg = blue })
hi("@function", { fg = cyan })
hi("@function.builtin", { fg = cyan })
hi("@function.call", { fg = cyan })
hi("@function.method", { fg = cyan })
hi("@constructor", { fg = teal })
hi("@keyword", { fg = blue })
hi("@keyword.function", { fg = blue })
hi("@keyword.return", { fg = blue })
hi("@keyword.operator", { fg = blue })
hi("@operator", { fg = blue })
hi("@punctuation", { fg = white })
hi("@punctuation.bracket", { fg = white })
hi("@punctuation.delimiter", { fg = white })
hi("@type", { fg = teal })
hi("@type.builtin", { fg = blue })
hi("@tag", { fg = blue })
hi("@tag.attribute", { fg = teal })
hi("@tag.delimiter", { fg = blue })
hi("@property", { fg = lightgray })
hi("@comment", { fg = comment, italic = true })
hi("@decorator", { fg = orange })

-- Diagnostics
hi("DiagnosticError", { fg = dimred })
hi("DiagnosticWarn", { fg = yellow })
hi("DiagnosticInfo", { fg = cyan })
hi("DiagnosticHint", { fg = teal })
hi("DiagnosticUnderlineError", { undercurl = true, sp = dimred })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = yellow })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = cyan })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = teal })

-- Git signs
hi("GitSignsAdd", { fg = green })
hi("GitSignsChange", { fg = yellow })
hi("GitSignsDelete", { fg = dimred })
hi("DiffAdd", { bg = "#0a1a0a" })
hi("DiffChange", { bg = "#1a1a0a" })
hi("DiffDelete", { bg = "#1a0a0a" })
hi("DiffText", { bg = "#2a2a0a" })

-- Telescope
hi("TelescopeNormal", { fg = fg, bg = bg })
hi("TelescopeBorder", { fg = red, bg = bg })
hi("TelescopePromptBorder", { fg = red, bg = bg })
hi("TelescopeResultsBorder", { fg = red, bg = bg })
hi("TelescopePreviewBorder", { fg = red, bg = bg })
hi("TelescopePromptTitle", { fg = bg, bg = red })
hi("TelescopeResultsTitle", { fg = red })
hi("TelescopePreviewTitle", { fg = bg, bg = red })
hi("TelescopeSelection", { bg = visual })
hi("TelescopeMatching", { fg = red, bold = true })

-- Neo-tree / file explorer
hi("NeoTreeNormal", { fg = fg, bg = bg })
hi("NeoTreeNormalNC", { fg = fg, bg = bg })
hi("NeoTreeDirectoryName", { fg = fg })
hi("NeoTreeDirectoryIcon", { fg = red })
hi("NeoTreeRootName", { fg = red, bold = true })
hi("NeoTreeFileName", { fg = fg })
hi("NeoTreeGitModified", { fg = yellow })
hi("NeoTreeGitAdded", { fg = green })
hi("NeoTreeGitDeleted", { fg = dimred })
hi("NeoTreeGitUntracked", { fg = orange })
hi("NeoTreeIndentMarker", { fg = "#1a1a1a" })

-- Which-key
hi("WhichKey", { fg = red })
hi("WhichKeyGroup", { fg = cyan })
hi("WhichKeySeparator", { fg = comment })
hi("WhichKeyDesc", { fg = fg })

-- Notify
hi("NotifyERRORBorder", { fg = dimred })
hi("NotifyWARNBorder", { fg = yellow })
hi("NotifyINFOBorder", { fg = cyan })
hi("NotifyERRORTitle", { fg = dimred })
hi("NotifyWARNTitle", { fg = yellow })
hi("NotifyINFOTitle", { fg = cyan })
hi("NotifyERRORIcon", { fg = dimred })
hi("NotifyWARNIcon", { fg = yellow })
hi("NotifyINFOIcon", { fg = cyan })

-- Bufferline / tabs
hi("BufferLineBackground", { fg = comment, bg = bg })
hi("BufferLineFill", { bg = bg })
hi("BufferLineBufferSelected", { fg = fg, bg = bg, bold = true })
hi("BufferLineIndicatorSelected", { fg = red, bg = bg })

-- Indent guides
hi("IndentBlanklineChar", { fg = "#1a1a1a" })
hi("IblIndent", { fg = "#1a1a1a" })
hi("IblScope", { fg = red })

-- Lazy plugin manager
hi("LazyButton", { fg = fg, bg = "#0a0a0a" })
hi("LazyButtonActive", { fg = bg, bg = red })
hi("LazyH1", { fg = bg, bg = red, bold = true })
hi("LazySpecial", { fg = red })

-- Mini (statusline etc)
hi("MiniStatuslineFilename", { fg = fg, bg = "#0a0a0a" })
hi("MiniStatuslineDevinfo", { fg = fg, bg = "#1a1a1a" })
hi("MiniStatuslineModeNormal", { fg = bg, bg = red, bold = true })
hi("MiniStatuslineModeInsert", { fg = bg, bg = green, bold = true })
hi("MiniStatuslineModeVisual", { fg = bg, bg = yellow, bold = true })
hi("MiniStatuslineModeCommand", { fg = bg, bg = cyan, bold = true })
hi("MiniStatuslineModeReplace", { fg = bg, bg = orange, bold = true })
