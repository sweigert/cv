function HorizontalRule()
  return pandoc.RawBlock('latex',
    '\\par\\noindent{\\color{rulegray}\\rule{\\linewidth}{0.6pt}}\\par')
end
