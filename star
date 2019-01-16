#!/usr/bin/env ruby

line = `star -1d | dmenu-dropdown`
if (line.length > 0)
  script = `#{__dir__}/list-scripts`
  if (script.length > 0)
    val = line.gsub(/{tags: [^}]+}/, '').strip
    system("echo \"#{val}\" | #{__dir__}/scripts/#{script}")
  end
end
