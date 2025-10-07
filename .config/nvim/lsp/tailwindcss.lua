---@brief
--- https://github.com/tailwindlabs/tailwindcss-intellisense
---
--- Tailwind CSS Language Server can be installed via npm:
---   npm install -g @tailwindcss/language-server

-- Tiny inlined helpers that mirror the bits we used from lspconfig.util
local U = {}

-- For zipfile:/tarfile: virtual paths, return the archive path; else unchanged.
function U.strip_archive_subpath(path)
  path = vim.fn.substitute(path, 'zipfile://\\(.\\{-}\\)::[^\\\\].*$', '\\1', '')
  path = vim.fn.substitute(path, 'tarfile:\\(.\\{-}\\)::.*$', '\\1', '')
  return path
end

--- Append names from new_names to root_files if any ancestor file contains `field` (line-match).
--- Mirrors util.root_markers_with_field (breadth-ish via vim.fs.find upsearch).
---@param root_files string[]
---@param new_names string[]
---@param field string
---@param fname string
function U.root_markers_with_field(root_files, new_names, field, fname)
  local path = vim.fn.fnamemodify(fname, ':h')
  local found = vim.fs.find(new_names, { path = path, upward = true })
  for _, f in ipairs(found or {}) do
    for line in io.lines(f) do
      if line:find(field) then
        root_files[#root_files + 1] = vim.fs.basename(f)
        break
      end
    end
  end
  return root_files
end

--- Convenience wrapper like util.insert_package_json
function U.insert_package_json(root_files, field, fname)
  return U.root_markers_with_field(root_files, { 'package.json', 'package.json5' }, field, fname)
end

---@type vim.lsp.Config
return {
  cmd = { 'tailwindcss-language-server', '--stdio' },

  -- filetypes copied and adjusted from tailwindcss-intellisense
  filetypes = {
    -- html
    'aspnetcorerazor','astro','astro-markdown','blade','clojure','django-html','htmldjango','edge',
    'eelixir','elixir','ejs','erb','eruby','gohtml','gohtmltmpl','haml','handlebars','hbs','html',
    'htmlangular','html-eex','heex','jade','leaf','liquid','markdown','mdx','mustache','njk',
    'nunjucks','php','razor','slim','twig',
    -- css
    'css','less','postcss','sass','scss','stylus','sugarss',
    -- js
    'javascript','javascriptreact','reason','rescript','typescript','typescriptreact',
    -- mixed
    'vue','svelte','templ',
  },

  settings = {
    tailwindCSS = {
      validate = true,
      lint = {
        cssConflict = 'warning',
        invalidApply = 'error',
        invalidScreen = 'error',
        invalidVariant = 'error',
        invalidConfigPath = 'error',
        invalidTailwindDirective = 'error',
        recommendedVariantOrder = 'warning',
      },
      classAttributes = { 'class','className','class:list','classList','ngClass' },
      includeLanguages = {
        eelixir = 'html-eex',
        elixir  = 'phoenix-heex',
        eruby   = 'erb',
        heex    = 'phoenix-heex',
        htmlangular = 'html',
        templ = 'html',
      },
    },
  },

  before_init = function(_, config)
    config.settings = config.settings or {}
    config.settings.editor = config.settings.editor or {}
    if not config.settings.editor.tabSize then
      config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
    end
  end,

  workspace_required = true,

  -- Util-free root resolver that mirrors the original behavior
  root_dir = function(bufnr, on_dir)
    local uv = vim.uv or vim.loop

    local function exists(p) return (uv.fs_stat(p) ~= nil) end
    local function join(a, b) return (a:sub(-1) == '/' and (a .. b)) or (a .. '/' .. b) end
    local function read_file(p)
      local fd = uv.fs_open(p, 'r', 438); if not fd then return nil end
      local st = uv.fs_fstat(fd); if not st then uv.fs_close(fd); return nil end
      local data = uv.fs_read(fd, st.size, 0); uv.fs_close(fd); return data
    end

    local fname = U.strip_archive_subpath(vim.api.nvim_buf_get_name(bufnr))
    local start_dir = vim.fs.dirname(fname)

    -- Start with the same root markers as your original config
    local markers = {
      -- Generic
      'tailwind.config.js','tailwind.config.cjs','tailwind.config.mjs','tailwind.config.ts',
      'postcss.config.js','postcss.config.cjs','postcss.config.mjs','postcss.config.ts',
      -- Django
      'theme/static_src/tailwind.config.js',
      'theme/static_src/tailwind.config.cjs',
      'theme/static_src/tailwind.config.mjs',
      'theme/static_src/tailwind.config.ts',
      'theme/static_src/postcss.config.js',
      -- Fallback (v4)
      '.git',
    }

    -- Mirror util.insert_package_json + util.root_markers_with_field behavior
    markers = U.insert_package_json(markers, 'tailwindcss', fname)
    markers = U.root_markers_with_field(markers, { 'mix.lock', 'Gemfile.lock' }, 'tailwind', fname)

    -- Walk upward and pick the first dir that has any marker
    local function dir_has_marker(dir)
      for _, m in ipairs(markers) do
        -- allow nested markers like theme/static_src/...
        if m:find('/') then
          if exists(join(dir, m)) then return true end
        else
          if exists(join(dir, m)) then return true end
        end
      end
      return false
    end

    local dir = start_dir
    while dir and dir ~= '' do
      if dir_has_marker(dir) then
        on_dir(dir)
        return
      end
      -- package.json5/package.json scan fallback (string match, like util)
      for _, pj in ipairs({ 'package.json', 'package.json5' }) do
        local p = join(dir, pj)
        if exists(p) then
          local s = read_file(p) or ''
          if s:match('tailwindcss') then
            on_dir(dir)
            return
          end
        end
      end

      local parent = vim.fs.dirname(dir)
      if not parent or parent == dir then break end
      dir = parent
    end

    -- Last resort: buffer directory
    on_dir(start_dir)
  end,
}
