function todos --wraps='vdirsyncer sync && todo' --description 'alias todos=vdirsyncer sync && todo'
  vdirsyncer sync && todo $argv; 
end
