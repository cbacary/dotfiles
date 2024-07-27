function tmux. {
  # Get the name of the current working directory
  local session_name=$(basename "$PWD")

  #session_name="${PWD//\//\/\/}"
  #echo "$session_name"

  # Check if a tmux session with that name exists
  if tmux ls | grep -q "^$session_name:"; then
    # If it exists, attach to that session
    tmux attach-session -t "$session_name"
  else
    # If it doesn't exist, create a new session with that name
    tmux new-session -s "$session_name"
  fi
}


