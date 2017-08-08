# opens an iterm2 terminal
tell application "iTerm"
  # keep a reference to the first terminal prompt and ...
  set firstSession to (current session of current window)
  # ... split it twice and remember the two other sessions.
  tell firstSession
    set thirdSession to (split horizontally with default profile)
    set secondSession to (split horizontally with default profile)
  end tell
  # position iTerm to the right
  set bounds of current window to {960, 26, 1439, 818}
  # run infinite loop until iTerm prompts become
  # ready to receive input
  repeat until (get is at shell prompt of firstSession) is true
    log ("waiting")
  end repeat
  # then start my developer processes in the various terminal prompts.
  tell firstSession
    write text "cd ~/Workspace-netlife/de-bergenske/de-bergenske"
    write text "npm run dev"
  end tell
  tell secondSession
    write text "cd ~/Workspace-netlife/de-bergenske/de-bergenske-local-db"
    write text "docker-compose up"
  end tell
  tell thirdSession
    write text "cd ~/Workspace-netlife/de-bergenske/de-bergenske"
    write text "atom ."
  end tell
end tell
# position the atom editor which was opened in the last terminal session
tell application "Atom"
  set bounds of first window to {0, 23, 960, 821}
end tell
