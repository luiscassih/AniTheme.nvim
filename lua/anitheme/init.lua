local _local_1_ = require("anitheme.utils")
local blend_hex = _local_1_["blend-hex"]
if vim.g.colors_name then
  vim.cmd.hi("clear")
end
vim.g["colors_name"] = "anitheme"
vim.o["termguicolors"] = true

-- Base colors for blending
local base00 = "#080808"
local base06 = "#ffffff"
local base09 = "#78a9ff"

-- Color scheme definitions
local color_schemes = {
  ["default"] = {
    dark = {
      base00 = base00,
      base01 = blend_hex(base00, base06, 0.085),
      base02 = blend_hex(base00, base06, 0.18),
      base03 = blend_hex(base00, base06, 0.3),
      base04 = blend_hex(base00, base06, 0.90),
      base05 = blend_hex(base00, base06, 0.95),
      base06 = base06,
      base07 = "#08bdba",
      base08 = "#3ddbd9",
      base09 = base09,
      base10 = "#ee5396",
      base11 = "#33b1ff",
      base12 = "#ff7eb6",
      base13 = "#42be65",
      base14 = "#be95ff",
      base15 = "#82cfff",
      blend = "#131313",
      none = "NONE"
    },
    light = {
      base00 = base06,
      base01 = blend_hex(base00, base06, 0.95),
      base02 = blend_hex(base00, base06, 0.82),
      base03 = base00,
      base04 = "#37474F",
      base05 = "#90A4AE",
      base06 = "#525252",
      base07 = "#08bdba",
      base08 = "#ff7eb6",
      base09 = "#ee5396",
      base10 = "#FF6F00",
      base11 = "#0f62fe",
      base12 = "#673AB7",
      base13 = "#42be65",
      base14 = "#be95ff",
      base15 = "#FFAB91",
      blend = "#FAFAFA",
      none = "NONE"
    }
  },
  ["ariake"] = {
    dark = {
      base00 = "#080808", -- background (as set by user)
      base01 = "#222530", -- line highlight / ui elements
      base02 = "#2D303A", -- selection background / visual selection
      base03 = "#313343", -- popup background / darker elements
      base04 = "#B9BED5", -- variables / identifiers
      base05 = "#B9BED5", -- default foreground
      base06 = "#F8F8F0", -- bright foreground / cursor
      base07 = "#9AEFEA", -- special elements / macros
      base08 = "#7E7EDD", -- functions / method calls
      base09 = "#7E7EDD", -- keywords / control flow
      base10 = "#A571F4", -- numbers / values
      base11 = "#7E7EDD", -- special methods / preprocessor
      base12 = "#555C77", -- comments / documentation
      base13 = "#A571F4", -- types / class names
      base14 = "#9AEFEA", -- strings / content
      base15 = "#B9BED5", -- delimiters / punctuation
      blend = "#222530",  -- blend color for UI
      none = "NONE"
    }
  }
}

-- Get the current color scheme based on background
local function get_current_colors()
  local scheme_name = vim.g.anitheme_colorscheme or "default"
  vim.notify("Using color scheme '" .. scheme_name .. "'")
  local background = vim.o.background or "dark"
  local scheme = color_schemes[scheme_name]
  
  if not scheme then
    vim.notify("Color scheme '" .. scheme_name .. "' not found, falling back to default", vim.log.levels.WARN)
    scheme = color_schemes["default"]
  end
  
  if background == "light" and not scheme.light then
    vim.notify("Light variant for '" .. scheme_name .. "' not available, using dark variant", vim.log.levels.WARN)
    return scheme.dark
  end
  
  return scheme[background]
end

local anitheme = get_current_colors()

