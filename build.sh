#!/usr/bin/env bash

set -euo pipefail

print_help() {
	echo 'build.sh [COMMAND]'
	echo '========================================================='
	echo ' [$1 = COMMAND]'
	echo ' --------------'
	echo ' Options:'
	echo '     - deploy'
	echo '       Automatically auth and redeploy the server assets'
	echo ''
	echo '     - help | h'
	echo '       Print this help and exit successfully'
	echo ''
	echo '     - anything else prints help and exits in failure'
	echo ''
}

main() {
	case "$1" in
		deploy)
			npx wrangler deploy -c wrangler.jsonc
			;;
		help|h)
			print_help
			return 0
			;;
		*)
			print_help
			return 1
			;;
	esac

}

main "$@"

