local snap = require('snap')

-- REQUIRES: ripgrep and fzf in $PATH
snap.maps {
  {"<c-p>", snap.config.file {producer = "ripgrep.file", prompt = "files"}},
  {"<Leader>fb", snap.config.file {producer = "vim.buffer", prompt = "buffer"}},
  {"<Leader>fo", snap.config.file {producer = "vim.oldfile", prompt = "recent"}},
  {"<Leader>ff", snap.config.vimgrep {prompt = "grep"}},
}

