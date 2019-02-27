#!/usr/bin/env bash
readonly session=ClamAV
readonly session_dir=$HOME/Workshop/clamav

# TODO check we are in tmux already

if tmux has-session -t ${session} &> /dev/null; then
    tmux \
        switch-client -t ${session} \;\
        select-pane -t ${session}:1.4
    exit 0
fi

tmux \
    new-session -c ${session_dir} -s ${session} -n ${session} -d -x - -y - \
        "echo Waiting for clamd...; until [[ -S /usr/local/var/run/clamd.socket ]]; do sleep 1; done && clamdtop /usr/local/var/run/clamd.socket" \;\
    split-window -d -t ${session}:1 -p 70 \
        "/usr/local/sbin/clamd --foreground" \;\
    split-window -d -h -t ${session}:1.2 -p 50 \
        'freshclam -v && echo; while ! read -t 3600 -sq "?Will update ClamAV databases at $(date -v +1H +%d/%m\ %H:%M:%S); Press any key to do it now..."; do echo; echo; freshclam -v; echo; done' \;\
    split-window -d -t ${session}:1.3 -f \;\
    resize-pane -t ${session}:1.4 \;\
    send-keys -t ${session}:1.4 \
        C-l "clamdscan -mv /usr/local" \;\
    select-pane -t ${session}:1.1 -T "Monitor" \;\
    select-pane -t ${session}:1.2 -T "Daemon" \;\
    select-pane -t ${session}:1.3 -T "Updater" \;\
    select-pane -t ${session}:1.4 -T "Console"

tmux \
    switch-client -t ${session} \;\
    select-pane -t ${session}:1.4
