# Generated by stubbs:add-option. Do not edit, if using stubbs.
# Created: Sat Dec 19 14:44:48 PST 2015
#
#/ usage: rundeck-keys:delete  --keypath <>  --url <$RUNDECK_URL> [ --username <$RUNDECK_USER>] [ --password <$RUNDECK_PASSWORD>] [ --apikey <$RUNDECK_APIKEY>] 

# _rerun_options_parse_ - Parse the command arguments and set option variables.
#
#     rerun_options_parse "$@"
#
# Arguments:
#
# * the command options and their arguments
#
# Notes:
# 
# * Sets shell variables for any parsed options.
# * The "-?" help argument prints command usage and will exit 2.
# * Return 0 for successful option parse.
#
rerun_options_parse() {

    while (( "$#" > 0 ))
    do
        OPT="$1"
        case "$OPT" in
            --keypath) rerun_option_check $# $1; KEYPATH=$2 ; shift ;;
            --url) rerun_option_check $# $1; URL=$2 ; shift ;;
            --username) rerun_option_check $# $1; USERNAME=$2 ; shift ;;
            --password) rerun_option_check $# $1; PASSWORD=$2 ; shift ;;
            --apikey) rerun_option_check $# $1; APIKEY=$2 ; shift ;;
            # help option
            -|--*?)
                rerun_option_usage
                exit 2
                ;;
            # end of options, just arguments left
            *)
              break
        esac
        shift
    done

    # Set defaultable options.
    [[ -z "$URL" ]] && URL="$(rerun_property_get $RERUN_MODULE_DIR/options/url DEFAULT)"
    [[ -z "$USERNAME" ]] && USERNAME="$(rerun_property_get $RERUN_MODULE_DIR/options/username DEFAULT)"
    [[ -z "$PASSWORD" ]] && PASSWORD="$(rerun_property_get $RERUN_MODULE_DIR/options/password DEFAULT)"
    # Check required options are set
    [[ -z "$KEYPATH" ]] && { echo >&2 "missing required option: --keypath" ; return 2 ; }
    [[ -z "$URL" ]] && { echo >&2 "missing required option: --url" ; return 2 ; }
    # If option variables are declared exportable, export them.
    export URL
    export USERNAME
    export PASSWORD
    export APIKEY
    #
    return 0
}


# If not already set, initialize the options variables to null.
: ${KEYPATH:=}
: ${URL:=}
: ${USERNAME:=}
: ${PASSWORD:=}
: ${APIKEY:=}

