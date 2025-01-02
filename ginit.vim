" On Windows, set the value ext_tabline in HKEY_CURRENT_USER\Software\nvim-qt\nvim-qt to false.
if exists(':GuiTabLine')
  GuiTabLine 0
endif
