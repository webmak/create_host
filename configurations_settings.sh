#!/bin/bash
# 
#Copyright 2017 webmak10@gmail.com
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of 
#this software and associated documentation files (the "Software"), to deal in 
#the Software without restriction, including without limitation the rights to 
#use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
#of the Software, and to permit persons to whom the Software is furnished to do 
#so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all 
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
#THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS 
#IN THE SOFTWARE.

[[ ${configurations_settings:-} -eq 1 ]] && return || readonly configurations_settings=1
function print_settings {
    local template;
    if [ -z $template]
        then
            template=$(cat ./templates/questions.tpl);
    fi;
    print_template "$template" global_template_vars;
}

function change_settings {
    local action=$1;
    case $action in
        '1')
            echo 'Type domain:';
            read domain;
        ;;
        '2')
            echo 'Type user:';
            read user;
        ;;
        '3')
            echo 'Type php path:';
            read php_path;
        ;;
        '4')
            echo 'Type ip for hosts:';
            read hosts_ip;
        ;;
        '5')
            echo 'Type cms name:';
            read site_template;
        ;;
        '6')
            echo 'Type php prefix:';
            read php_prefix;
        ;;
        *)
            echo 'Incorrect selection. Press enter to continue.'; 
            read;
        ;;
    esac
    print_settings;
}

function configure_settings {
    print_settings;
    local action;
    while read action
    do
        if [ $action == '0' ]
            then
                break;
        else
            change_settings $action;
        fi
    done
}
