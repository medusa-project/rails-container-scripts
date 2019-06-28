##
# Copies Docker environment variables from one of the Docker variable files
# into shell environment variables.
#

if [ $# -lt 1 ]
then
    echo "Usage: env.sh <filename>"
    exit 1
fi

while read p; do
  if [[ $p != "#"* && $p != "" ]]; then
    IFS='=' read -ra parts <<< "$p"
    export "${parts[0]}"="${parts[1]}"
  fi
done < rails-container-scripts/$1