vim.g["terminal_color_0"] = anitheme.base01
vim.g["terminal_color_1"] = anitheme.base11
vim.g["terminal_color_2"] = anitheme.base14
vim.g["terminal_color_3"] = anitheme.base13
vim.g["terminal_color_4"] = anitheme.base09
vim.g["terminal_color_5"] = anitheme.base15
vim.g["terminal_color_6"] = anitheme.base08
vim.g["terminal_color_7"] = anitheme.base05
vim.g["terminal_color_8"] = anitheme.base03
vim.g["terminal_color_9"] = anitheme.base11
vim.g["terminal_color_10"] = anitheme.base14
vim.g["terminal_color_11"] = anitheme.base13
vim.g["terminal_color_12"] = anitheme.base09
vim.g["terminal_color_13"] = anitheme.base15
vim.g["terminal_color_14"] = anitheme.base07
vim.g["terminal_color_15"] = anitheme.base06
vim.api.nvim_set_hl(0, "ColorColumn", {fg = anitheme.none, bg = anitheme.base01})
vim.api.nvim_set_hl(0, "Cursor", {fg = anitheme.base00, bg = anitheme.base04})
vim.api.nvim_set_hl(0, "CursorLine", {fg = anitheme.none, bg = anitheme.base01})
vim.api.nvim_set_hl(0, "CursorColumn", {fg = anitheme.none, bg = anitheme.base01})
vim.api.nvim_set_hl(0, "CursorLineNr", {fg = anitheme.base04, bg = anitheme.none})
vim.api.nvim_set_hl(0, "QuickFixLine", {fg = anitheme.none, bg = anitheme.base01})
vim.api.nvim_set_hl(0, "Error", {fg = anitheme.base10, bg = anitheme.base01})
vim.api.nvim_set_hl(0, "LineNr", {fg = anitheme.base03, bg = anitheme.base00})
vim.api.nvim_set_hl(0, "NonText", {fg = anitheme.base02, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Normal", {fg = anitheme.base04, bg = anitheme.base00})
vim.api.nvim_set_hl(0, "Pmenu", {fg = anitheme.base04, bg = anitheme.base01})
vim.api.nvim_set_hl(0, "PmenuSbar", {fg = anitheme.base04, bg = anitheme.base01})
vim.api.nvim_set_hl(0, "PmenuSel", {fg = anitheme.base08, bg = anitheme.base02})
vim.api.nvim_set_hl(0, "PmenuThumb", {fg = anitheme.base08, bg = anitheme.base02})
vim.api.nvim_set_hl(0, "SpecialKey", {fg = anitheme.base03, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Visual", {fg = anitheme.none, bg = anitheme.base02})
vim.api.nvim_set_hl(0, "VisualNOS", {fg = anitheme.none, bg = anitheme.base02})
vim.api.nvim_set_hl(0, "TooLong", {fg = anitheme.none, bg = anitheme.base02})
vim.api.nvim_set_hl(0, "Debug", {fg = anitheme.base13, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Macro", {fg = anitheme.base07, bg = anitheme.none})
vim.api.nvim_set_hl(0, "MatchParen", {fg = anitheme.none, bg = anitheme.base02, underline = true})
vim.api.nvim_set_hl(0, "Bold", {fg = anitheme.none, bg = anitheme.none, bold = true})
vim.api.nvim_set_hl(0, "Italic", {fg = anitheme.none, bg = anitheme.none, italic = true})
vim.api.nvim_set_hl(0, "Underlined", {fg = anitheme.none, bg = anitheme.none, underline = true})
vim.api.nvim_set_hl(0, "DiagnosticWarn", {fg = anitheme.base14, bg = anitheme.none})
vim.api.nvim_set_hl(0, "DiagnosticError", {fg = anitheme.base10, bg = anitheme.none})
vim.api.nvim_set_hl(0, "DiagnosticInfo", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "DiagnosticHint", {fg = anitheme.base04, bg = anitheme.none})
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {fg = anitheme.base14, bg = anitheme.none, undercurl = true})
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {fg = anitheme.base10, bg = anitheme.none, undercurl = true})
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {fg = anitheme.base04, bg = anitheme.none, undercurl = true})
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {fg = anitheme.base04, bg = anitheme.none, undercurl = true})
vim.api.nvim_set_hl(0, "HealthError", {fg = anitheme.base10, bg = anitheme.none})
vim.api.nvim_set_hl(0, "HealthWarning", {fg = anitheme.base14, bg = anitheme.none})
vim.api.nvim_set_hl(0, "HealthSuccess", {fg = anitheme.base13, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@comment", {link = "Comment"})
vim.api.nvim_set_hl(0, "@text.literal.commodity", {fg = anitheme.base13, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@number", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@number.date", {fg = anitheme.base08, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@number.date.effective", {fg = anitheme.base13, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@number.interval", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@number.status", {fg = anitheme.base12, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@number.quantity", {fg = anitheme.base11, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@number.quantity.negative", {fg = anitheme.base10, bg = anitheme.none})
vim.api.nvim_set_hl(0, "LspCodeLens", {fg = anitheme.none, bg = anitheme.base03})
vim.api.nvim_set_hl(0, "LspReferenceText", {fg = anitheme.none, bg = anitheme.base03})
vim.api.nvim_set_hl(0, "LspReferenceread", {fg = anitheme.none, bg = anitheme.base03})
vim.api.nvim_set_hl(0, "LspReferenceWrite", {fg = anitheme.none, bg = anitheme.base03})
vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", {fg = anitheme.base08, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@lsp.type.class", {link = "Structure"})
vim.api.nvim_set_hl(0, "@lsp.type.decorator", {link = "Decorator"})
vim.api.nvim_set_hl(0, "@lsp.type.function", {link = "@function"})
vim.api.nvim_set_hl(0, "@lsp.type.macro", {link = "Macro"})
vim.api.nvim_set_hl(0, "@lsp.type.method", {link = "@function"})
vim.api.nvim_set_hl(0, "@lsp.type.struct", {link = "Structure"})
vim.api.nvim_set_hl(0, "@lsp.type.type", {link = "Type"})
vim.api.nvim_set_hl(0, "@lsp.type.typeParameter", {link = "Typedef"})
vim.api.nvim_set_hl(0, "@lsp.type.selfParameter", {link = "@variable.builtin"})
vim.api.nvim_set_hl(0, "@lsp.type.builtinConstant", {link = "@constant.builtin"})
vim.api.nvim_set_hl(0, "@lsp.type.magicFunction", {link = "@function.builtin"})
vim.api.nvim_set_hl(0, "@lsp.type.boolean", {link = "@boolean"})
vim.api.nvim_set_hl(0, "@lsp.type.builtinType", {link = "@type.builtin"})
vim.api.nvim_set_hl(0, "@lsp.type.comment", {link = "@comment"})
vim.api.nvim_set_hl(0, "@lsp.type.enum", {link = "@type"})
vim.api.nvim_set_hl(0, "@lsp.type.enumMember", {link = "@constant"})
vim.api.nvim_set_hl(0, "@lsp.type.escapeSequence", {link = "@string.escape"})
vim.api.nvim_set_hl(0, "@lsp.type.formatSpecifier", {link = "@punctuation.special"})
vim.api.nvim_set_hl(0, "@lsp.type.keyword", {link = "@keyword"})
vim.api.nvim_set_hl(0, "@lsp.type.namespace", {link = "@namespace"})
vim.api.nvim_set_hl(0, "@lsp.type.number", {link = "@number"})
vim.api.nvim_set_hl(0, "@lsp.type.operator", {link = "@operator"})
vim.api.nvim_set_hl(0, "@lsp.type.parameter", {link = "@parameter"})
vim.api.nvim_set_hl(0, "@lsp.type.property", {link = "@property"})
vim.api.nvim_set_hl(0, "@lsp.type.selfKeyword", {link = "@variable.builtin"})
vim.api.nvim_set_hl(0, "@lsp.type.string.rust", {link = "@string"})
vim.api.nvim_set_hl(0, "@lsp.type.typeAlias", {link = "@type.definition"})
vim.api.nvim_set_hl(0, "@lsp.type.unresolvedReference", {link = "Error"})
vim.api.nvim_set_hl(0, "@lsp.type.variable", {link = "@variable"})
vim.api.nvim_set_hl(0, "@lsp.mod.readonly", {link = "@constant"})
vim.api.nvim_set_hl(0, "@lsp.mod.typeHint", {link = "Type"})
vim.api.nvim_set_hl(0, "@lsp.mod.builtin", {link = "Special"})
vim.api.nvim_set_hl(0, "@lsp.typemod.class.defaultLibrary", {link = "@type.builtin"})
vim.api.nvim_set_hl(0, "@lsp.typemod.enum.defaultLibrary", {link = "@type.builtin"})
vim.api.nvim_set_hl(0, "@lsp.typemod.enumMember.defaultLibrary", {link = "@constant.builtin"})
vim.api.nvim_set_hl(0, "@lsp.typemod.function.defaultLibrary", {link = "@function.builtin"})
vim.api.nvim_set_hl(0, "@lsp.typemod.keyword.async", {link = "@keyword.coroutine"})
vim.api.nvim_set_hl(0, "@lsp.typemod.macro.defaultLibrary", {link = "@function.builtin"})
vim.api.nvim_set_hl(0, "@lsp.typemod.method.defaultLibrary", {link = "@function.builtin"})
vim.api.nvim_set_hl(0, "@lsp.typemod.operator.injected", {link = "@operator"})
vim.api.nvim_set_hl(0, "@lsp.typemod.string.injected", {link = "@string"})
vim.api.nvim_set_hl(0, "@lsp.typemod.operator.controlFlow", {link = "@exception"})
vim.api.nvim_set_hl(0, "@lsp.typemod.keyword.documentation", {link = "Special"})
vim.api.nvim_set_hl(0, "@lsp.typemod.variable.global", {link = "@constant"})
vim.api.nvim_set_hl(0, "@lsp.typemod.variable.static", {link = "@constant"})
vim.api.nvim_set_hl(0, "@lsp.typemod.variable.defaultLibrary", {link = "Special"})
vim.api.nvim_set_hl(0, "@lsp.typemod.function.builtin", {link = "@function.builtin"})
vim.api.nvim_set_hl(0, "@lsp.typemod.function.readonly", {link = "@method"})
vim.api.nvim_set_hl(0, "@lsp.typemod.variable.defaultLibrary", {link = "@variable.builtin"})
vim.api.nvim_set_hl(0, "@lsp.typemod.variable.injected", {link = "@variable"})
vim.api.nvim_set_hl(0, "Folded", {fg = anitheme.base02, bg = anitheme.base01})
vim.api.nvim_set_hl(0, "FoldColumn", {fg = anitheme.base01, bg = anitheme.base00})
vim.api.nvim_set_hl(0, "SignColumn", {fg = anitheme.base01, bg = anitheme.base00})
vim.api.nvim_set_hl(0, "Directory", {fg = anitheme.base08, bg = anitheme.none})
vim.api.nvim_set_hl(0, "EndOfBuffer", {fg = anitheme.base01, bg = anitheme.none})
vim.api.nvim_set_hl(0, "ErrorMsg", {fg = anitheme.base10, bg = anitheme.none})
vim.api.nvim_set_hl(0, "ModeMsg", {fg = anitheme.base04, bg = anitheme.none})
vim.api.nvim_set_hl(0, "MoreMsg", {fg = anitheme.base08, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Question", {fg = anitheme.base04, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Substitute", {fg = anitheme.base01, bg = anitheme.base08})
vim.api.nvim_set_hl(0, "WarningMsg", {fg = anitheme.base14, bg = anitheme.none})
vim.api.nvim_set_hl(0, "WildMenu", {fg = anitheme.base08, bg = anitheme.base01})
vim.api.nvim_set_hl(0, "helpHyperTextJump", {fg = anitheme.base08, bg = anitheme.none})
vim.api.nvim_set_hl(0, "helpSpecial", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "helpHeadline", {fg = anitheme.base10, bg = anitheme.none})
vim.api.nvim_set_hl(0, "helpHeader", {fg = anitheme.base15, bg = anitheme.none})
vim.api.nvim_set_hl(0, "DiffAdded", {fg = anitheme.base07, bg = anitheme.none})
vim.api.nvim_set_hl(0, "DiffChanged", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "DiffRemoved", {fg = anitheme.base10, bg = anitheme.none})
vim.api.nvim_set_hl(0, "DiffAdd", {bg = "#122f2f", fg = anitheme.none})
vim.api.nvim_set_hl(0, "DiffChange", {bg = "#222a39", fg = anitheme.none})
vim.api.nvim_set_hl(0, "DiffText", {bg = "#2f3f5c", fg = anitheme.none})
vim.api.nvim_set_hl(0, "DiffDelete", {bg = "#361c28", fg = anitheme.none})
vim.api.nvim_set_hl(0, "IncSearch", {fg = anitheme.base06, bg = anitheme.base10})
vim.api.nvim_set_hl(0, "Search", {fg = anitheme.base01, bg = anitheme.base08})
vim.api.nvim_set_hl(0, "TabLine", {link = "StatusLineNC"})
vim.api.nvim_set_hl(0, "TabLineFill", {link = "TabLine"})
vim.api.nvim_set_hl(0, "TabLineSel", {link = "StatusLine"})
vim.api.nvim_set_hl(0, "Title", {fg = anitheme.base04, bg = anitheme.none})
vim.api.nvim_set_hl(0, "VertSplit", {fg = anitheme.base01, bg = anitheme.base00})
vim.api.nvim_set_hl(0, "WinSeparator", {fg = anitheme.base01, bg = anitheme.base00})
vim.api.nvim_set_hl(0, "Boolean", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Character", {fg = anitheme.base14, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Comment", {fg = anitheme.base03, bg = anitheme.none, italic = true})
vim.api.nvim_set_hl(0, "Conceal", {fg = anitheme.none, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Conditional", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Constant", {fg = anitheme.base04, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Decorator", {fg = anitheme.base12, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Define", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Delimeter", {fg = anitheme.base06, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Exception", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Float", {link = "Number"})
vim.api.nvim_set_hl(0, "Function", {fg = anitheme.base08, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Identifier", {fg = anitheme.base04, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Include", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Keyword", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Label", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Number", {fg = anitheme.base15, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Operator", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "PreProc", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Repeat", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Special", {fg = anitheme.base04, bg = anitheme.none})
vim.api.nvim_set_hl(0, "SpecialChar", {fg = anitheme.base04, bg = anitheme.none})
vim.api.nvim_set_hl(0, "SpecialComment", {fg = anitheme.base08, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Statement", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "StorageClass", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "String", {fg = anitheme.base14, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Structure", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Tag", {fg = anitheme.base04, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Todo", {fg = anitheme.base13, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Type", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "Typedef", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "markdownBlockquote", {fg = anitheme.base08, bg = anitheme.none})
vim.api.nvim_set_hl(0, "markdownBold", {link = "Bold"})
vim.api.nvim_set_hl(0, "markdownItalic", {link = "Italic"})
vim.api.nvim_set_hl(0, "markdownBoldItalic", {fg = anitheme.none, bg = anitheme.none, bold = true, italic = true})
vim.api.nvim_set_hl(0, "markdownRule", {link = "Comment"})
vim.api.nvim_set_hl(0, "markdownH1", {fg = anitheme.base10, bg = anitheme.none})
vim.api.nvim_set_hl(0, "markdownH2", {link = "markdownH1"})
vim.api.nvim_set_hl(0, "markdownH3", {link = "markdownH1"})
vim.api.nvim_set_hl(0, "markdownH4", {link = "markdownH1"})
vim.api.nvim_set_hl(0, "markdownH5", {link = "markdownH1"})
vim.api.nvim_set_hl(0, "markdownH6", {link = "markdownH1"})
vim.api.nvim_set_hl(0, "markdownHeadingDelimiter", {link = "markdownH1"})
vim.api.nvim_set_hl(0, "markdownHeadingRule", {link = "markdownH1"})
vim.api.nvim_set_hl(0, "markdownUrl", {fg = anitheme.base14, bg = anitheme.none, underline = true})
vim.api.nvim_set_hl(0, "markdownCode", {link = "String"})
vim.api.nvim_set_hl(0, "markdownCodeBlock", {link = "markdownCode"})
vim.api.nvim_set_hl(0, "markdownCodeDelimiter", {link = "markdownCode"})
vim.api.nvim_set_hl(0, "markdownUrl", {link = "String"})
vim.api.nvim_set_hl(0, "markdownListMarker", {fg = anitheme.base08, bg = anitheme.none})
vim.api.nvim_set_hl(0, "markdownOrderedListMarker", {fg = anitheme.base08, bg = anitheme.none})
vim.api.nvim_set_hl(0, "asciidocAttributeEntry", {fg = anitheme.base15, bg = anitheme.none})
vim.api.nvim_set_hl(0, "asciidocAttributeList", {link = "asciidocAttributeEntry"})
vim.api.nvim_set_hl(0, "asciidocAttributeRef", {link = "asciidocAttributeEntry"})
vim.api.nvim_set_hl(0, "asciidocHLabel", {link = "markdownH1"})
vim.api.nvim_set_hl(0, "asciidocOneLineTitle", {link = "markdownH1"})
vim.api.nvim_set_hl(0, "asciidocQuotedMonospaced", {link = "markdownBlockquote"})
vim.api.nvim_set_hl(0, "asciidocURL", {link = "markdownUrl"})
vim.api.nvim_set_hl(0, "@comment", {link = "Comment"})
vim.api.nvim_set_hl(0, "@error", {fg = anitheme.base11, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@operator", {link = "Operator"})
vim.api.nvim_set_hl(0, "@punctuation.delimiter", {fg = anitheme.base08, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@punctuation.bracket", {fg = anitheme.base08, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@punctuation.special", {fg = anitheme.base08, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@string", {link = "String"})
vim.api.nvim_set_hl(0, "@string.regex", {fg = anitheme.base07, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@string.escape", {fg = anitheme.base15, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@character", {link = "Character"})
vim.api.nvim_set_hl(0, "@boolean", {link = "Boolean"})
vim.api.nvim_set_hl(0, "@number", {link = "Number"})
vim.api.nvim_set_hl(0, "@float", {link = "Float"})
vim.api.nvim_set_hl(0, "@function", {fg = anitheme.base12, bg = anitheme.none, bold = true})
vim.api.nvim_set_hl(0, "@function.builtin", {fg = anitheme.base12, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@function.macro", {fg = anitheme.base07, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@method", {fg = anitheme.base07, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@constructor", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@parameter", {fg = anitheme.base04, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@keyword", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@keyword.function", {fg = anitheme.base08, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@keyword.operator", {fg = anitheme.base08, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@conditional", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@repeat", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@label", {fg = anitheme.base15, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@include", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@exception", {fg = anitheme.base15, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@type", {link = "Type"})
vim.api.nvim_set_hl(0, "@type.builtin", {link = "Type"})
vim.api.nvim_set_hl(0, "@attribute", {fg = anitheme.base15, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@field", {fg = anitheme.base04, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@property", {fg = anitheme.base10, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@variable", {fg = anitheme.base04, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@variable.builtin", {fg = anitheme.base04, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@constant", {fg = anitheme.base14, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@constant.builtin", {fg = anitheme.base07, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@constant.macro", {fg = anitheme.base07, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@namespace", {fg = anitheme.base07, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@symbol", {fg = anitheme.base15, bg = anitheme.none, bold = true})
vim.api.nvim_set_hl(0, "@text", {fg = anitheme.base04, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@text.strong", {fg = anitheme.none, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@text.emphasis", {fg = anitheme.base10, bg = anitheme.none, bold = true})
vim.api.nvim_set_hl(0, "@text.underline", {fg = anitheme.base10, bg = anitheme.none, underline = true})
vim.api.nvim_set_hl(0, "@text.strike", {fg = anitheme.base10, bg = anitheme.none, strikethrough = true})
vim.api.nvim_set_hl(0, "@text.title", {fg = anitheme.base10, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@text.literal", {fg = anitheme.base04, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@text.uri", {fg = anitheme.base14, bg = anitheme.none, underline = true})
vim.api.nvim_set_hl(0, "@tag", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@tag.attribute", {fg = anitheme.base15, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@tag.delimiter", {fg = anitheme.base15, bg = anitheme.none})
vim.api.nvim_set_hl(0, "@reference", {fg = anitheme.base04, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NvimInternalError", {fg = anitheme.base00, bg = anitheme.base08})
vim.api.nvim_set_hl(0, "NormalFloat", {fg = anitheme.base05, bg = anitheme.blend})
vim.api.nvim_set_hl(0, "FloatBorder", {fg = anitheme.blend, bg = anitheme.blend})
vim.api.nvim_set_hl(0, "NormalNC", {fg = anitheme.base05, bg = anitheme.base00})
vim.api.nvim_set_hl(0, "TermCursor", {fg = anitheme.base00, bg = anitheme.base04})
vim.api.nvim_set_hl(0, "TermCursorNC", {fg = anitheme.base00, bg = anitheme.base04})
vim.api.nvim_set_hl(0, "StatusLine", {fg = anitheme.base04, bg = anitheme.base00})
vim.api.nvim_set_hl(0, "StatusLineNC", {fg = anitheme.base04, bg = anitheme.base01})
vim.api.nvim_set_hl(0, "StatusReplace", {fg = anitheme.base00, bg = anitheme.base08})
vim.api.nvim_set_hl(0, "StatusInsert", {fg = anitheme.base00, bg = anitheme.base12})
vim.api.nvim_set_hl(0, "StatusVisual", {fg = anitheme.base00, bg = anitheme.base14})
vim.api.nvim_set_hl(0, "StatusTerminal", {fg = anitheme.base00, bg = anitheme.base11})
vim.api.nvim_set_hl(0, "StatusNormal", {fg = anitheme.base00, bg = anitheme.base15})
vim.api.nvim_set_hl(0, "StatusCommand", {fg = anitheme.base00, bg = anitheme.base13})
vim.api.nvim_set_hl(0, "StatusLineDiagnosticWarn", {fg = anitheme.base14, bg = anitheme.base00, bold = true})
vim.api.nvim_set_hl(0, "StatusLineDiagnosticError", {fg = anitheme.base10, bg = anitheme.base00, bold = true})
vim.api.nvim_set_hl(0, "TelescopeBorder", {fg = anitheme.blend, bg = anitheme.blend})
vim.api.nvim_set_hl(0, "TelescopePromptBorder", {fg = anitheme.base02, bg = anitheme.base02})
vim.api.nvim_set_hl(0, "TelescopePromptNormal", {fg = anitheme.base05, bg = anitheme.base02})
vim.api.nvim_set_hl(0, "TelescopePromptPrefix", {fg = anitheme.base08, bg = anitheme.base02})
vim.api.nvim_set_hl(0, "TelescopeNormal", {fg = anitheme.none, bg = anitheme.blend})
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", {fg = anitheme.base02, bg = anitheme.base12})
vim.api.nvim_set_hl(0, "TelescopePromptTitle", {fg = anitheme.base02, bg = anitheme.base11})
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", {fg = anitheme.blend, bg = anitheme.blend})
vim.api.nvim_set_hl(0, "TelescopeSelection", {fg = anitheme.none, bg = anitheme.base02})
vim.api.nvim_set_hl(0, "TelescopePreviewLine", {fg = anitheme.none, bg = anitheme.base01})
vim.api.nvim_set_hl(0, "TelescopeMatching", {fg = anitheme.base08, bg = anitheme.none, bold = true, italic = true})
vim.api.nvim_set_hl(0, "NotifyERRORBorder", {fg = anitheme.base08, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NotifyWARNBorder", {fg = anitheme.base14, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NotifyINFOBorder", {fg = anitheme.base05, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", {fg = anitheme.base13, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NotifyTRACEBorder", {fg = anitheme.base13, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NotifyERRORIcon", {fg = anitheme.base08, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NotifyWARNIcon", {fg = anitheme.base14, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NotifyINFOIcon", {fg = anitheme.base05, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", {fg = anitheme.base13, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NotifyTRACEIcon", {fg = anitheme.base13, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NotifyERRORTitle", {fg = anitheme.base08, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NotifyWARNTitle", {fg = anitheme.base14, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NotifyINFOTitle", {fg = anitheme.base05, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", {fg = anitheme.base13, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NotifyTRACETitle", {fg = anitheme.base13, bg = anitheme.none})
vim.api.nvim_set_hl(0, "CmpItemAbbr", {fg = "#adadad", bg = anitheme.none})
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", {fg = anitheme.base05, bg = anitheme.none, bold = true})
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", {fg = anitheme.base04, bg = anitheme.none, bold = true})
vim.api.nvim_set_hl(0, "CmpItemMenu", {fg = anitheme.base04, bg = anitheme.none, italic = true})
vim.api.nvim_set_hl(0, "CmpItemKindInterface", {fg = anitheme.base01, bg = anitheme.base08})
vim.api.nvim_set_hl(0, "CmpItemKindColor", {fg = anitheme.base01, bg = anitheme.base08})
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", {fg = anitheme.base01, bg = anitheme.base08})
vim.api.nvim_set_hl(0, "CmpItemKindText", {fg = anitheme.base01, bg = anitheme.base09})
vim.api.nvim_set_hl(0, "CmpItemKindEnum", {fg = anitheme.base01, bg = anitheme.base09})
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", {fg = anitheme.base01, bg = anitheme.base09})
vim.api.nvim_set_hl(0, "CmpItemKindConstant", {fg = anitheme.base01, bg = anitheme.base10})
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", {fg = anitheme.base01, bg = anitheme.base10})
vim.api.nvim_set_hl(0, "CmpItemKindReference", {fg = anitheme.base01, bg = anitheme.base10})
vim.api.nvim_set_hl(0, "CmpItemKindFunction", {fg = anitheme.base01, bg = anitheme.base11})
vim.api.nvim_set_hl(0, "CmpItemKindStruct", {fg = anitheme.base01, bg = anitheme.base11})
vim.api.nvim_set_hl(0, "CmpItemKindClass", {fg = anitheme.base01, bg = anitheme.base11})
vim.api.nvim_set_hl(0, "CmpItemKindModule", {fg = anitheme.base01, bg = anitheme.base11})
vim.api.nvim_set_hl(0, "CmpItemKindOperator", {fg = anitheme.base01, bg = anitheme.base11})
vim.api.nvim_set_hl(0, "CmpItemKindField", {fg = anitheme.base01, bg = anitheme.base12})
vim.api.nvim_set_hl(0, "CmpItemKindProperty", {fg = anitheme.base01, bg = anitheme.base12})
vim.api.nvim_set_hl(0, "CmpItemKindEvent", {fg = anitheme.base01, bg = anitheme.base12})
vim.api.nvim_set_hl(0, "CmpItemKindUnit", {fg = anitheme.base01, bg = anitheme.base13})
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", {fg = anitheme.base01, bg = anitheme.base13})
vim.api.nvim_set_hl(0, "CmpItemKindFolder", {fg = anitheme.base01, bg = anitheme.base13})
vim.api.nvim_set_hl(0, "CmpItemKindVariable", {fg = anitheme.base01, bg = anitheme.base14})
vim.api.nvim_set_hl(0, "CmpItemKindFile", {fg = anitheme.base01, bg = anitheme.base14})
vim.api.nvim_set_hl(0, "CmpItemKindMethod", {fg = anitheme.base01, bg = anitheme.base15})
vim.api.nvim_set_hl(0, "CmpItemKindValue", {fg = anitheme.base01, bg = anitheme.base15})
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", {fg = anitheme.base01, bg = anitheme.base15})
vim.api.nvim_set_hl(0, "NvimTreeImageFile", {fg = anitheme.base12, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", {fg = anitheme.base12, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", {fg = anitheme.base00, bg = anitheme.base00})
vim.api.nvim_set_hl(0, "NvimTreeFolderName", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", {fg = anitheme.base02, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", {fg = anitheme.base15, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", {fg = anitheme.base15, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NvimTreeNormal", {fg = anitheme.base04, bg = anitheme.base00})
vim.api.nvim_set_hl(0, "NeogitBranch", {fg = anitheme.base10, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NeogitRemote", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "NeogitHunkHeader", {fg = anitheme.base04, bg = anitheme.base02})
vim.api.nvim_set_hl(0, "NeogitHunkHeaderHighlight", {fg = anitheme.base04, bg = anitheme.base03})
vim.api.nvim_set_hl(0, "HydraRed", {fg = anitheme.base12, bg = anitheme.none})
vim.api.nvim_set_hl(0, "HydraBlue", {fg = anitheme.base09, bg = anitheme.none})
vim.api.nvim_set_hl(0, "HydraAmaranth", {fg = anitheme.base10, bg = anitheme.none})
vim.api.nvim_set_hl(0, "HydraTeal", {fg = anitheme.base08, bg = anitheme.none})
vim.api.nvim_set_hl(0, "HydraHint", {fg = anitheme.none, bg = anitheme.blend})
vim.api.nvim_set_hl(0, "alpha1", {fg = anitheme.base03, bg = anitheme.none})
vim.api.nvim_set_hl(0, "alpha2", {fg = anitheme.base04, bg = anitheme.none})
vim.api.nvim_set_hl(0, "alpha3", {fg = anitheme.base03, bg = anitheme.none})
vim.api.nvim_set_hl(0, "CodeBlock", {fg = anitheme.none, bg = anitheme.base01})
vim.api.nvim_set_hl(0, "BufferLineDiagnostic", {fg = anitheme.base10, bg = anitheme.none, bold = true})
vim.api.nvim_set_hl(0, "BufferLineDiagnosticVisible", {fg = anitheme.base10, bg = anitheme.none, bold = true})
vim.api.nvim_set_hl(0, "OilDir", {fg = anitheme.base11, bg = anitheme.none, bold = true})
vim.api.nvim_set_hl(0, "htmlH1", {link = "markdownH1"})
vim.api.nvim_set_hl(0, "mkdRule", {link = "markdownRule"})
vim.api.nvim_set_hl(0, "mkdListItem", {link = "markdownListMarker"})
vim.api.nvim_set_hl(0, "mkdListItemCheckbox", {link = "markdownListMarker"})
vim.api.nvim_set_hl(0, "VimwikiHeader1", {link = "markdownH1"})
vim.api.nvim_set_hl(0, "VimwikiHeader2", {link = "markdownH1"})
vim.api.nvim_set_hl(0, "VimwikiHeader3", {link = "markdownH1"})
vim.api.nvim_set_hl(0, "VimwikiHeader4", {link = "markdownH1"})
vim.api.nvim_set_hl(0, "VimwikiHeader5", {link = "markdownH1"})
vim.api.nvim_set_hl(0, "VimwikiHeader6", {link = "markdownH1"})
vim.api.nvim_set_hl(0, "VimwikiHeaderChar", {link = "markdownH1"})
vim.api.nvim_set_hl(0, "VimwikiList", {link = "markdownListMarker"})
vim.api.nvim_set_hl(0, "VimwikiLink", {link = "markdownUrl"})
vim.api.nvim_set_hl(0, "VimwikiCode", {link = "markdownCode"})
return {anitheme = anitheme}
