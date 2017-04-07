#!/bin/bash
# source ~/.bash_profile
export HISTTIMEFORMAT='%Y/%m/%d %T '
history -r ~/.bash_history
history > /tmp/command_history.`date +\%Y\%m\%d` 2>&1
history | ruby -r Date -nla -e 'puts $F.slice(1..-1).join(" ") if DateTime.parse("#{$F[1]} #{$F[2]} JST") > (DateTime.now - Rational(1, 24 * 60));' 2> /tmp/command_history.`date +\%Y\%m\%d` | sort | uniq > /tmp/command_history.`date +\%Y\%m\%d` 2>&1
# history | ruby -r Date -nla -e 'puts $F.slice(1..-1).join(" ") if DateTime.parse("#{$F[1]} #{$F[2]} JST") > (DateTime.now - Rational(1, 24 * 60));' | sort | uniq | /usr/local/bin/slackcat --channel random > /tmp/command_history.`date +\%Y\%m\%d` 2>&1
echo $HISTTIMEFORMAT > /tmp/command_history.`date +\%Y\%m\%d` 2>&1
echo "finish" > /tmp/command_history.`date +\%Y\%m\%d` 2>&1
